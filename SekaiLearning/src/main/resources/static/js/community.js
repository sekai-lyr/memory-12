(function() {
    const userId = sessionStorage.getItem('userId');
    if (!userId) {
        window.location.href = '/login';
        return;
    }

    let currentCreationId = null;
    let allCreations = [];
    const draftKey = `creationDraft:${userId}`;
    let draftTimer = null;

    loadCreations();
    restoreDraft();

    ['creationTitle', 'creationContent', 'creationType', 'creationTags'].forEach(id => {
        const element = document.getElementById(id);
        element.addEventListener('input', scheduleDraftSave);
        element.addEventListener('change', scheduleDraftSave);
    });
    document.getElementById('creationSearch').addEventListener('input', applyFilters);
    document.getElementById('creationTypeFilter').addEventListener('change', applyFilters);

    async function loadCreations() {
        const list = document.getElementById('creationsList');
        list.innerHTML = '<div class="empty-hint">作品加载中...</div>';
        try {
            const res = await fetch('/api/creation/recent?limit=20');
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            const data = await res.json();
            if (data.success) {
                allCreations = data.data || [];
                applyFilters();
            } else {
                throw new Error(data.message || '加载失败');
            }
        } catch (e) {
            console.error('Failed to load creations:', e);
            list.innerHTML = `
                <div class="empty-hint">
                    作品加载失败
                    <br><button class="retry-btn" type="button" onclick="retryLoadCreations()">重新加载</button>
                </div>
            `;
        }
    }

    window.retryLoadCreations = loadCreations;

    function applyFilters() {
        const keyword = document.getElementById('creationSearch').value.trim().toLowerCase();
        const type = document.getElementById('creationTypeFilter').value;
        const filtered = allCreations.filter(creation => {
            const matchesType = !type || creation.creationType === type;
            const searchable = `${creation.title || ''} ${creation.content || ''}`.toLowerCase();
            return matchesType && (!keyword || searchable.includes(keyword));
        });
        document.getElementById('feedCount').textContent = `${filtered.length} / ${allCreations.length}`;
        renderCreations(filtered, allCreations.length > 0);
    }

    function renderCreations(creations, isFiltered = false) {
        const list = document.getElementById('creationsList');
        if (creations.length === 0) {
            list.innerHTML = `<div class="empty-hint">${
                isFiltered ? '没有符合条件的作品' : '暂无创作，来发布第一篇吧！'
            }</div>`;
            return;
        }

        list.innerHTML = creations.map(c => {
            const typeLabels = { note: '📝 学习笔记', artwork: '🎨 二次创作', voice: '🎤 配音作品', other: '📎 其他' };
            return `
                <div class="creation-card" onclick="openCreation(${c.id})">
                    <div class="creation-meta">
                        <span class="creation-type-badge type-${c.creationType}">${typeLabels[c.creationType] || c.creationType}</span>
                        <span class="creation-date">${c.createdAt ? c.createdAt.substring(0, 10) : ''}</span>
                    </div>
                    <div class="creation-title">${escapeHtml(c.title)}</div>
                    <div class="creation-preview">${escapeHtml(c.content || '')}</div>
                    <div class="creation-footer">
                        <span>♡ ${c.likesCount || 0}</span>
                        <span>💬 ${c.commentsCount || 0}</span>
                    </div>
                </div>
            `;
        }).join('');
    }

    function scheduleDraftSave() {
        clearTimeout(draftTimer);
        setDraftStatus('正在保存草稿...');
        draftTimer = setTimeout(saveDraft, 400);
    }

    function saveDraft() {
        const draft = {
            title: document.getElementById('creationTitle').value,
            content: document.getElementById('creationContent').value,
            type: document.getElementById('creationType').value,
            tags: document.getElementById('creationTags').value
        };
        localStorage.setItem(draftKey, JSON.stringify(draft));
        setDraftStatus('草稿已自动保存');
    }

    function restoreDraft() {
        try {
            const draft = JSON.parse(localStorage.getItem(draftKey));
            if (!draft) return;
            document.getElementById('creationTitle').value = draft.title || '';
            document.getElementById('creationContent').value = draft.content || '';
            document.getElementById('creationType').value = draft.type || 'note';
            document.getElementById('creationTags').value = draft.tags || '';
            setDraftStatus('已恢复上次未发布的草稿');
        } catch (e) {
            localStorage.removeItem(draftKey);
        }
    }

    function setDraftStatus(message) {
        document.getElementById('creationDraftStatus').textContent = message;
    }

    window.publishCreation = async function() {
        const title = document.getElementById('creationTitle').value.trim();
        const content = document.getElementById('creationContent').value.trim();
        const type = document.getElementById('creationType').value;
        const tags = document.getElementById('creationTags').value.trim();

        if (!title || !content) {
            if (window.showMotionToast) window.showMotionToast('请填写标题和内容', 'error');
            else alert('请填写标题和内容');
            return;
        }

        const tagsArray = tags ? tags.split(',').map(t => t.trim()) : [];

        try {
            const res = await fetch('/api/creation/create', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    userId: parseInt(userId),
                    title,
                    content,
                    creationType: type,
                    tagsJson: JSON.stringify(tagsArray)
                })
            });
            const data = await res.json();
            if (data.success) {
                if (window.showMotionToast) window.showMotionToast('发布成功，作品已加入社群');
                else alert('发布成功！');
                document.getElementById('creationTitle').value = '';
                document.getElementById('creationContent').value = '';
                document.getElementById('creationType').value = 'note';
                document.getElementById('creationTags').value = '';
                localStorage.removeItem(draftKey);
                setDraftStatus('');
                loadCreations();
            } else {
                if (window.showMotionToast) window.showMotionToast(data.message || '发布失败', 'error');
                else alert(data.message || '发布失败');
            }
        } catch (e) {
            if (window.showMotionToast) window.showMotionToast('发布失败，请稍后重试', 'error');
            else alert('发布失败，请稍后重试');
        }
    };

    window.openCreation = async function(creationId) {
        currentCreationId = creationId;
        try {
            const res = await fetch(`/api/creation/${creationId}`);
            const data = await res.json();
            if (data.success) {
                const c = data.data;
                document.getElementById('detailTitle').textContent = c.title;
                document.getElementById('detailBody').textContent = c.content || '';
                document.getElementById('likesCount').textContent = c.likesCount || 0;
                loadComments(creationId);
            }
        } catch (e) {
            console.error('Failed to load creation:', e);
        }
        document.getElementById('detailModal').style.display = 'flex';
    };

    window.closeDetail = function() {
        document.getElementById('detailModal').style.display = 'none';
    };

    window.toggleLike = async function() {
        if (!currentCreationId) return;
        try {
            const res = await fetch(`/api/creation/${currentCreationId}/like`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ userId: parseInt(userId) })
            });
            const data = await res.json();
            if (data.success) {
                document.getElementById('likesCount').textContent = data.data.likesCount;
                const btn = document.getElementById('likeBtn');
                btn.classList.toggle('liked', data.data.liked);
                btn.textContent = data.data.liked ? '♥ 已赞' : '♡ 点赞';
            }
        } catch (e) {
            console.error('Failed to toggle like:', e);
        }
    };

    async function loadComments(creationId) {
        try {
            const res = await fetch(`/api/creation/${creationId}/comments`);
            const data = await res.json();
            if (data.success) {
                const list = document.getElementById('commentsList');
                if ((data.data || []).length === 0) {
                    list.innerHTML = '<div class="empty-hint" style="font-size:12px;">暂无评论</div>';
                } else {
                    list.innerHTML = data.data.map(c => `
                        <div class="comment-item">
                            <div class="comment-user">用户 #${c.userId}</div>
                            <div class="comment-text">${escapeHtml(c.content)}</div>
                        </div>
                    `).join('');
                }
            }
        } catch (e) {
            console.error('Failed to load comments:', e);
        }
    }

    window.addComment = async function() {
        if (!currentCreationId) return;
        const content = document.getElementById('commentInput').value.trim();
        if (!content) return;

        try {
            const res = await fetch(`/api/creation/${currentCreationId}/comment`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    userId: parseInt(userId),
                    content
                })
            });
            const data = await res.json();
            if (data.success) {
                document.getElementById('commentInput').value = '';
                loadComments(currentCreationId);
            }
        } catch (e) {
            if (window.showMotionToast) window.showMotionToast('评论失败', 'error');
            else alert('评论失败');
        }
    };

    function escapeHtml(str) {
        if (!str) return '';
        return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
    }
})();
