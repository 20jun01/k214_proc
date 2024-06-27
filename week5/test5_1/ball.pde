class Ball {
    Pos pos;
    Velocity v;
    float radius;

    public Ball(float x, float y, float vx, float vy, float radius) {
        this.pos = new Pos(x, y);
        this.v = new Velocity(vx, vy);
        this.radius = radius;
    }

    public boolean move() {
        pos.x += v.x;
        pos.y += v.y;
        if (pos.x < radius || pos.x > width - radius) {
            v.x *= -1;
        }
        if (pos.y < radius) {
            v.y *= -1;
        }
        if (pos.y > height - radius) {
            pos.x = width / 2;
            pos.y = height / 2;
            v.x = random(-5, 5);
            v.y = random(-5, 5);
            return true;
        }
        return false;
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

        if (bar.getVelocity().x > 0.0f) {
            v.x = abs(v.x);
        } else if (bar.getVelocity().x < 0.0f) {
            v.x = -abs(v.x);
        }

        v.y *= -1;
    }

    public boolean handleCollision(Block block) {
        if (block.isHit()) {
            return true;
        }
        if (!isCollidedWith(block)) {
            return false;
        }

        Pos p = block.getPos();

        if (pos.x < p.x || pos.x > p.x + block.Width) {
            v.x *= -1;
        } else {
            v.y *= -1;
        }

        return true;
    }

    public boolean isCollidedWith(Square sq) {
        boolean isCollided = false;
        for (int i = 0; i < 4; i++) {
            isCollided |= sq.isInArea(pos.x + radius * cos(PI / 4 * i), pos.y + radius * sin(PI / 4 * i));
        }
        return isCollided;
    }
}