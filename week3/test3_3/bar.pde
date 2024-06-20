class Bar {
    float x;
    float y;
    float vx;
    float vy;
    float barWidth;
    float barHeight;
    
    // constructor
    public Bar() {
        x = width / 2;
        y = height - 50.0f;
        vx = 5.0f;
        vy = 5.0f;
        barWidth = 200.0f;
        barHeight = 50.0f;
    }
    
    public void display() {
        rect(x, y, barWidth, barHeight);
    }
    
    public void move(boolean keyPressed, int keyCode, int screenWidth) {
        if (!keyPressed)return;
        if (keyCode == RIGHT) {
            x = Math.min(x + vx, screenWidth - barWidth);
        } 
        else if (keyCode == LEFT) {
            x = Math.max(x - vx, 0);
        }
    }
}
