const userId = sessionStorage.getItem('userId');
if (!userId) { window.location.href = '/login'; }

const API = '/api';
const REQUEST_TIMEOUT_MS = 10000;

let currentSubjectId = null;
let currentCourseId = null;
let currentLessonId = null;
let currentLessonContent = null;
let currentCharacters = [];
let currentResources = [];
let subjectRequestController = null;
let subjectRequestVersion = 0;
let courseRequestVersion = 0;
let lessonRequestVersion = 0;

async function requestJson(url, options = {}) {
    const { signal: externalSignal, ...fetchOptions } = options;
    const controller = new AbortController();
    const abortRequest = () => controller.abort();
    const timeoutId = window.setTimeout(() => controller.abort(), REQUEST_TIMEOUT_MS);
    if (externalSignal) {
        if (externalSignal.aborted) abortRequest();
        else externalSignal.addEventListener('abort', abortRequest, { once: true });
    }

    try {
        const response = await fetch(url, { ...fetchOptions, signal: controller.signal });
        if (!response.ok) throw new Error(`HTTP ${response.status}`);

        const data = await response.json();
        if (!data.success) throw new Error(data.message || '请求失败');
        return data;
    } finally {
        window.clearTimeout(timeoutId);
        externalSignal?.removeEventListener('abort', abortRequest);
    }
}

function renderLoadError(container, message, retryAction, backAction) {
    container.innerHTML = `
        <div class="empty-state load-error">
            <div class="empty-icon">😵</div>
            <div>${message}</div>
            <div class="load-error-actions">
                <button class="btn-secondary" onclick="${retryAction}">重新加载</button>
                ${backAction ? `<button class="btn-secondary" onclick="${backAction}">返回</button>` : ''}
            </div>
        </div>`;
}

async function fetchUser() {
    try {
        const d = await requestJson(`${API}/auth/user/${userId}`);
        if (d.data) {
            document.getElementById('navCoins').textContent = d.data.coins || 500;
            document.getElementById('navLevel').textContent = d.data.level || 1;
        }
    } catch(e) {}
}

async function loadSubjects() {
    const grid = document.getElementById('subjectsGrid');
    grid.innerHTML = '<div class="loading">加载中...</div>';
    try {
        const d = await requestJson(`${API}/course/subjects`);
        const subjects = Array.isArray(d.data) ? d.data : [];
        grid.innerHTML = subjects.map(s => `
            <div class="subject-card" data-id="${s.id}" onclick="selectSubject(${s.id})">
                <div class="subject-icon">${s.icon || '📖'}</div>
                <div class="subject-name">${s.name}</div>
                <div class="subject-desc">${s.description || ''}</div>
            </div>
        `).join('');
        if (subjects.length > 0) selectSubject(subjects[0].id);
    } catch(e) {
        renderLoadError(grid, '加载失败，请检查数据库连接后重试', 'loadSubjects()');
    }
}

async function selectSubject(id) {
    currentSubjectId = id;
    const requestVersion = ++subjectRequestVersion;
    if (subjectRequestController) subjectRequestController.abort();
    subjectRequestController = new AbortController();
    document.querySelectorAll('.subject-card').forEach(c => c.classList.remove('active'));
    const card = document.querySelector(`.subject-card[data-id="${id}"]`);
    if (card) card.classList.add('active');

    const container = document.getElementById('coursesContainer');
    container.innerHTML = '<div class="loading">加载课程...</div>';
    try {
        const d = await requestJson(`${API}/course/subject/${id}/courses?userId=${encodeURIComponent(userId)}`, {
            signal: subjectRequestController.signal
        });
        if (requestVersion !== subjectRequestVersion || currentSubjectId !== id) return;
        renderCourses(d.data);
    } catch(e) {
        if (e.name === 'AbortError' || requestVersion !== subjectRequestVersion) return;
        renderLoadError(container, '课程加载失败，请稍后重试', `selectSubject(${id})`);
    } finally {
        if (requestVersion === subjectRequestVersion) subjectRequestController = null;
    }
}

