class Ball {
    Pos pos;
    Velocity v;
    float radius;
    int respawn_num = 0;
    
    public Ball(float x, float y, float vx, float vy, float radius) {
        this.pos = new Pos(x, y);
        this.v = new Velocity(vx, vy);
        this.radius = radius;
    }

    public boolean moveYou() {
        // TODO: boolean to int & multiply
        if (KeyState.get(LEFT)) {
            pos.x -= abs(v.x);
        }
        if (KeyState.get(RIGHT)) {
            pos.x += abs(v.x);
        }
        if (KeyState.get(UP)) {
            pos.y -= abs(v.y);
        }
        if (KeyState.get(DOWN)) {
            pos.y += abs(v.y);
        }

        if (isDeathCondition()) {
            pos.x = width / 2;
            pos.y = height / 2;
            v.x = random(3, 5);
            v.y = random(3, 5);
            return true;
        }
        return false;
    }

    private boolean isDeathCondition() {
        return pos.y > height - radius ||
                pos.x > width - radius ||
                pos.y < 0 + radius ||
                pos.x < 0 + radius;
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
            respawn_num += 1;
            pos.x = width / 2;
            pos.y = height / 2;
            v.x = 5 - respawn_num * 2;
            v.y = 5 - respawn_num;
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
        
        float dx = 0;
        if (KeyState.get(RIGHT)) {
            dx += abs(v.x);
        }
        if (KeyState.get(LEFT)) {
            dx -= abs(v.x);
        }
        if (dx != 0) {
            v.x = dx;
        }
        
        Pos p = bar.getPos();
        if (p.y < pos.y - v.y  && pos.y < p.y + bar.Height - v.y) {
            if (pos.x < p.x + bar.Width / 2) {
                v.x = -abs(v.x);
            } else {
                v.x = abs(v.x);
            }
        } else {
            v.y *= -1;
        }
    }
    
    public boolean handleCollision(Block block) {
        if (block.isHit()) {
            return false;
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
        for (int i = 0; i < 8; i++) {
            isCollided |= sq.isInArea(pos.x + radius * cos(PI / 8 * i), pos.y + radius * sin(PI / 8 * i));
        }
        return isCollided;
    }
}