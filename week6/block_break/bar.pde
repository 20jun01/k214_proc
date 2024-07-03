class Bar extends Square {
    Velocity v;
    
    // constructor
    public Bar() {
        pos = new Pos(width / 2 - 100.0f, height - 50.0f);
        v = new Velocity(5.0f, 5.0f);
        Width = 200.0f;
        Height = 50.0f;
    }
    
    public void display() {
        rect(pos.x, pos.y, Width, Height);
    }
    
    public void move(boolean keyPressed, int keyCode, int screenWidth) {
        if (!keyPressed)return;
        float dx = 0;
        if (KeyState.get(LEFT)) {
            dx -= abs(v.x);
        }
        if (KeyState.get(RIGHT)) {
            dx += abs(v.x);
        }
        pos.x = Math.min(Math.max(pos.x + dx, 0), screenWidth - Width);
    }
    
    // TODO: shuould be impl for interface or abstract class
    public Velocity getVelocity() {
        return v;
    }
}
