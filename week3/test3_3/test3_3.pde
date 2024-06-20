Bar bar;
ThemeColor theme;
void setup(){
    size(800, 600);
    bar = new Bar();
    theme = new ThemeColor();
}

void draw() {
    background(theme.main);

    fill(theme.accent);
    bar.move(keyPressed, keyCode, width);
    bar.display();
}