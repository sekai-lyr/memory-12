(function() {
    const userId = sessionStorage.getItem('userId');
    if (!userId) {
        window.location.href = '/login';
        return;
    }

    let currentPaperId = null;
    let currentSceneIndex = 0;
    let scenes = [];
    const draftKey = `paperDraft:${userId}`;
    let draftTimer = null;

    loadCharacters();
    loadPapers();
    restoreDraft();

    ['paperTitle', 'paperContent', 'characterSelect'].forEach(id => {
        document.getElementById(id).addEventListener('input', scheduleDraftSave);
        document.getElementById(id).addEventListener('change', scheduleDraftSave);
    });

    function scheduleDraftSave() {
        clearTimeout(draftTimer);
        setDraftStatus('正在保存草稿...');
        draftTimer = setTimeout(saveDraft, 400);
    }

    function saveDraft() {
        const draft = {
            title: document.getElementById('paperTitle').value,
            content: document.getElementById('paperContent').value,
            characterId: document.getElementById('characterSelect').value
        };
        localStorage.setItem(draftKey, JSON.stringify(draft));
        setDraftStatus('草稿已自动保存');
    }

    function restoreDraft() {
        try {
            const draft = JSON.parse(localStorage.getItem(draftKey));
            if (!draft) return;
            document.getElementById('paperTitle').value = draft.title || '';
            document.getElementById('paperContent').value = draft.content || '';
            document.getElementById('characterSelect').dataset.draftValue = draft.characterId || '';
            setDraftStatus('已恢复上次未提交的草稿');
        } catch (e) {
            localStorage.removeItem(draftKey);
        }
    }

    function setDraftStatus(message) {
        document.getElementById('draftStatus').textContent = message;
    }

    async function loadCharacters() {
        try {
            const res = await fetch('/api/character/list');
            const data = await res.json();
            if (data.success) {
                const select = document.getElementById('characterSelect');
                data.data.forEach(char => {
                    const opt = document.createElement('option');
                    opt.value = char.id;
                    opt.textContent = `${char.name} (${char.series})`;
                    select.appendChild(opt);
                });
                if (select.dataset.draftValue) {
                    select.value = select.dataset.draftValue;
                    delete select.dataset.draftValue;
                }
            }
        } catch (e) {
            console.error('Failed to load characters:', e);
        }
    }

    async function loadPapers() {
        try {
            const res = await fetch(`/api/paper/user/${userId}`);
            const data = await res.json();
            if (data.success) {
                renderPaperList(data.data || []);
            }
        } catch (e) {
            console.error('Failed to load papers:', e);
        }
    }

    function renderPaperList(papers) {
        const list = document.getElementById('paperList');
        if (papers.length === 0) {
            list.innerHTML = '<div class="empty-hint">暂无论文，上传一篇试试吧</div>';
            return;
        }
        list.innerHTML = papers.map(p => `
            <div class="paper-item" onclick="selectPaper(${p.id})">
                <button class="paper-delete-btn" type="button" aria-label="删除论文"
                    onclick="event.stopPropagation(); deletePaper(${p.id})">删除</button>
                <div class="paper-item-title">${escapeHtml(p.title)}</div>
                <div class="paper-item-meta">${p.fileType || 'txt'} · ${p.createdAt ? p.createdAt.substring(0, 10) : ''}</div>
                <span class="paper-item-status status-${p.status}">${
                    p.status === 'ready' ? '已生成' : p.status === 'processing' ? '生成中' : '待生成'
                }</span>
            </div>
        `).join('');
    }

    window.uploadPaper = async function() {
        const title = document.getElementById('paperTitle').value.trim();
        const content = document.getElementById('paperContent').value.trim();
        const characterId = document.getElementById('characterSelect').value;

        if (!title || !content) {
            if (window.showMotionToast) window.showMotionToast('请填写标题和内容', 'error');
            else alert('请填写标题和内容');
            return;
        }

        try {
            const res = await fetch('/api/paper/upload', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    userId: parseInt(userId),
                    title,
                    contentText: content,
                    fileType: 'txt',
                    characterId
                })
            });
            const data = await res.json();
            if (data.success) {
                const paperId = data.data.id;
                // 自动生成对话
                const genRes = await fetch(`/api/paper/${paperId}/generate`, { method: 'POST' });
                const genData = await genRes.json();
                if (genData.success) {
                    if (window.showMotionToast) window.showMotionToast('论文上传成功，对话已生成');
                    else alert('论文上传成功，对话已生成！');
                    document.getElementById('paperTitle').value = '';
                    document.getElementById('paperContent').value = '';
                    document.getElementById('characterSelect').value = '';
                    localStorage.removeItem(draftKey);
                    setDraftStatus('');
                    loadPapers();
                    selectPaper(paperId);
                } else {
                    if (window.showMotionToast) window.showMotionToast(genData.message || '生成失败', 'error');
                    else alert(genData.message || '生成失败');
                }
            } else {
                if (window.showMotionToast) window.showMotionToast(data.message || '上传失败', 'error');
                else alert(data.message || '上传失败');
            }
        } catch (e) {
            if (window.showMotionToast) window.showMotionToast('上传失败，请稍后重试', 'error');
            else alert('上传失败，请稍后重试');
        }
    };

    window.deletePaper = async function(paperId) {
        if (!confirm('确定删除这篇论文及其生成的全部场景吗？')) return;

        try {
            const res = await fetch(`/api/paper/${paperId}?userId=${encodeURIComponent(userId)}`, {
                method: 'DELETE'
            });
            const data = await res.json();
            if (!data.success) {
                if (window.showMotionToast) window.showMotionToast(data.message || '删除失败', 'error');
                else alert(data.message || '删除失败');
                return;
            }
            if (currentPaperId === paperId) {
                currentPaperId = null;
                scenes = [];
                showEmptyScene();
            }
            await loadPapers();
        } catch (e) {
            if (window.showMotionToast) window.showMotionToast('删除失败，请稍后重试', 'error');
            else alert('删除失败，请稍后重试');
        }
    };

    window.selectPaper = async function(paperId) {
        currentPaperId = paperId;
        currentSceneIndex = 0;

        try {
            const res = await fetch(`/api/paper/${paperId}/scenes`);
            const data = await res.json();
            if (data.success) {
                scenes = data.data || [];
                if (scenes.length === 0) {
                    showEmptyScene();
                } else {
                    renderScene();
                }
            }
        } catch (e) {
            console.error('Failed to load scenes:', e);
        }
    };

    function renderScene() {
        const container = document.getElementById('galgameContainer');
        if (scenes.length === 0) {
            showEmptyScene();
            return;
        }

        const scene = scenes[currentSceneIndex];
        if (!scene) return;

        const dialogues = JSON.parse(scene.dialogueJson || '[]');
        const chapterTitle = scene.chapterTitle || `第${currentSceneIndex + 1}部分`;

        let html = `
            <div class="galgame-scene">
                <div class="galgame-chapter">${escapeHtml(chapterTitle)}</div>
                <div class="galgame-dialogues">
                    ${dialogues.map(d => `
                        <div class="dialogue-item">
                            <div class="dialogue-avatar">${getSpeakerEmoji(d.speaker)}</div>
                            <div class="dialogue-bubble ${d.type === 'hint' ? 'hint-bubble' : ''}">
                                <div class="dialogue-speaker">${escapeHtml(d.speaker)}</div>
                                <div class="dialogue-text">${escapeHtml(d.text)}</div>
                                ${d.emotion ? `<div class="dialogue-emotion">[${d.emotion}]</div>` : ''}
                            </div>
                        </div>
                    `).join('')}
                </div>
                <div class="galgame-controls">
                    <button class="galgame-btn" onclick="prevScene()" ${currentSceneIndex === 0 ? 'disabled' : ''}>上一章</button>
                    <span style="color:var(--text-dim);font-size:13px;padding:8px 12px;">
                        ${currentSceneIndex + 1} / ${scenes.length}
                    </span>
                    <button class="galgame-btn" onclick="nextScene()" ${currentSceneIndex >= scenes.length - 1 ? 'disabled' : ''}>下一章</button>
                </div>
            </div>
        `;
        container.innerHTML = html;
    }

    function showEmptyScene() {
        document.getElementById('galgameContainer').innerHTML = `
            <div class="galgame-empty">
                <div class="empty-icon">🎮</div>
                <p>选择一篇论文，开始角色对话学习</p>
                <p class="empty-sub">角色将通过对话为你讲解知识</p>
            </div>
        `;
    }

    window.prevScene = function() {
        if (currentSceneIndex > 0) {
            currentSceneIndex--;
            renderScene();
        }
    };

    window.nextScene = function() {
        if (currentSceneIndex < scenes.length - 1) {
            currentSceneIndex++;
            renderScene();
        }
    };

    function getSpeakerEmoji(speaker) {
        if (speaker.includes('初音')) return '🎵';
        if (speaker.includes('灵梦')) return '⛩️';
        if (speaker.includes('铃仙')) return '🐰';
        if (speaker.includes('蕾姆')) return '💙';
        if (speaker.includes('红莉栖')) return '🧪';
        if (speaker === 'system') return '💡';
        return '👤';
    }

    function escapeHtml(str) {
        if (!str) return '';
        return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
    }
})();
