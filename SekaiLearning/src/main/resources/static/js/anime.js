(function() {
    const userId = sessionStorage.getItem('userId');
    if (!userId) {
        window.location.href = '/login';
        return;
    }

    loadClips('');

    async function loadClips(difficulty) {
        const url = difficulty ? `/api/anime/clips/${difficulty}` : '/api/anime/clips';
        try {
            const res = await fetch(url);
            const data = await res.json();
            if (data.success) {
                renderClips(data.data || []);
            }
        } catch (e) {
            console.error('Failed to load clips:', e);
        }
    }

    function renderClips(clips) {
        const grid = document.getElementById('clipsGrid');
        if (clips.length === 0) {
            grid.innerHTML = '<div class="empty-hint">暂无动漫片段</div>';
            return;
        }

        grid.innerHTML = clips.map(clip => {
            const tags = JSON.parse(clip.tagsJson || '[]');
            return `
                <div class="clip-card" onclick="openClip(${clip.id})">
                    <div class="clip-cover">
                        🎬
                        <span class="clip-difficulty diff-${clip.difficulty}">${clip.difficulty}</span>
                    </div>
                    <div class="clip-info">
                        <div class="clip-anime">${escapeHtml(clip.animeName || '未知')}</div>
                        <div class="clip-title">${escapeHtml(clip.title)}</div>
                        <div class="clip-meta">
                            <span>第${clip.episode || '?'}集</span>
                            <span>${clip.viewCount || 0} 次学习</span>
                        </div>
                    </div>
                </div>
            `;
        }).join('');
    }

    window.filterClips = function(difficulty) {
        document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
        event.target.classList.add('active');
        loadClips(difficulty);
    };

    window.openClip = async function(clipId) {
        try {
            const res = await fetch(`/api/anime/clip/${clipId}`);
            const data = await res.json();
            if (data.success) {
                showSubtitleModal(data.data);
            }
        } catch (e) {
            console.error('Failed to load clip:', e);
        }
    };

    function showSubtitleModal(clip) {
        document.getElementById('clipTitle').textContent = clip.title;
        const subtitles = JSON.parse(clip.subtitleJson || '[]');
        const area = document.getElementById('subtitleArea');

        if (subtitles.length === 0) {
            area.innerHTML = '<div class="empty-hint">暂无字幕数据</div>';
        } else {
            area.innerHTML = subtitles.map((sub, i) => `
                <div class="subtitle-line" onclick="highlightLine(${i})">
                    <div>
                        <div class="subtitle-jp">${escapeHtml(sub.jp || '')}</div>
                        <div class="subtitle-cn">${escapeHtml(sub.cn || '')}</div>
                        ${sub.keywords ? `
                            <div class="subtitle-keywords">
                                ${sub.keywords.split(',').map(k => `<span class="keyword-tag">${escapeHtml(k.trim())}</span>`).join('')}
                            </div>
                        ` : ''}
                    </div>
                </div>
            `).join('');
        }

        document.getElementById('subtitleModal').style.display = 'flex';
    }

    window.closeSubtitleModal = function() {
        document.getElementById('subtitleModal').style.display = 'none';
    };

    window.highlightLine = function(index) {
        document.querySelectorAll('.subtitle-line').forEach((el, i) => {
            el.classList.toggle('active', i === index);
        });
    };

    window.playClip = function() {
        alert('播放功能需要接入视频资源');
    };

    window.playSlow = function() {
        alert('慢速播放功能需要接入视频资源');
    };

    function escapeHtml(str) {
        if (!str) return '';
        return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
    }
})();