function renderCourses(courses) {
    const container = document.getElementById('coursesContainer');
    if (!courses || courses.length === 0) {
        container.innerHTML = '<div class="empty-state"><div class="empty-icon">📚</div>暂无课程</div>';
        return;
    }
    container.innerHTML = `
        <div class="section-title"><h2>课程列表</h2></div>
        <div class="courses-grid">
            ${courses.map(c => {
                const progress = c.lessonCount > 0 ? Math.round((c.completedLessons || 0) / c.lessonCount * 100) : 0;
                const diffClass = c.difficulty === 'beginner' ? 'difficulty-beginner' : c.difficulty === 'advanced' ? 'difficulty-advanced' : 'difficulty-intermediate';
                const diffLabel = c.difficulty === 'beginner' ? '入门' : c.difficulty === 'advanced' ? '进阶' : '中级';
                return `
                <div class="course-card" onclick="openCourse(${c.id})">
                    <div class="course-card-header">
                        <div class="course-name">${c.name}</div>
                        <div class="course-difficulty ${diffClass}">${diffLabel}</div>
                    </div>
                    <div class="course-desc">${c.description || ''}</div>
                    <div class="course-meta">
                        <span>📖 ${c.lessonCount || 0} 节课</span>
                        <span>⏱ ${c.estimatedHours || 1}h</span>
                        <span>✅ ${c.completedLessons || 0}/${c.lessonCount || 0}</span>
                        ${c.resourceCount > 0 ? `<span class="course-video-badge">🎬 ${c.resourceCount} 视频</span>` : ''}
                    </div>
                    ${c.lessonCount > 0 ? `<div class="course-progress-bar"><div class="course-progress-fill" style="width:${progress}%"></div></div>` : ''}
                </div>`;
            }).join('')}
        </div>`;
}

async function openCourse(courseId) {
    currentCourseId = courseId;
    const requestVersion = ++courseRequestVersion;
    document.getElementById('subjectsView').style.display = 'none';
    const view = document.getElementById('courseDetailView');
    view.style.display = 'block';
    view.innerHTML = '<div class="loading">加载中...</div>';

    try {
        const d = await requestJson(`${API}/course/course/${courseId}?userId=${encodeURIComponent(userId)}`);
        if (requestVersion !== courseRequestVersion || currentCourseId !== courseId) return;
        renderCourseDetail(d.data);
    } catch(e) {
        if (requestVersion !== courseRequestVersion) return;
        renderLoadError(view, '课程加载失败，请稍后重试', `openCourse(${courseId})`, 'backToSubjects()');
    }
}

function renderCourseDetail(course) {
    const view = document.getElementById('courseDetailView');
    const diffClass = course.difficulty === 'beginner' ? 'difficulty-beginner' : course.difficulty === 'advanced' ? 'difficulty-advanced' : 'difficulty-intermediate';
    const diffLabel = course.difficulty === 'beginner' ? '入门' : course.difficulty === 'advanced' ? '进阶' : '中级';

    view.innerHTML = `
        <div class="course-detail-header">
            <div class="back-btn" onclick="backToSubjects()">← 返回学习中心</div>
            <div class="course-detail-name">${course.name}</div>
            <div class="course-detail-desc">${course.description || ''}</div>
            <div class="course-detail-meta">
                <span>📖 ${course.lessonCount || 0} 节课</span>
                <span>⏱ 约${course.estimatedHours || 1}小时</span>
                <span>${diffLabel}</span>
                <span>✅ ${course.completedLessons || 0}/${course.lessonCount || 0} 完成</span>
                ${course.resourceCount > 0 ? `<span class="course-video-badge">🎬 B站视频 ${course.resourceCount} 个</span>` : ''}
            </div>
        </div>
        <div class="lessons-list" id="lessonsList">
            <div class="loading">加载课程列表...</div>
        </div>
        <div class="resources-section" id="resourcesSection"></div>
    `;
    loadLessons(course.id, courseRequestVersion);
    loadResources(course.id, courseRequestVersion);
}

