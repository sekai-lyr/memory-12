(function () {
    'use strict';

    const reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)');
    const canAnimate = typeof Element !== 'undefined' && 'animate' in Element.prototype;
    const revealSelectors = [
        '.navbar', '.hero-card', '.courses-hero', '.paper-header', '.anime-header',
        '.community-header', '.profile-header', '.dashboard-section',
        '.daily-tasks-section', '.characters-section', '.paper-layout', '#subjectsView',
        '.clips-grid', '.community-layout', '.profile-stats-grid', '.exp-section',
        '.achievements-section', '.coin-log-section', '.difficulty-filter'
    ];
    const surfaceSelector = [
        '.feature-card', '.stat-card', '.task-item', '.character-card', '.subject-card',
        '.course-card', '.lesson-item', '.video-card', '.paper-item', '.clip-card',
        '.creation-card', '.achievement-card', '.comment-item', '.pstat-card',
        '.key-point-item', '.hint', '.subtitle-line', '.char-option', '.dialogue-msg',
        '.checkin-btn', '.submit-btn', '.auth-btn', '.btn-primary', '.btn-secondary',
        '.galgame-btn', '.play-btn', '.filter-btn'
    ].join(',');
    const modalSelectors = '.checkin-modal,.subtitle-modal,.detail-modal,.video-modal-overlay,.quiz-result-overlay';
    let revealObserver;
    let domObserver;
    let modalObserver;
    let toastStack;

    function makeProgress() {
        if (document.querySelector('.page-progress')) return;
        const progress = document.createElement('div');
        progress.className = 'page-progress';
        progress.setAttribute('aria-hidden', 'true');
        document.body.appendChild(progress);
    }

    function motionDelay(element, fallback) {
        const parent = element.parentElement;
        if (!parent) return fallback || 0;
        const siblings = Array.from(parent.children).filter(child => child.matches(surfaceSelector));
        const index = siblings.indexOf(element);
        return index >= 0 ? Math.min(index * 70, 420) : (fallback || 0);
    }

    function finishReveal(element) {
        element.classList.remove('motion-pending');
        element.classList.add('motion-revealed');
    }

    function reveal(element) {
        if (!element || element.dataset.motionRevealed === 'true') return;
        element.dataset.motionRevealed = 'true';
        if (reduceMotion.matches || !canAnimate) {
            finishReveal(element);
            return;
        }

        const animation = element.animate(
            [
                { opacity: 0, transform: 'translateY(22px)' },
                { opacity: 1, transform: 'translateY(0)' }
            ],
            {
                duration: 620,
                delay: Number(element.dataset.motionDelay || 0),
                easing: 'cubic-bezier(.16,1,.3,1)',
                fill: 'both'
            }
        );
        animation.finished.then(() => {
            finishReveal(element);
            animation.cancel();
        }).catch(() => finishReveal(element));
    }

    function prepareReveal(element, delay) {
        if (!(element instanceof Element) || element.dataset.motionPrepared === 'true') return;
        element.dataset.motionPrepared = 'true';
        element.dataset.motionDelay = String(delay || 0);
        element.setAttribute('data-motion-reveal', '');
        element.classList.add('motion-pending');

        if (reduceMotion.matches || !revealObserver) {
            reveal(element);
        } else {
            revealObserver.observe(element);
        }
    }

    function prepareTree(root) {
        if (!(root instanceof Element)) return;
        markLoading(root);
        if (root.matches(revealSelectors.join(','))) {
            prepareReveal(root, 0);
        }
        if (root.matches(surfaceSelector)) {
            prepareReveal(root, motionDelay(root, 100));
            prepareSurface(root);
        }
        if (root.matches(modalSelectors)) observeModal(root);
        root.querySelectorAll(revealSelectors.join(',')).forEach(element => prepareReveal(element, 0));
        root.querySelectorAll(surfaceSelector).forEach(element => {
            prepareReveal(element, motionDelay(element, 100));
            prepareSurface(element);
        });
        root.querySelectorAll(modalSelectors).forEach(observeModal);
        root.querySelectorAll('.empty-hint').forEach(markLoading);
    }

    function markLoading(element) {
        if (element instanceof Element && /加载中|处理中/.test(element.textContent || '')) {
            element.classList.add('motion-loading');
        }
    }

    function setupReveals() {
        if ('IntersectionObserver' in window) {
            revealObserver = new IntersectionObserver(entries => {
                entries.forEach(entry => {
                    if (!entry.isIntersecting) return;
                    reveal(entry.target);
                    revealObserver.unobserve(entry.target);
                });
            }, { threshold: 0.12, rootMargin: '0px 0px -6% 0px' });
        }

        prepareTree(document.body);
        if (!revealObserver) {
            document.querySelectorAll('[data-motion-reveal]').forEach(reveal);
        }

        domObserver = new MutationObserver(records => {
            records.forEach(record => {
                record.addedNodes.forEach(node => {
                    if (node instanceof Element) prepareTree(node);
                });
            });
        });
        domObserver.observe(document.body, { childList: true, subtree: true });
    }

    function prepareSurface(element) {
        if (!(element instanceof Element) || element.dataset.motionSurface === 'true') return;
        element.dataset.motionSurface = 'true';
        element.classList.add('motion-surface', 'motion-clickable');
        element.addEventListener('pointermove', event => {
            if (event.pointerType === 'touch') return;
            const rect = element.getBoundingClientRect();
            element.style.setProperty('--motion-x', `${((event.clientX - rect.left) / rect.width) * 100}%`);
            element.style.setProperty('--motion-y', `${((event.clientY - rect.top) / rect.height) * 100}%`);
        });
        element.addEventListener('pointerleave', () => {
            element.style.removeProperty('--motion-x');
            element.style.removeProperty('--motion-y');
        });
    }

    function setupSurfaces() {
        document.querySelectorAll(surfaceSelector).forEach(prepareSurface);
    }

    function setupRipples() {
        document.addEventListener('pointerdown', event => {
            if (event.pointerType === 'touch') return;
            const target = event.target.closest('button, a.nav-link, .feature-card, .subject-card, .course-card, .lesson-item, .video-card, .paper-item, .clip-card, .creation-card');
            if (!target || target.disabled || target.closest('.modal-overlay')) return;
            const rect = target.getBoundingClientRect();
            const ripple = document.createElement('span');
            ripple.className = 'motion-ripple';
            ripple.style.left = `${event.clientX - rect.left}px`;
            ripple.style.top = `${event.clientY - rect.top}px`;
            target.appendChild(ripple);
            requestAnimationFrame(() => ripple.classList.add('is-active'));
            window.setTimeout(() => ripple.remove(), 520);
        });
    }

    function setupLoadingStates() {
        document.querySelectorAll('.empty-hint').forEach(element => {
            if (/加载中|处理中/.test(element.textContent || '')) element.classList.add('motion-loading');
        });
    }

    function setupModalMotion() {
        modalObserver = new MutationObserver(records => {
            records.forEach(record => {
                if (record.type !== 'attributes' || record.attributeName !== 'style') return;
                const modal = record.target;
                if (!(modal instanceof Element) || !modal.matches(modalSelectors)) return;
                if (getComputedStyle(modal).display === 'none') {
                    modal.removeAttribute('data-motion-modal-open');
                    return;
                }
                if (modal.dataset.motionModalOpen === 'true') return;
                modal.dataset.motionModalOpen = 'true';
                const panel = modal.querySelector('.modal-content,.subtitle-content,.detail-content,.video-modal,.quiz-result-card');
                if (!panel || reduceMotion.matches || !canAnimate) return;
                panel.animate(
                    [
                        { opacity: 0, transform: 'translateY(18px) scale(.94)' },
                        { opacity: 1, transform: 'translateY(0) scale(1)' }
                    ],
                    { duration: 360, easing: 'cubic-bezier(.16,1,.3,1)', fill: 'both' }
                );
            });
        });
        document.querySelectorAll(modalSelectors).forEach(observeModal);
    }

    function observeModal(modal) {
        if (!modalObserver || !(modal instanceof Element) || modal.dataset.motionModalObserved === 'true') return;
        modal.dataset.motionModalObserved = 'true';
        modalObserver.observe(modal, { attributes: true });
    }

    function showToast(message, tone) {
        if (!toastStack) {
            toastStack = document.createElement('div');
            toastStack.className = 'motion-toast-stack';
            toastStack.setAttribute('aria-live', 'polite');
            document.body.appendChild(toastStack);
        }
        const toast = document.createElement('div');
        toast.className = `motion-toast ${tone || 'success'}`;
        toast.textContent = message;
        toastStack.appendChild(toast);
        requestAnimationFrame(() => toast.classList.add('is-visible'));
        window.setTimeout(() => {
            toast.classList.remove('is-visible');
            toast.classList.add('is-hiding');
            window.setTimeout(() => toast.remove(), 260);
        }, 2600);
    }

    window.showMotionToast = showToast;

    function init() {
        document.body.classList.add('motion-enhanced');
        makeProgress();
        setupReveals();
        setupSurfaces();
        setupRipples();
        setupLoadingStates();
        setupModalMotion();
        reduceMotion.addEventListener?.('change', event => {
            if (!event.matches) return;
            document.querySelectorAll('[data-motion-reveal].motion-pending').forEach(finishReveal);
        });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init, { once: true });
    } else {
        init();
    }
})();
