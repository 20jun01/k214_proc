class Block {
    Pos pos;
    float blockWidth;
    float blockHeight;
    color c;
    boolean hitFlag;
    
    // constructor
    public Block(float x, float y, float w, float h, color c) {
        pos = new Pos(x, y);
        blockWidth = w;
        blockHeight = h;
        this.c = c;
    }

    public void display(color originColor) {
        if (hitFlag) {
            return;
        }
        fill(c);
        rect(pos.x, pos.y, blockWidth, blockHeight);
        fill(originColor);
    }

    public boolean isHit() {
        return hitFlag;
    }

    public void setHit(boolean hitFlag) {
        this.hitFlag = hitFlag;
    }

    // TODO: generarize for Square?
    public boolean isCollidedWith(Ball ball) {
        return this.isInArea(ball.getPos());
    }

    public boolean isInArea(float x, float y) {
        return x >= pos.x && x <= pos.x + blockWidth && y >= pos.y && y <= pos.y + blockHeight;
    }

    public boolean isInArea(Pos p) {
        return p.x >= pos.x && p.x <= pos.x + blockWidth && p.y >= pos.y && p.y <= pos.y + blockHeight;
    }
}