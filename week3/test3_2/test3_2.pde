float x = 25;
float y = 25;


float vx = 4;
float vy = 4;

void setup() {
    size(800, 600);
}

void draw() {
    background(255);
    x += vx;
    y += vy;
    if (x + 25 > width || x < 25) {
        vx = -vx;
        vx *= 1.15;
        vx = Math.max(Math.min(vx, 10.0), -10.0);
    }
    if (y + 25 > height || y < 25) {
        vy = -vy;
        vy *= 1.15;
        vy = Math.max(Math.min(vy, 10.0), -10.0);
    }
    ellipse(x, y, 50, 50);
}

