Bar bar;
Ball ball;
ThemeColor theme;
int missCounter = 0;

void setup(){
    size(800, 600);
    bar = new Bar();
    ball = new Ball(100.0f, 100.0f, 5.0f, 5.0f, 10.0f);
    theme = new ThemeColor();
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
}

void drawCall() {
    fill(theme.accent);
    bar.display();
    ball.display();
}
