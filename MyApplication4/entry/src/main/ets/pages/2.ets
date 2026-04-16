/* Apple Minimalist Design System */
:root {
  /* Colors */
  --color-primary: #007AFF;
  --color-primary-light: #4DA3FF;
  --color-primary-dark: #0051D5;

  --color-success: #34C759;
  --color-warning: #FF9500;
  --color-danger: #FF3B30;

  --color-gray-50: #FAFAFA;
  --color-gray-100: #F5F5F7;
  --color-gray-200: #E8E8ED;
  --color-gray-300: #D2D2D7;
  --color-gray-400: #C7C7CC;
  --color-gray-500: #8E8E93;
  --color-gray-600: #636366;
  --color-gray-700: #48484A;
  --color-gray-800: #3A3A3C;
  --color-gray-900: #1C1C1E;

  --color-white: #FFFFFF;
  --color-black: #000000;

  /* Typography */
  --font-family-primary: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
  --font-family-chinese: 'Noto Sans SC', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;

  --font-size-xs: 12px;
  --font-size-sm: 14px;
  --font-size-base: 16px;
  --font-size-lg: 18px;
  --font-size-xl: 20px;
  --font-size-2xl: 24px;
  --font-size-3xl: 30px;
  --font-size-4xl: 36px;

  --font-weight-light: 300;
  --font-weight-normal: 400;
  --font-weight-medium: 500;
  --font-weight-semibold: 600;
  --font-weight-bold: 700;

  /* Spacing */
  --spacing-xs: 4px;
  --spacing-sm: 8px;
  --spacing-md: 16px;
  --spacing-lg: 24px;
  --spacing-xl: 32px;
  --spacing-2xl: 48px;
  --spacing-3xl: 64px;

  /* Border Radius */
  --radius-sm: 8px;
  --radius-md: 12px;
  --radius-lg: 16px;
  --radius-xl: 20px;
  --radius-full: 9999px;

  /* Shadows */
  --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.04);
  --shadow-md: 0 4px 12px rgba(0, 0, 0, 0.08);
  --shadow-lg: 0 8px 24px rgba(0, 0, 0, 0.12);
  --shadow-xl: 0 16px 48px rgba(0, 0, 0, 0.16);

  /* Transitions */
  --transition-fast: 150ms cubic-bezier(0.4, 0, 0.2, 1);
  --transition-base: 250ms cubic-bezier(0.4, 0, 0.2, 1);
  --transition-slow: 350ms cubic-bezier(0.4, 0, 0.2, 1);
}

/* Reset & Base */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  font-size: 16px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

body {
  font-family: var(--font-family-primary);
  font-size: var(--font-size-base);
  font-weight: var(--font-weight-normal);
  line-height: 1.6;
  color: var(--color-gray-900);
  background: linear-gradient(135deg, #F5F7FA 0%, #E8EDF3 100%);
  min-height: 100vh;
  overflow-x: hidden;
}

/* App Container */
.app-container {
  max-width: 480px;
  margin: 0 auto;
  background: var(--color-white);
  min-height: 100vh;
  box-shadow: var(--shadow-xl);
  position: relative;
}

/* Header */
.header {
  background: var(--color-white);
  border-bottom: 1px solid var(--color-gray-200);
  padding: var(--spacing-lg) var(--spacing-md);
  position: sticky;
  top: 0;
  z-index: 100;
  backdrop-filter: blur(20px);
  background: rgba(255, 255, 255, 0.8);
}

.header-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  font-size: var(--font-size-2xl);
  font-weight: var(--font-weight-bold);
  color: var(--color-gray-900);
  letter-spacing: -0.5px;
}

.header-stats {
  display: flex;
  gap: var(--spacing-lg);
}

.stat-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: var(--spacing-xs);
}

.stat-label {
  font-size: var(--font-size-xs);
  color: var(--color-gray-500);
  font-weight: var(--font-weight-medium);
}

.stat-value {
  font-size: var(--font-size-xl);
  font-weight: var(--font-weight-bold);
  color: var(--color-primary);
}

