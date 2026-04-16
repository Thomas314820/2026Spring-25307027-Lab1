<!DOCTYPE html>
  <html lang="zh-CN">
  <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>单词打卡 - 每日英语学习</title>
  <link rel="stylesheet" href="styles.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Noto+Sans+SC:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  </head>
  <body>
  <div class="app-container">
  <!-- 顶部导航 -->
  <header class="header">
  <div class="header-content">
  <h1 class="logo">单词打卡</h1>
  <div class="header-stats">
  <div class="stat-item">
  <span class="stat-label">今日已学</span>
  <span class="stat-value" id="todayCount">0</span>
  </div>
  <div class="stat-item">
  <span class="stat-label">连续打卡</span>
  <span class="stat-value" id="streakDays">0</span>
  <span class="stat-unit">天</span>
  </div>
  </div>
  </div>
  </header>

  <!-- 主要内容区 -->
  <main class="main-content">
  <!-- 打卡卡片 -->
  <section class="card-section">
  <div class="word-card" id="wordCard">
  <div class="card-inner">
  <div class="card-front">
  <div class="word-container">
  <h2 class="word" id="currentWord">abandon</h2>
  <p class="phonetic" id="phonetic">/əˈbændən/</p>
  </div>
  <div class="hint-text">点击卡片查看释义</div>
  </div>
  <div class="card-back">
  <div class="meaning-container">
  <div class="part-of-speech" id="partOfSpeech">v.</div>
  <div class="meaning" id="meaning">放弃；抛弃</div>
  <div class="example" id="example">
  <p class="example-sentence">He abandoned his family.</p>
  <p class="example-translation">他抛弃了他的家庭。</p>
  </div>
  </div>
  </div>
  </div>
  </div>

  <!-- 操作按钮 -->
  <div class="action-buttons">
  <button class="btn btn-secondary" id="skipBtn">
  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
  <path d="M5 12h14M12 5l7 7-7 7"/>
  </svg>
  <span>跳过</span>
  </button>
  <button class="btn btn-primary" id="learnBtn">
  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
  <path d="M20 6L9 17l-5-5"/>
  </svg>
  <span>已掌握</span>
  </button>
  <button class="btn btn-favorite" id="favoriteBtn">
  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
  <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
  </svg>
  <span>收藏</span>
  </button>
  </div>
  </section>

  <!-- 进度统计 -->
  <section class="progress-section">
  <h3 class="section-title">学习进度</h3>
  <div class="progress-cards">
  <div class="progress-card">
  <div class="progress-icon">📚</div>
  <div class="progress-info">
  <div class="progress-label">总学习单词</div>
  <div class="progress-value" id="totalLearned">0</div>
  </div>
  </div>
  <div class="progress-card">
  <div class="progress-icon">⭐</div>
  <div class="progress-info">
  <div class="progress-label">收藏单词</div>
  <div class="progress-value" id="totalFavorites">0</div>
  </div>
  </div>
  <div class="progress-card">
  <div class="progress-icon">🔥</div>
  <div class="progress-info">
  <div class="progress-label">最长连续</div>
  <div class="progress-value" id="longestStreak">0</div>
  </div>
  </div>
  </div>
  </section>

  <!-- 打卡日历 -->
  <section class="calendar-section">
  <h3 class="section-title">打卡日历</h3>
  <div class="calendar" id="calendar"></div>
  </section>
  </main>

  <!-- 底部导航 -->
  <nav class="bottom-nav">
  <button class="nav-item active" data-tab="learn">
  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
  <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/>
  <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/>
  </svg>
  <span>学习</span>
  </button>
  <button class="nav-item" data-tab="favorites">
  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
  <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
  </svg>
  <span>收藏</span>
  </button>
  <button class="nav-item" data-tab="history">
  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
  <circle cx="12" cy="12" r="10"/>
  <polyline points="12 6 12 12 16 14"/>
  </svg>
  <span>历史</span>
  </button>
  </nav>
  </div>

  <script src="app.js"></script>
  </body>
  </html>
