class Ball {
    Pos pos;
    Velocity v;
    float radius;

    public Ball(float x, float y, float vx, float vy, float radius) {
        this.pos = new Pos(x, y);
        this.v = new Velocity(vx, vy);
        this.radius = radius;
    }

    public void move() {
        pos.x += v.x;
        pos.y += v.y;
        if (pos.x < radius || pos.x > width - radius) {
            v.x *= -1;
        }
        if (pos.y < radius || pos.y > height - radius) {
            v.y *= -1;
        }
    }

    public void display() {
        ellipse(pos.x, pos.y, radius * 2, radius * 2);
    }

    public Pos getPos() {
        return pos;
    }

    public Velocity getVelocity() {
        return v;
    }

    public void handleCollision(Bar bar) {
        if (!isCollidedWith(bar)) {
            return;
        }
        v.y *= -1;
    }

    // TODO: generarize for Square?
    public boolean isCollidedWith(Bar bar) {
        return bar.isInArea(pos);
    }
}