.stat-unit {
  font-size: var(--font-size-xs);
  color: var(--color-gray-500);
}

/* Main Content */
.main-content {
  padding: var(--spacing-lg) var(--spacing-md);
  padding-bottom: 100px;
}

/* Card Section */
.card-section {
  margin-bottom: var(--spacing-2xl);
}

.word-card {
  perspective: 1000px;
  cursor: pointer;
  margin-bottom: var(--spacing-lg);
}

.card-inner {
  position: relative;
  width: 100%;
  min-height: 280px;
  transition: transform 0.6s cubic-bezier(0.4, 0, 0.2, 1);
  transform-style: preserve-3d;
}

.word-card.flipped .card-inner {
  transform: rotateY(180deg);
}

.card-front,
  .card-back {
  position: absolute;
  width: 100%;
  min-height: 280px;
  backface-visibility: hidden;
  border-radius: var(--radius-xl);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: var(--spacing-2xl);
}

.card-front {
  background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
  color: var(--color-white);
  box-shadow: var(--shadow-lg);
}

.card-back {
  background: var(--color-white);
  border: 2px solid var(--color-gray-200);
  transform: rotateY(180deg);
  box-shadow: var(--shadow-lg);
}

.word-container {
  text-align: center;
}

.word {
  font-size: var(--font-size-4xl);
  font-weight: var(--font-weight-bold);
  margin-bottom: var(--spacing-sm);
  letter-spacing: -1px;
}

.phonetic {
  font-size: var(--font-size-lg);
  opacity: 0.9;
  font-weight: var(--font-weight-light);
}

.hint-text {
  position: absolute;
  bottom: var(--spacing-lg);
  font-size: var(--font-size-sm);
  opacity: 0.7;
  font-weight: var(--font-weight-light);
}

.meaning-container {
  text-align: center;
}

.part-of-speech {
  display: inline-block;
  background: var(--color-primary);
  color: var(--color-white);
  padding: var(--spacing-xs) var(--spacing-md);
  border-radius: var(--radius-full);
  font-size: var(--font-size-sm);
  font-weight: var(--font-weight-medium);
  margin-bottom: var(--spacing-md);
}

.meaning {
  font-size: var(--font-size-2xl);
  font-weight: var(--font-weight-semibold);
  color: var(--color-gray-900);
  margin-bottom: var(--spacing-lg);
}

.example {
  background: var(--color-gray-50);
  padding: var(--spacing-md);
  border-radius: var(--radius-md);
  text-align: left;
}

.example-sentence {
  font-size: var(--font-size-base);
  color: var(--color-gray-700);
  margin-bottom: var(--spacing-xs);
  font-style: italic;
}

.example-translation {
  font-size: var(--font-size-sm);
  color: var(--color-gray-500);
}

/* Action Buttons */
.action-buttons {
  display: flex;
  gap: var(--spacing-md);
  justify-content: center;
}

.btn {
  display: flex;
  align-items: center;
  gap: var(--spacing-sm);
  padding: var(--spacing-md) var(--spacing-lg);
  border-radius: var(--radius-lg);
  border: none;
  font-size: var(--font-size-base);
  font-weight: var(--font-weight-semibold);
  cursor: pointer;
  transition: all var(--transition-base);
  font-family: var(--font-family-primary);
}

.btn svg {
  transition: transform var(--transition-fast);
}

.btn:hover svg {
  transform: scale(1.1);
}

.btn-primary {
  background: var(--color-primary);
  color: var(--color-white);
  box-shadow: 0 4px 12px rgba(0, 122, 255, 0.3);
}

.btn-primary:hover {
  background: var(--color-primary-dark);
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(0, 122, 255, 0.4);
}

.btn-primary:active {
  transform: translateY(0);
}

.btn-secondary {
  background: var(--color-gray-100);
  color: var(--color-gray-700);
}

.btn-secondary:hover {
  background: var(--color-gray-200);
  transform: translateY(-2px);
}

.btn-favorite {
  background: var(--color-white);
  color: var(--color-danger);
  border: 2px solid var(--color-danger);
}