async function loadResources(courseId, requestVersion = courseRequestVersion) {
    const section = document.getElementById('resourcesSection');
    if (!section || requestVersion !== courseRequestVersion || currentCourseId !== courseId) return;
    try {
        const d = await requestJson(`${API}/course/course/${courseId}/resources`);
        if (requestVersion !== courseRequestVersion || currentCourseId !== courseId) return;
        if (d.data && d.data.length > 0) {
            currentResources = d.data;
            const videos = d.data.filter(v => v.sourceType === 'bilibili');
            const others = d.data.filter(v => v.sourceType !== 'bilibili');
            section.innerHTML = `
                <div class="resources-header">
                    <div class="resources-title">📺 B站精选学习视频</div>
                    <div class="resources-sub">本站课程配套的B站优质公开课，点击卡片在线观看</div>
                </div>
                <div class="videos-grid">
                    ${videos.map(v => renderVideoCard(v)).join('')}
                </div>
                ${others.length > 0 ? `
                    <div class="resources-header" style="margin-top:28px;">
                        <div class="resources-title">🔗 扩展学习资源</div>
                    </div>
                    <div class="videos-grid">
                        ${others.map(v => renderVideoCard(v)).join('')}
                    </div>` : ''}
            `;
        } else {
            section.innerHTML = '';
        }
    } catch(e) {
        if (requestVersion === courseRequestVersion && currentCourseId === courseId) section.innerHTML = '';
    }
}

function esc(s) {
    return String(s == null ? '' : s)
        .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;').replace(/'/g, '&#39;');
}

function renderVideoCard(v) {
    const playText = formatPlayCount(v.playCount);
    const title = esc(v.title);
    return `
    <div class="video-card" onclick="openVideoPlayer(${v.id})" data-video-id="${v.id}">
        <div class="video-cover">
            <div class="video-cover-fallback" ${v.coverUrl ? 'style="display:none"' : ''}>🎬</div>
            ${v.coverUrl ? `<img src="${esc(v.coverUrl)}" referrerpolicy="no-referrer" alt="${title}" loading="lazy" onerror="this.style.display='none';this.previousElementSibling.style.display='flex'">` : ''}
            ${v.duration ? `<span class="video-duration">${esc(v.duration)}</span>` : ''}
            <div class="video-play-btn">▶</div>
        </div>
        <div class="video-info">
            <div class="video-title">${title}</div>
            <div class="video-meta">
                <span class="video-author">${esc(v.author)}</span>
                <span class="video-play">▶ ${playText}</span>
            </div>
            ${v.description ? `<div class="video-desc">${esc(v.description)}</div>` : ''}
        </div>
    </div>`;
}

function formatPlayCount(n) {
    n = Number(n) || 0;
    if (n >= 100000000) return (n / 100000000).toFixed(1) + '亿';
    if (n >= 10000) return (n / 10000).toFixed(1) + '万';
    return String(n);
}

function openVideoPlayer(resourceId) {
    const v = currentResources.find(x => x.id === resourceId);
    if (!v) return;
    const bvid = (v.url || '').match(/video\/(BV[0-9A-Za-z]+)/);
    if (!bvid) { window.open(v.url, '_blank'); return; }
    const embedUrl = `https://player.bilibili.com/player.html?bvid=${bvid[1]}&page=1&high_quality=1&danmaku=0`;
    document.body.insertAdjacentHTML('beforeend', `
        <div class="video-modal-overlay" onclick="closeVideoPlayer(event)">
            <div class="video-modal" onclick="event.stopPropagation()">
                <div class="video-modal-header">
                    <span class="video-modal-title">${esc(v.title)}</span>
                    <span class="video-modal-close" onclick="closeVideoPlayer(event)">✕</span>
                </div>
                <div class="video-modal-player">
                    <iframe src="${embedUrl}" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>
                </div>
                <div class="video-modal-footer">
                    <a href="${esc(v.url)}" target="_blank" rel="noopener" class="btn-secondary">在B站打开 ↗</a>
                    <a href="${esc(v.authorUrl || '#')}" target="_blank" rel="noopener" class="btn-secondary" style="border-color:rgba(123,167,201,.35);color:var(--blue-deep)">UP主主页 ↗</a>
                </div>
            </div>
        </div>`);
}

