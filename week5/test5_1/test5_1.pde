Bar bar;
Ball ball;
Block block;
ThemeColor theme;
int missCounter = 0;

void setup(){
    size(800, 600);
    bar = new Bar();
    ball = new Ball(100.0f, 100.0f, 5.0f, 5.0f, 10.0f);
    theme = new ThemeColor();
    block = new Block(10.0f, 10.0f, 10.0f, 50.0f, theme.subsub);
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
    block.setHit(ball.handleCollision(block));
}

void drawCall() {
    fill(theme.accent);
    bar.display();
    ball.display();
    block.display(theme.accent);
}
