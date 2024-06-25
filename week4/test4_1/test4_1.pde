Bar bar;
Ball ball;
ThemeColor theme;
void setup(){
    size(800, 600);
    bar = new Bar();
    ball = new Ball(100.0f, 100.0f, 5.0f, 5.0f, 10.0f);
    theme = new ThemeColor();
}

void draw() {
    background(theme.main);

    bar.move(keyPressed, keyCode, width);
    ball.move();

    ball.handleCollision(bar);

    fill(theme.accent);
    bar.display();
    ball.display();
}