function closeVideoPlayer(e) {
    if (e) e.stopPropagation();
    const overlay = document.querySelector('.video-modal-overlay');
    if (overlay) overlay.remove();
}

async function loadLessons(courseId, requestVersion = courseRequestVersion) {
    const list = document.getElementById('lessonsList');
    if (!list || requestVersion !== courseRequestVersion || currentCourseId !== courseId) return;
    try {
        const d = await requestJson(`${API}/course/course/${courseId}/lessons?userId=${encodeURIComponent(userId)}`);
        if (requestVersion !== courseRequestVersion || currentCourseId !== courseId) return;
        if (d.data && d.data.length > 0) {
            list.innerHTML = d.data.map((l, i) => {
                const status = l.progressStatus || 'not_started';
                const statusClass = status === 'completed' ? 'status-completed' : status === 'in_progress' ? 'status-in_progress' : 'status-not_started';
                const statusLabel = status === 'completed' ? '已完成' : status === 'in_progress' ? '学习中' : '未开始';
                return `
                <div class="lesson-item" onclick="openLesson(${l.id})">
                    <div class="lesson-num">${i + 1}</div>
                    <div class="lesson-info">
                        <div class="lesson-title">${l.title}</div>
                        <div class="lesson-meta">⏱ ${l.estimatedMinutes || 10}分钟 · ${l.difficulty || 'beginner'}</div>
                    </div>
                    <div class="lesson-status ${statusClass}">${statusLabel}</div>
                </div>`;
            }).join('');
        } else {
            list.innerHTML = '<div class="empty-state">暂无课程内容</div>';
        }
    } catch(e) {
        if (requestVersion === courseRequestVersion && currentCourseId === courseId) {
            renderLoadError(list, '课时加载失败，请稍后重试', `loadLessons(${courseId}, ${requestVersion})`);
        }
    }
}

function backToSubjects() {
    courseRequestVersion++;
    lessonRequestVersion++;
    document.getElementById('courseDetailView').style.display = 'none';
    document.getElementById('lessonView').style.display = 'none';
    document.getElementById('subjectsView').style.display = 'block';
    currentCourseId = null;
    currentLessonId = null;
}

async function openLesson(lessonId) {
    currentLessonId = lessonId;
    const requestVersion = ++lessonRequestVersion;
    document.getElementById('courseDetailView').style.display = 'none';
    document.getElementById('subjectsView').style.display = 'none';
    const view = document.getElementById('lessonView');
    view.style.display = 'block';
    view.innerHTML = '<div class="loading">加载课程内容...</div>';

    try {
        startLearning(lessonId);
        const d = await requestJson(`${API}/course/lesson/${lessonId}?userId=${encodeURIComponent(userId)}`);
        if (requestVersion === lessonRequestVersion && currentLessonId === lessonId) renderLesson(d.data);
    } catch(e) {
        if (requestVersion === lessonRequestVersion && currentLessonId === lessonId) {
            renderLoadError(view, '课程内容加载失败，请稍后重试', `openLesson(${lessonId})`, 'backToCourse()');
        }
    }
}

async function startLearning(lessonId) {
    try {
        await requestJson(`${API}/progress/lesson/${lessonId}/start`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ userId: parseInt(userId) })
        });
    } catch(e) {}
}

