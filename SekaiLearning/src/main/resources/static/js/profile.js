(function() {
    const userId = sessionStorage.getItem('userId');
    if (!userId) {
        window.location.href = '/login';
        return;
    }

    loadProfile();
    loadAchievements();

    async function loadProfile() {
        try {
            const res = await fetch(`/api/auth/user/${userId}`);
            const data = await res.json();
            if (data.success) {
                const user = data.data;
                document.getElementById('profileNickname').textContent = user.nickname || user.username;
                document.getElementById('profileUsername').textContent = '@' + user.username;
                document.getElementById('navCoins').textContent = user.coins || 0;
                document.getElementById('navLevel').textContent = user.level || 1;
                document.getElementById('pstatLevel').textContent = user.level || 1;
                document.getElementById('pstatExp').textContent = user.expPoints || 0;
                document.getElementById('pstatCoins').textContent = user.coins || 0;
                document.getElementById('pstatStreak').textContent = user.streakDays || 0;

                const nextLevelExp = (user.level || 1) * 100;
                document.getElementById('expText').textContent = `${user.expPoints || 0} / ${nextLevelExp} EXP`;
                const pct = Math.min(((user.expPoints || 0) / nextLevelExp) * 100, 100);
                document.getElementById('expFill').style.width = pct + '%';
            }
        } catch (e) {
            console.error('Failed to load profile:', e);
        }
    }

    async function loadAchievements() {
        try {
            const res = await fetch(`/api/achievement/user/${userId}`);
            const data = await res.json();
            if (data.success) {
                renderAchievements(data.data || []);
            }
        } catch (e) {
            console.error('Failed to load achievements:', e);
        }
    }

    function renderAchievements(achievements) {
        const grid = document.getElementById('achievementsGrid');
        if (achievements.length === 0) {
            grid.innerHTML = '<div class="empty-hint">暂无成就</div>';
            return;
        }
        grid.innerHTML = achievements.map(a => `
            <div class="achievement-card ${a.unlocked ? 'unlocked' : ''}">
                <div class="ach-icon">${a.icon || '🏆'}</div>
                <div class="ach-info">
                    <div class="ach-name">${escapeHtml(a.name)}</div>
                    <div class="ach-desc">${escapeHtml(a.description)}</div>
                </div>
            </div>
        `).join('');
    }

    window.logout = function() {
        sessionStorage.clear();
        window.location.href = '/login';
    };

    function escapeHtml(str) {
        if (!str) return '';
        return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
    }
})();
