class Square {
    Pos pos;
    float Width;
    float Height;

    public void display() {
        rect(pos.x, pos.y, Width, Height);
    }

    public boolean isCollidedWith(Ball ball) {
        return this.isInArea(ball.getPos());
    }

    public Pos getPos() {
        return pos;
    }

    public boolean isInArea(float x, float y) {
        return x >= pos.x && x <= pos.x + Width && y >= pos.y && y <= pos.y + Height;
    }

    public boolean isInArea(Pos p) {
        return p.x >= pos.x && p.x <= pos.x + Width && p.y >= pos.y && p.y <= pos.y + Height;
    }
}