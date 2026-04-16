import { SnakeGame, Direction, Point } from '../model/SnakeGame';

@Entry
@Component
struct Index {
  // 游戏实例
  private game: SnakeGame = new SnakeGame();

  // 定时器ID
  private timer: number = -1;

  // 游戏速度（毫秒）
  private gameSpeed: number = 150;

  // 网格单元格大小
  private cellSize: number = 18;

  // 状态变量，用于触发UI更新
  @State updateFlag: number = 0;

  aboutToAppear(): void {
    this.startGame();
  }

  aboutToDisappear(): void {
    this.stopGame();
  }

  // 开始游戏循环
  startGame(): void {
    this.timer = setInterval(() => {
      if (!this.game.isGameOver && !this.game.isPaused) {
        this.game.moveSnake();
        this.updateFlag++;
      }
    }, this.gameSpeed);
  }

  // 停止游戏
  stopGame(): void {
    if (this.timer !== -1) {
      clearInterval(this.timer);
      this.timer = -1;
    }
  }

  // 处理方向键点击
  handleDirectionClick(direction: Direction): void {
    this.game.changeDirection(direction);
  }

  // 重新开始游戏
  handleRestart(): void {
    this.game.restart();
    this.updateFlag++;
  }

  // 暂停/继续游戏
  handlePause(): void {
    this.game.togglePause();
    this.updateFlag++;
  }

  build() {
    Column() {
      // 标题栏
      this.TitleBar();

      // 游戏区域
      this.GameArea();

      // 控制区域
      this.ControlArea();
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#1a1a2e')
  }

  // 标题栏组件
  @Builder
  TitleBar() {
    Column() {
      Text('🐍 贪吃蛇')
        .fontSize(28)
        .fontColor('#e94560')
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 });

      Row() {
        Text(`分数: ${this.game.score}`)
          .fontSize(18)
          .fontColor('#ffffff')
          .margin({ right: 20 });

        Text(`最高分: ${this.game.highScore}`)
          .fontSize(18)
          .fontColor('#ffd700');
      }
      .margin({ bottom: 10 });

      // 游戏状态提示
      if (this.game.isGameOver) {
        Text('游戏结束！')
          .fontSize(20)
          .fontColor('#ff0000')
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 });
      } else if (this.game.isPaused) {
        Text('游戏暂停')
          .fontSize(20)
          .fontColor('#ffff00')
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 });
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center);
  }

  // 游戏区域组件
  @Builder
  GameArea() {
    Stack() {
      // 游戏背景网格
      Column() {
        ForEach(Array.from({ length: this.game.getGridHeight() }), (_: undefined, y: number) => {
          Row() {
            ForEach(Array.from({ length: this.game.getGridWidth() }), (_: undefined, x: number) => {
              this.Cell(x, y);
            }, (_: undefined, x: number) => x.toString());
          }
        }, (_: undefined, y: number) => y.toString());
      }
      .padding(2)
      .border({
        width: 3,
        color: '#e94560',
        style: BorderStyle.Solid
      })
      .borderRadius(8)
      .backgroundColor('#16213e');
    }
    .margin({ top: 10 });
  }

  // 单元格组件
  @Builder
  Cell(x: number, y: number) {
    Row() {
      // 判断是否是蛇身
      if (this.isSnakeCell(x, y)) {
        Row()
          .width(this.cellSize - 2)
          .height(this.cellSize - 2)
          .backgroundColor(this.isSnakeHead(x, y) ? '#00ff00' : '#32cd32')
          .borderRadius(4);
      }
      // 判断是否是食物
      else if (this.isFoodCell(x, y)) {
        Row()
          .width(this.cellSize - 2)
          .height(this.cellSize - 2)
          .backgroundColor('#ff6b6b')
          .borderRadius(this.cellSize / 2);
      }
      // 空白格子
      else {
        Row()
          .width(this.cellSize - 2)
          .height(this.cellSize - 2)
          .backgroundColor('#0f3460')
          .borderRadius(2);
      }
    }
    .width(this.cellSize)
    .height(this.cellSize)
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center);
  }

  // 判断是否是蛇身
  isSnakeCell(x: number, y: number): boolean {
    return this.game.snake.some((point: Point) => point.x === x && point.y === y);
  }

  // 判断是否是蛇头
  isSnakeHead(x: number, y: number): boolean {
    const head = this.game.snake[0];
    return head.x === x && head.y === y;
  }

  // 判断是否是食物
  isFoodCell(x: number, y: number): boolean {
    return this.game.food.x === x && this.game.food.y === y;
  }

  // 控制区域组件
  @Builder
  ControlArea() {
    Column() {
      // 方向控制按钮
      Column() {
        // 上方向
        this.DirectionButton('▲', Direction.UP);

        Row() {
          // 左方向
          this.DirectionButton('◀', Direction.LEFT);

          // 中间按钮（暂停/开始）
          Button(this.game.isPaused ? '▶' : '⏸')
            .width(60)
            .height(60)
            .fontSize(24)
            .backgroundColor('#e94560')
            .fontColor('#ffffff')
            .borderRadius(30)
            .margin({ left: 10, right: 10 })
            .onClick(() => this.handlePause());

          // 右方向
          this.DirectionButton('▶', Direction.RIGHT);
        }
        .margin({ top: 10, bottom: 10 });

        // 下方向
        this.DirectionButton('▼', Direction.DOWN);
      }
      .margin({ top: 20 });

      // 重新开始按钮
      Button('重新开始')
        .width(120)
        .height(45)
        .fontSize(18)
        .backgroundColor('#0f3460')
        .fontColor('#ffffff')
        .borderRadius(8)
        .margin({ top: 20 })
        .onClick(() => this.handleRestart());

      // 操作说明
      Text('使用方向按钮或滑动屏幕控制蛇的移动')
        .fontSize(14)
        .fontColor('#888888')
        .margin({ top: 15 });
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .margin({ top: 20 });
  }

  // 方向按钮组件
  @Builder
  DirectionButton(icon: string, direction: Direction) {
    Button(icon)
      .width(60)
      .height(60)
      .fontSize(24)
      .backgroundColor('#16213e')
      .fontColor('#ffffff')
      .borderRadius(30)
      .border({
        width: 2,
        color: '#e94560'
      })
      .onClick(() => this.handleDirectionClick(direction));
  }
}
