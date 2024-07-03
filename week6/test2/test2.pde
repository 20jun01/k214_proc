size(800, 600);
ellipseMode(CORNER);
rectMode(CENTER);
translate(width/2, height/2);
background(255, 255, 255, 255);

int i = 0;
while (i < 100) {
    // rotate(radians(360/100));
    rotate(i / 3.0f);
    scale(0.99f);
    // rect(0, 0, 300, 300);
    ellipse(0, 0, 300, 300);
    i++;
}
