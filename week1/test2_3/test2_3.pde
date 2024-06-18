int x = 100;
int y = 100;

void setup() {
    size(800, 600);
}

void draw() {
    background(255);
    ellipse(x, y, 50, 50);
    if (x >= width) {
        x = 0;
    } else {
        x += 1;
    }
    if (y >= height) {
        y = 0;
    } else {
        y += 1;
    }
}
