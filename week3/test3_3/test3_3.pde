Bar bar;
void setup(){
    size(800, 600);
    bar = new Bar();
}

void draw() {
    background(255);
    bar.move(keyPressed, keyCode, width);
    bar.display();
}