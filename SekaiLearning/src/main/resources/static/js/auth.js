(function() {
    const form = document.getElementById('loginForm') || document.getElementById('registerForm');
    const errorEl = document.getElementById('errorMsg');
    const submitBtn = form.querySelector('.auth-btn');
    const isLogin = !!document.getElementById('loginForm');
    let isLoading = false;

    // Focus first input
    document.getElementById('username').focus();

    // Enter key navigation
    document.getElementById('username').addEventListener('keydown', (e) => {
        if (e.key === 'Enter') {
            e.preventDefault();
            document.getElementById('password').focus();
        }
    });

    form.addEventListener('submit', async (e) => {
        e.preventDefault();
        if (isLoading) return;

        errorEl.textContent = '';
        errorEl.classList.remove('shake');

        const username = document.getElementById('username').value.trim();
        const password = document.getElementById('password').value;

        if (!username || !password) {
            showError('请填写所有必填项');
            return;
        }

        if (!isLogin && password.length < 6) {
            showError('密码至少需要6位');
            return;
        }

        setLoading(true);

        const url = isLogin ? '/api/auth/login' : '/api/auth/register';
        const body = { username, password };
        if (!isLogin) {
            body.nickname = document.getElementById('nickname').value.trim() || username;
        }

        try {
            const res = await fetch(url, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(body)
            });
            const data = await res.json();

            if (data.success) {
                sessionStorage.setItem('userId', data.data.userId);
                sessionStorage.setItem('username', data.data.username);
                sessionStorage.setItem('nickname', data.data.nickname || username);
                if (data.data.coins) sessionStorage.setItem('coins', data.data.coins);
                if (data.data.level) sessionStorage.setItem('level', data.data.level);
                if (data.data.expPoints) sessionStorage.setItem('expPoints', data.data.expPoints);

                // Success animation
                submitBtn.style.background = 'linear-gradient(135deg, #00ff66, #00e5ff)';
                submitBtn.querySelector('.btn-text').textContent = isLogin ? '> ACCESS_GRANTED' : '> IDENTITY_CREATED';
                
                setTimeout(() => {
                    window.location.href = '/learn';
                }, 600);
            } else {
                showError(data.message || '操作失败');
                setLoading(false);
            }
        } catch (err) {
            showError('网络错误，请稍后重试');
            setLoading(false);
        }
    });

    function showError(msg) {
        errorEl.textContent = msg;
        errorEl.classList.add('shake');
        setTimeout(() => errorEl.classList.remove('shake'), 400);
    }

    function setLoading(loading) {
        isLoading = loading;
        submitBtn.classList.toggle('loading', loading);
        submitBtn.disabled = loading;
        
        const inputs = form.querySelectorAll('input');
        inputs.forEach(input => input.disabled = loading);
    }
})();
