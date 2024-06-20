void setup(){
    size(800, 600);
    frameRate(30);
    textSize(32);
}

void draw(){
    background(255, 255, 255);
    // fillを下に追加した場合、色を戻さないと二回目以降で同じ色となってしまう
    fill(255, 255, 255);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255, 0, 255);
    text(mouseX, mouseX - 24, mouseY + 16);
}