// 追従する円(近くでゆっくり)
float x =0;
float y = 0;
void setup() {
    size(800, 600);
}

void draw() {
    background(255);
    x = x + (mouseX - x) / 10;
    y = y + (mouseY - y) / 10;
    ellipse(x, y, 50, 50);
}