function renderLesson(lesson) {
    currentLessonContent = lesson;
    const view = document.getElementById('lessonView');
    let keyPointsHtml = '';
    try {
        const points = JSON.parse(lesson.keyPoints || '[]');
        if (points.length > 0) {
            keyPointsHtml = `
                <div class="key-points-section">
                    <h4>📌 关键知识点</h4>
                    <ul class="key-point-list">
                        ${points.map(p => `<li class="key-point-item">${p}</li>`).join('')}
                    </ul>
                </div>`;
        }
    } catch(e) {}

    view.innerHTML = `
        <div class="course-detail-header">
            <div class="back-btn" onclick="backToCourse()">← 返回课程列表</div>
        </div>
        <div class="lesson-content-section">
            <div class="lesson-content-card">
                <div class="lesson-content-title">${lesson.title}</div>
                <div class="lesson-content-body">${lesson.content || ''}</div>
                ${keyPointsHtml}
                <div class="lesson-actions">
                    <button class="btn-primary" onclick="openQuiz(${lesson.id})">📝 测验</button>
                    <button class="btn-secondary" onclick="openPaper2Gal()">🎭 角色对话学习</button>
                    <button class="btn-secondary" onclick="completeAndBack()">✅ 标记完成</button>
                </div>
            </div>
        </div>
        <div id="quizContainer"></div>
        <div id="paper2galContainer"></div>
    `;
}

function backToCourse() {
    lessonRequestVersion++;
    document.getElementById('lessonView').style.display = 'none';
    document.getElementById('quizContainer').innerHTML = '';
    document.getElementById('paper2galContainer').innerHTML = '';
    document.getElementById('courseDetailView').style.display = 'block';
    currentLessonId = null;
}

async function completeAndBack() {
    try {
        await requestJson(`${API}/progress/lesson/${currentLessonId}/complete`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ userId: parseInt(userId) })
        });
        await requestJson(`${API}/user/${userId}/exp`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ exp: 10 })
        });
        await fetchUser();
    } catch(e) {}
    backToCourse();
    if (currentCourseId) loadLessons(currentCourseId);
}

async function openQuiz(lessonId) {
    currentLessonId = lessonId;
    const container = document.getElementById('quizContainer');
    container.innerHTML = '<div class="loading">加载测验题...</div>';

    let quizQuestions = [];
    if (currentLessonContent && currentLessonContent.questions && currentLessonContent.questions.length > 0) {
        quizQuestions = currentLessonContent.questions;
    } else {
        try {
            const d = await requestJson(`${API}/course/lesson/${lessonId}?userId=${encodeURIComponent(userId)}`);
            if (d.data.questions) quizQuestions = d.data.questions;
        } catch(e) {}
    }

    if (quizQuestions.length === 0) {
        container.innerHTML = '<div class="empty-state">该课程暂无测验题</div>';
        return;
    }

    container.innerHTML = `
        <div class="quiz-section">
            <h3>📝 课程测验</h3>
            ${quizQuestions.map((q, qi) => {
                let optionsHtml = '';
                try {
                    const opts = typeof q.options === 'string' ? JSON.parse(q.options) : q.options;
                    optionsHtml = opts.map((o, oi) => `
                        <div class="quiz-option" data-q="${q.id}" data-a="${o.label}" onclick="selectOption(this, ${q.id}, '${o.label}')">
                            ${o.label}. ${o.text}
                        </div>
                    `).join('');
                } catch(e) {}
                return `
                <div class="quiz-question">
                    <div class="quiz-question-text">${qi + 1}. ${q.question}</div>
                    <div class="quiz-options">${optionsHtml}</div>
                </div>`;
            }).join('')}
            <button class="btn-primary" onclick="submitQuiz(${lessonId})" style="margin-top:16px;">提交答案</button>
        </div>
    `;
}

