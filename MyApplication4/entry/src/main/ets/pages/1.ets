const wordDatabase = [
  {
    word: "abandon",
    phonetic: "/əˈbændən/",
    partOfSpeech: "v.",
    meaning: "放弃；抛弃",
    example: {
      sentence: "He abandoned his family.",
      translation: "他抛弃了他的家庭。"
    }
  },
  {
    word: "ability",
    phonetic: "/əˈbɪləti/",
    partOfSpeech: "n.",
    meaning: "能力；才能",
    example: {
      sentence: "She has the ability to solve problems.",
      translation: "她有解决问题的能力。"
    }
  },
  {
    word: "absorb",
    phonetic: "/əbˈsɔːrb/",
    partOfSpeech: "v.",
    meaning: "吸收；理解",
    example: {
      sentence: "Plants absorb water from the soil.",
      translation: "植物从土壤中吸收水分。"
    }
  },
  {
    word: "abstract",
    phonetic: "/ˈæbstrækt/",
    partOfSpeech: "adj.",
    meaning: "抽象的；深奥的",
    example: {
      sentence: "This is an abstract concept.",
      translation: "这是一个抽象的概念。"
    }
  },
  {
    word: "accelerate",
    phonetic: "/əkˈseləreɪt/",
    partOfSpeech: "v.",
    meaning: "加速；促进",
    example: {
      sentence: "The car accelerated quickly.",
      translation: "汽车快速加速。"
    }
  },
  {
    word: "accept",
    phonetic: "/əkˈsept/",
    partOfSpeech: "v.",
    meaning: "接受；承认",
    example: {
      sentence: "I accept your apology.",
      translation: "我接受你的道歉。"
    }
  },
  {
    word: "access",
    phonetic: "/ˈækses/",
    partOfSpeech: "n.",
    meaning: "通道；机会",
    example: {
      sentence: "We have access to the library.",
      translation: "我们可以使用图书馆。"
    }
  },
  {
    word: "achieve",
    phonetic: "/əˈtʃiːv/",
    partOfSpeech: "v.",
    meaning: "实现；达到",
    example: {
      sentence: "She achieved her goal.",
      translation: "她实现了她的目标。"
    }
  },
  {
    word: "acquire",
    phonetic: "/əˈkwaɪər/",
    partOfSpeech: "v.",
    meaning: "获得；学到",
    example: {
      sentence: "He acquired new skills.",
      translation: "他获得了新技能。"
    }
  },
  {
    word: "adapt",
    phonetic: "/əˈdæpt/",
    partOfSpeech: "v.",
    meaning: "适应；改编",
    example: {
      sentence: "We must adapt to changes.",
      translation: "我们必须适应变化。"
    }
  }
];

// 应用状态
class WordApp {
  constructor() {
    this.currentWordIndex = 0;
    this.todayLearned = 0;
    this.totalLearned = 0;
    this.favorites = [];
    this.learnedWords = [];
    this.streakDays = 0;
    this.longestStreak = 0;
    this.checkInDates = [];

    this.init();
  }

  init() {
    this.loadData();
    this.bindEvents();
    this.updateUI();
    this.renderCalendar();
    this.loadNewWord();
  }

  // 数据持久化
  saveData() {
    const data = {
      todayLearned: this.todayLearned,
      totalLearned: this.totalLearned,
      favorites: this.favorites,
      learnedWords: this.learnedWords,
      streakDays: this.streakDays,
      longestStreak: this.longestStreak,
      checkInDates: this.checkInDates,
      lastDate: this.getTodayDate()
    };
    localStorage.setItem('wordAppData', JSON.stringify(data));
  }

  loadData() {
    const savedData = localStorage.getItem('wordAppData');
    if (savedData) {
      const data = JSON.parse(savedData);
      const today = this.getTodayDate();

      // 如果是新的一天，重置今日学习数
      if (data.lastDate !== today) {
        this.todayLearned = 0;
        this.updateStreak(data.lastDate);
      } else {
        this.todayLearned = data.todayLearned || 0;
      }

      this.totalLearned = data.totalLearned || 0;
      this.favorites = data.favorites || [];
      this.learnedWords = data.learnedWords || [];
      this.streakDays = data.streakDays || 0;
      this.longestStreak = data.longestStreak || 0;
      this.checkInDates = data.checkInDates || [];
    }
  }

  getTodayDate() {
    return new Date().toISOString().split('T')[0];
  }

  updateStreak(lastDate) {
    const today = new Date(this.getTodayDate());
    const last = new Date(lastDate);
    const diffDays = Math.floor((today - last) / (1000 * 60 * 60 * 24));

    if (diffDays === 1) {
      // 连续打卡
      this.streakDays++;
      if (this.streakDays > this.longestStreak) {
        this.longestStreak = this.streakDays;
      }
    } else if (diffDays > 1) {
      // 中断打卡
      this.streakDays = 0;
    }
  }

  // 事件绑定
  bindEvents() {
    // 卡片翻转
    const wordCard = document.getElementById('wordCard');
    wordCard.addEventListener('click', () => this.flipCard());

    // 操作按钮
    document.getElementById('learnBtn').addEventListener('click', () => this.markAsLearned());
    document.getElementById('skipBtn').addEventListener('click', () => this.skipWord());
    document.getElementById('favoriteBtn').addEventListener('click', () => this.toggleFavorite());

    // 底部导航
    document.querySelectorAll('.nav-item').forEach(item => {
      item.addEventListener('click', (e) => this.switchTab(e));
    });
  }

