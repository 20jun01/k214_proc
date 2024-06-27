Bar bar;
Ball ball;
Block[] blocks;
ThemeColor theme;
int missCounter = 0;

void setup() {
    size(800, 600);
    bar = new Bar();
    ball = new Ball(Const.BALL_START_X, Const.BALL_START_Y, Const.BALL_START_VX, Const.BALL_START_VY, Const.BALL_RADIUS);
    theme = new ThemeColor();
    blocks = new Block[Const.BLOCK_NUM];

    for (int i = 0; i < Const.HORIZONTAL_BLOCK_NUM; i++) {
        for (int j = 0; j < Const.VERTICAL_BLOCK_NUM; j++) {
            blocks[i * Const.VERTICAL_BLOCK_NUM + j] = new Block(Const.BLOCK_START_X + i * Const.BLOCK_WIDTH, Const.BLOCK_START_Y + j * Const.BLOCK_HEIGHT, Const.BLOCK_WIDTH, Const.BLOCK_HEIGHT, theme.getRandomColor());
        }
    }
}

void draw() {
    background(theme.main);
    
    moveCall();
    collisionCall();
    drawCall();
}

void moveCall() {
    bar.move(keyPressed, keyCode, width);
    boolean isMissed = ball.move();
    missCounter += isMissed ? 1 : 0;
    if (missCounter > 5) {
        println("Game Over!!");
        exit();
    }
}

void collisionCall() {
    ball.handleCollision(bar);
    for (Block block : blocks) {
        if (block != null) {
            block.setHit(ball.handleCollision(block));
        }
    }
}

void drawCall() {
    fill(theme.accent);
    bar.display();
    ball.display();
    for (Block block : blocks) {
        if (block != null) {
            block.display(theme.accent);
        }
    }
}
