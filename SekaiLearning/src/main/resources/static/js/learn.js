(function() {
    const userId = sessionStorage.getItem('userId');
    if (!userId) {
        window.location.href = '/login';
        return;
    }

    loadUserData();

    async function loadUserData() {
        try {
            const res = await fetch(`/api/auth/user/${userId}/stats`);
            const data = await res.json();
            if (data.success) {
                const stats = data.data;
                
                // Animate number counters
                animateNumber('navCoins', stats.coins || 0);
                animateNumber('navLevel', stats.level || 1);
                animateNumber('statLevel', stats.level || 1);
                animateNumber('statExp', stats.expPoints || 0);
                animateNumber('statStreak', stats.streakDays || 0);

                // Update exp bar
                const nextLevelExp = (stats.level || 1) * 100;
                const currentExp = stats.expPoints || 0;
                document.getElementById('expProgress').textContent = `${currentExp} / ${nextLevelExp}`;
                const pct = Math.min((currentExp / nextLevelExp) * 100, 100);
                
                // Delay bar animation for visual effect
                setTimeout(() => {
                    document.getElementById('expBarFill').style.width = pct + '%';
                }, 300);
            }
        } catch (e) {
            console.error('Failed to load user data:', e);
        }

        try {
            const res = await fetch(`/api/paper/user/${userId}`);
            const data = await res.json();
            if (data.success) {
                animateNumber('statPapers', (data.data || []).length);
            }
        } catch (e) {
            console.error('Failed to load papers:', e);
        }
    }

    function animateNumber(elementId, target) {
        const el = document.getElementById(elementId);
        if (!el) return;
        
        const current = parseInt(el.textContent) || 0;
        if (current === target) return;
        
        const duration = 800;
        const startTime = performance.now();
        
        function update(now) {
            const elapsed = now - startTime;
            const progress = Math.min(elapsed / duration, 1);
            // Ease out cubic
            const eased = 1 - Math.pow(1 - progress, 3);
            const value = Math.round(current + (target - current) * eased);
            el.textContent = value;
            
            if (progress < 1) {
                requestAnimationFrame(update);
            }
        }
        
        requestAnimationFrame(update);
    }

    window.showCheckin = function() {
        document.getElementById('checkinModal').style.display = 'flex';
    };

    window.hideCheckin = function() {
        const modal = document.getElementById('checkinModal');
        modal.style.opacity = '0';
        setTimeout(() => {
            modal.style.display = 'none';
            modal.style.opacity = '';
        }, 200);
    };

    window.doCheckin = async function() {
        const btn = document.querySelector('.checkin-confirm-btn');
        btn.disabled = true;
        btn.textContent = '处理中...';

        try {
            const res = await fetch(`/api/user/${userId}/checkin`, { method: 'POST' });
            const data = await res.json();
            if (data.success && data.data.success) {
                btn.textContent = '✅ 已打卡！';
                btn.style.background = 'linear-gradient(135deg, var(--sage), var(--blue))';
                if (window.showMotionToast) window.showMotionToast('今日签到完成，金币已到账');
                
                animateNumber('navCoins', data.data.totalCoins);
                
                setTimeout(() => {
                    hideCheckin();
                    btn.disabled = false;
                    btn.textContent = '确认';
                    btn.style.background = '';
                    loadUserData();
                }, 1000);
            } else {
                if (window.showMotionToast) window.showMotionToast(data.data.message || '签到失败', 'error');
                else alert(data.data.message || '签到失败');
                btn.disabled = false;
                btn.textContent = '确认';
                hideCheckin();
            }
        } catch (e) {
            if (window.showMotionToast) window.showMotionToast('签到失败，请稍后重试', 'error');
            else alert('签到失败，请稍后重试');
            btn.disabled = false;
            btn.textContent = '确认';
        }
    };

    // Close modal on escape
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            hideCheckin();
        }
    });
})();