  // 卡片翻转
  flipCard() {
    const card = document.getElementById('wordCard');
    card.classList.toggle('flipped');
  }

  // 加载新单词
  loadNewWord() {
    // 获取未学习的单词
    const availableWords = wordDatabase.filter((word, index) =>
    !this.learnedWords.includes(index)
    );

    if (availableWords.length === 0) {
      // 所有单词都学完了，重置
      this.learnedWords = [];
      this.loadNewWord();
      return;
    }

    // 随机选择一个单词
    const randomIndex = Math.floor(Math.random() * availableWords.length);
    const wordData = availableWords[randomIndex];
    this.currentWordIndex = wordDatabase.indexOf(wordData);

    // 更新UI
    document.getElementById('currentWord').textContent = wordData.word;
    document.getElementById('phonetic').textContent = wordData.phonetic;
    document.getElementById('partOfSpeech').textContent = wordData.partOfSpeech;
    document.getElementById('meaning').textContent = wordData.meaning;
    document.getElementById('example').innerHTML = `
            <p class="example-sentence">${wordData.example.sentence}</p>
            <p class="example-translation">${wordData.example.translation}</p>
        `;

    // 重置卡片状态
    const card = document.getElementById('wordCard');
    card.classList.remove('flipped');

    // 更新收藏按钮状态
    this.updateFavoriteButton();
  }

  // 标记为已学习
  markAsLearned() {
    if (!this.learnedWords.includes(this.currentWordIndex)) {
      this.learnedWords.push(this.currentWordIndex);
      this.todayLearned++;
      this.totalLearned++;

      // 检查是否需要打卡
      const today = this.getTodayDate();
      if (!this.checkInDates.includes(today)) {
        this.checkInDates.push(today);
        if (this.streakDays === 0) {
          this.streakDays = 1;
        }
        if (this.streakDays > this.longestStreak) {
          this.longestStreak = this.streakDays;
        }
      }

      this.saveData();
      this.updateUI();
      this.renderCalendar();

      // 显示成功动画
      this.showSuccessAnimation();

      // 加载下一个单词
      setTimeout(() => this.loadNewWord(), 500);
    }
  }

  // 跳过单词
  skipWord() {
    this.loadNewWord();
  }

  // 切换收藏
  toggleFavorite() {
    const index = this.favorites.indexOf(this.currentWordIndex);
    if (index > -1) {
      this.favorites.splice(index, 1);
    } else {
      this.favorites.push(this.currentWordIndex);
    }
    this.saveData();
    this.updateFavoriteButton();
    this.updateUI();
  }

  // 更新收藏按钮状态
  updateFavoriteButton() {
    const btn = document.getElementById('favoriteBtn');
    if (this.favorites.includes(this.currentWordIndex)) {
      btn.classList.add('active');
    } else {
      btn.classList.remove('active');
    }
  }

  // 更新UI
  updateUI() {
    document.getElementById('todayCount').textContent = this.todayLearned;
    document.getElementById('streakDays').textContent = this.streakDays;
    document.getElementById('totalLearned').textContent = this.totalLearned;
    document.getElementById('totalFavorites').textContent = this.favorites.length;
    document.getElementById('longestStreak').textContent = this.longestStreak;
  }

  // 渲染日历
  renderCalendar() {
    const calendar = document.getElementById('calendar');
    const today = new Date();
    const year = today.getFullYear();
    const month = today.getMonth();

    // 获取本月第一天是星期几
    const firstDay = new Date(year, month, 1).getDay();

    // 获取本月天数
    const daysInMonth = new Date(year, month + 1, 0).getDate();

    // 清空日历
    calendar.innerHTML = '';

    // 添加空白格子
    for (let i = 0; i < firstDay; i++) {
      const emptyDay = document.createElement('div');
      emptyDay.className = 'calendar-day empty';
      calendar.appendChild(emptyDay);
    }

    // 添加日期
    for (let day = 1; day <= daysInMonth; day++) {
      const dayElement = document.createElement('div');
      dayElement.className = 'calendar-day';
      dayElement.textContent = day;

      const dateStr = `${year}-${String(month + 1).padStart(2, '0')}-${String(day).padStart(2, '0')}`;

      if (this.checkInDates.includes(dateStr)) {
        dayElement.classList.add('checked');
      }

      if (day === today.getDate()) {
        dayElement.classList.add('today');
      }

      calendar.appendChild(dayElement);
    }
  }

  // 显示成功动画
  showSuccessAnimation() {
    const card = document.getElementById('wordCard');
    card.style.animation = 'none';
    card.offsetHeight; // 触发重排
    card.style.animation = 'pulse 0.5s ease-out';
  }

  // 切换标签页
  switchTab(e) {
    const tab = e.currentTarget.dataset.tab;

    // 更新导航状态
    document.querySelectorAll('.nav-item').forEach(item => {
      item.classList.remove('active');
    });
    e.currentTarget.classList.add('active');

    // 这里可以添加不同标签页的内容切换逻辑
    // 目前只实现了学习页面
    if (tab !== 'learn') {
      alert('此功能正在开发中...');
      // 重新激活学习标签
      document.querySelector('[data-tab="learn"]').classList.add('active');
      e.currentTarget.classList.remove('active');
    }
  }
}

// 初始化应用
document.addEventListener('DOMContentLoaded', () => {
  new WordApp();
});