let selectedAnswers = {};
function selectOption(el, questionId, answer) {
    const parent = el.parentElement;
    parent.querySelectorAll('.quiz-option').forEach(o => o.classList.remove('selected'));
    el.classList.add('selected');
    selectedAnswers[questionId] = answer;
}

async function submitQuiz(lessonId) {
    const quizQuestions = currentLessonContent && currentLessonContent.questions || [];
    const unanswered = quizQuestions.filter(q => !selectedAnswers[q.id]);
    if (unanswered.length > 0) {
        alert(`还有 ${unanswered.length} 道题未作答！`);
        return;
    }

    const container = document.getElementById('quizContainer');
    try {
        const d = await requestJson(`${API}/progress/lesson/${lessonId}/quiz`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ userId: parseInt(userId), answers: selectedAnswers })
        });
        container.innerHTML += renderQuizResult(d.data);
    } catch(e) {
        alert('提交失败');
    }
}

function renderQuizResult(result) {
    return `
        <div class="quiz-result-overlay" onclick="this.remove()">
            <div class="quiz-result-card" onclick="event.stopPropagation()">
                <div class="quiz-result-score">${result.score}分</div>
                <div class="quiz-result-detail">
                    正确 ${result.correctCount}/${result.totalQuestions}
                    ${result.success ? '🎉 通过！' : '😅 还需努力'}
                </div>
                ${result.expEarned > 0 ? `<div class="quiz-result-exp">+${result.expEarned} EXP</div>` : ''}
                ${result.levelUp ? `<div class="quiz-result-levelup">${result.levelUp}</div>` : ''}
                <button class="btn-primary" onclick="document.querySelector('.quiz-result-overlay').remove();fetchUser();">确定</button>
            </div>
        </div>
    `;
}

async function openPaper2Gal() {
    const container = document.getElementById('paper2galContainer');
    container.innerHTML = '<div class="loading">加载角色...</div>';

    if (currentCharacters.length === 0) {
        try {
            const d = await requestJson(`${API}/character/list`);
            currentCharacters = Array.isArray(d.data) ? d.data : [];
        } catch(e) {}
    }

    container.innerHTML = `
        <div class="paper2gal-section">
            <h3>🎭 角色对话学习</h3>
            <div class="character-select" id="charSelect">
                ${currentCharacters.map(c => `
                    <div class="char-option" data-char="${c.id}" onclick="selectChar('${c.id}')">
                        ${c.name || c.id}
                    </div>
                `).join('')}
            </div>
            <div id="dialogueContainer"></div>
        </div>
    `;
}

function selectChar(charId) {
    document.querySelectorAll('.char-option').forEach(o => o.classList.remove('selected'));
    const opt = document.querySelector(`.char-option[data-char="${charId}"]`);
    if (opt) opt.classList.add('selected');
    generateDialogue(charId);
}

function generateDialogue(charId) {
    const container = document.getElementById('dialogueContainer');
    if (!currentLessonContent) return;

    const char = currentCharacters.find(c => c.id === charId) || { name: '讲解员' };
    const content = currentLessonContent.content || '';
    const paragraphs = content.split(/\n\n+/).filter(p => p.trim());

    container.innerHTML = `
        <div class="dialogue-scene">
            <div class="dialogue-msg character">
                <div class="dialogue-speaker">${char.name}</div>
                <div>让我来为你讲解这部分内容吧！</div>
            </div>
            ${paragraphs.slice(0, 10).map((p, i) => `
                <div class="dialogue-msg character">
                    <div class="dialogue-speaker">${char.name}</div>
                    <div>${p.length > 300 ? p.substring(0, 300) + '...' : p}</div>
                </div>
            `).join('')}
            <div class="dialogue-msg system">
                <div>理解了吗？可以通过测验检验你的学习成果哦~</div>
            </div>
        </div>
    `;
}

fetchUser();
loadSubjects();
