class Bar extends Square {
    Velocity v;

    // constructor
    public Bar() {
        pos = new Pos(width / 2, height - 50.0f);
        v = new Velocity(5.0f, 5.0f);
        Width = 200.0f;
        Height = 50.0f;
    }

    public void display() {
        rect(pos.x, pos.y, Width, Height);
    }

    public void move(boolean keyPressed, int keyCode, int screenWidth) {
        if (!keyPressed)return;
        if (keyCode == RIGHT) {
            v.x = abs(v.x);
        } 
        else if (keyCode == LEFT) {
            v.x = -abs(v.x);
        } else {
            v.x = 0;
        }
        pos.x = Math.min(Math.max(pos.x + v.x, 0), screenWidth - Width);
    }

    // TODO: shuould be impl for interface or abstract class
    public Velocity getVelocity() {
        return v;
    }
}
