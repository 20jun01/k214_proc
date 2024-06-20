void setup(){
    size(800, 600);
}

void draw(){
    background(255);
    if (mousePressed) {
        ellipse(mouseX, mouseY, 300, 300);
    } else {
        rect(100, 100, 200, 200);
    }
}