.btn-favorite:hover {
  background: var(--color-danger);
  color: var(--color-white);
  transform: translateY(-2px);
}

.btn-favorite.active {
  background: var(--color-danger);
  color: var(--color-white);
}

/* Progress Section */
.progress-section {
  margin-bottom: var(--spacing-2xl);
}

.section-title {
  font-size: var(--font-size-xl);
  font-weight: var(--font-weight-semibold);
  color: var(--color-gray-900);
  margin-bottom: var(--spacing-lg);
}

.progress-cards {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: var(--spacing-md);
}

.progress-card {
  background: var(--color-white);
  border: 1px solid var(--color-gray-200);
  border-radius: var(--radius-lg);
  padding: var(--spacing-lg);
  text-align: center;
  transition: all var(--transition-base);
}

.progress-card:hover {
  transform: translateY(-4px);
  box-shadow: var(--shadow-md);
}

.progress-icon {
  font-size: var(--font-size-2xl);
  margin-bottom: var(--spacing-sm);
}

.progress-info {
  display: flex;
  flex-direction: column;
  gap: var(--spacing-xs);
}

.progress-label {
  font-size: var(--font-size-xs);
  color: var(--color-gray-500);
  font-weight: var(--font-weight-medium);
}

.progress-value {
  font-size: var(--font-size-xl);
  font-weight: var(--font-weight-bold);
  color: var(--color-gray-900);
}

/* Calendar Section */
.calendar-section {
  margin-bottom: var(--spacing-2xl);
}

.calendar {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: var(--spacing-sm);
  background: var(--color-white);
  border: 1px solid var(--color-gray-200);
  border-radius: var(--radius-lg);
  padding: var(--spacing-md);
}

.calendar-day {
  aspect-ratio: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: var(--radius-sm);
  font-size: var(--font-size-sm);
  font-weight: var(--font-weight-medium);
  color: var(--color-gray-600);
  transition: all var(--transition-fast);
}

.calendar-day.checked {
  background: var(--color-primary);
  color: var(--color-white);
  font-weight: var(--font-weight-bold);
}

.calendar-day.today {
  border: 2px solid var(--color-primary);
  color: var(--color-primary);
}

.calendar-day:hover {
  background: var(--color-gray-100);
}

/* Bottom Navigation */
.bottom-nav {
  position: fixed;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 100%;
  max-width: 480px;
  background: var(--color-white);
  border-top: 1px solid var(--color-gray-200);
  display: flex;
  justify-content: space-around;
  padding: var(--spacing-md) 0;
  backdrop-filter: blur(20px);
  background: rgba(255, 255, 255, 0.9);
  z-index: 100;
}

.nav-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: var(--spacing-xs);
  background: none;
  border: none;
  color: var(--color-gray-500);
  font-size: var(--font-size-xs);
  font-weight: var(--font-weight-medium);
  cursor: pointer;
  transition: all var(--transition-base);
  font-family: var(--font-family-primary);
}

.nav-item svg {
  transition: all var(--transition-fast);
}

.nav-item:hover {
  color: var(--color-gray-700);
}

.nav-item.active {
  color: var(--color-primary);
}

.nav-item.active svg {
  transform: scale(1.1);
}

/* Animations */
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes pulse {
  0%, 100% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.05);
  }
}

.word-card {
  animation: fadeIn 0.5s ease-out;
}

.progress-card {
  animation: fadeIn 0.5s ease-out;
}

.progress-card:nth-child(2) {
  animation-delay: 0.1s;
}

.progress-card:nth-child(3) {
  animation-delay: 0.2s;
}

/* Responsive */
@media (max-width: 480px) {
  :root {
    --font-size-4xl: 32px;
    --font-size-3xl: 28px;
    --font-size-2xl: 22px;
  }

  .header-stats {
    gap: var(--spacing-md);
  }

  .action-buttons {
    flex-wrap: wrap;
  }

  .btn {
    flex: 1;
    min-width: 120px;
  }
}

/* Chinese Font Support */
.word,
  .meaning,
  .example-translation,
  .stat-label,
  .progress-label,
  .section-title {
  font-family: var(--font-family-chinese);
}
