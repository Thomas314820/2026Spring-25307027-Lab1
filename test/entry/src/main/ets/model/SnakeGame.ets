// 方向枚举
export enum Direction {
  UP = 'UP',
  DOWN = 'DOWN',
  LEFT = 'LEFT',
  RIGHT = 'RIGHT'
}

// 坐标点
export interface Point {
  x: number;
  y: number;
}

// 游戏状态
export class SnakeGame {
  // 游戏区域大小
  private gridWidth: number = 20;
  private gridHeight: number = 30;

  // 蛇身
  snake: Point[] = [];

  // 食物位置
  food: Point = { x: 0, y: 0 };

  // 当前方向
  direction: Direction = Direction.RIGHT;

  // 游戏分数
  score: number = 0;

  // 游戏是否结束
  isGameOver: boolean = false;

  // 游戏是否暂停
  isPaused: boolean = false;

  // 最高分
  highScore: number = 0;

  constructor() {
    this.initGame();
  }

  // 初始化游戏
  initGame(): void {
    // 初始化蛇身（3个节点）
    this.snake = [
      { x: 5, y: 15 },
      { x: 4, y: 15 },
      { x: 3, y: 15 }
    ];

    this.direction = Direction.RIGHT;
    this.score = 0;
    this.isGameOver = false;
    this.isPaused = false;

    // 生成食物
    this.generateFood();
  }

  // 生成食物
  generateFood(): void {
    let newFood: Point;
    do {
      newFood = {
        x: Math.floor(Math.random() * this.gridWidth),
        y: Math.floor(Math.random() * this.gridHeight)
      };
    } while (this.isOnSnake(newFood));

    this.food = newFood;
  }

  // 检查点是否在蛇身上
  isOnSnake(point: Point): boolean {
    return this.snake.some(segment => segment.x === point.x && segment.y === point.y);
  }

  // 移动蛇
  moveSnake(): void {
    if (this.isGameOver || this.isPaused) {
      return;
    }
    // 获取蛇头（修复此处错误的代码插入）
    const head: Point = { x: this.snake[0].x, y: this.snake[0].y };


    // 根据方向移动
    switch (this.direction) {
      case Direction.UP:
        head.y -= 1;
        break;
      case Direction.DOWN:
        head.y += 1;
        break;
      case Direction.LEFT:
        head.x -= 1;
        break;
      case Direction.RIGHT:
        head.x += 1;
        break;
    }

    // 检查是否撞墙
    if (head.x < 0 || head.x >= this.gridWidth || head.y < 0 || head.y >= this.gridHeight) {
      this.gameOver();
      return;
    }

    // 检查是否撞到自己（排除蛇尾）
    const bodyWithoutTail = this.snake.slice(0, -1);
    if (bodyWithoutTail.some(segment => segment.x === head.x && segment.y === head.y)) {
      this.gameOver();
      return;
    }

    // 将新头部添加到蛇身
    this.snake.unshift(head);

    // 检查是否吃到食物
    if (head.x === this.food.x && head.y === this.food.y) {
      this.score += 10;
      if (this.score > this.highScore) {
        this.highScore = this.score;
      }
      this.generateFood();
    } else {
      // 没吃到食物，移除尾部
      this.snake.pop();
    }
  }

  // 改变方向
  changeDirection(newDirection: Direction): void {
    // 防止反向移动
    if (
      (this.direction === Direction.UP && newDirection === Direction.DOWN) ||
        (this.direction === Direction.DOWN && newDirection === Direction.UP) ||
        (this.direction === Direction.LEFT && newDirection === Direction.RIGHT) ||
        (this.direction === Direction.RIGHT && newDirection === Direction.LEFT)
    ) {
      return;
    }

    this.direction = newDirection;
  }

  // 游戏结束
  gameOver(): void {
    this.isGameOver = true;
  }

  // 暂停/继续游戏
  togglePause(): void {
    if (!this.isGameOver) {
      this.isPaused = !this.isPaused;
    }
  }

  // 重新开始游戏
  restart(): void {
    this.initGame();
  }

  // 获取网格宽度
  getGridWidth(): number {
    return this.gridWidth;
  }

  // 获取网格高度
  getGridHeight(): number {
    return this.gridHeight;
  }
}