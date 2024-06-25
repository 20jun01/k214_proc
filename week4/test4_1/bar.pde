class Bar {
    Pos pos;
    Velocity v;
    float barWidth;
    float barHeight;
    
    // constructor
    public Bar() {
        pos = new Pos(width / 2, height - 50.0f);
        v = new Velocity(5.0f, 5.0f);
        barWidth = 200.0f;
        barHeight = 50.0f;
    }
    
    public void display() {
        rect(pos.x, pos.y, barWidth, barHeight);
    }
    
    public void move(boolean keyPressed, int keyCode, int screenWidth) {
        if (!keyPressed)return;
        if (keyCode == RIGHT) {
            pos.x = Math.min(pos.x + v.x, screenWidth - barWidth);
        } 
        else if (keyCode == LEFT) {
            pos.x = Math.max(pos.x - v.x, 0);
        }
    }

    // TODO: shuould be impl for interface or abstract class
    public Pos getPos() {
        return pos;
    }

    public Velocity getVelocity() {
        return v;
    }

    public boolean isInArea(float x, float y) {
        return x >= pos.x && x <= pos.x + barWidth && y >= pos.y && y <= pos.y + barHeight;
    }

    public boolean isInArea(Pos p) {
        return p.x >= pos.x && p.x <= pos.x + barWidth && p.y >= pos.y && p.y <= pos.y + barHeight;
    }
}
