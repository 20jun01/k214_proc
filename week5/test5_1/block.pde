class Block extends Square {
    color c;
    boolean hitFlag;

    // constructor
    public Block(float x, float y, float w, float h, color c) {
        pos = new Pos(x, y);
        Width = w;
        Height = h;
        this.c = c;
    }

    public void display(color originColor) {
        if (hitFlag) {
            return;
        }
        fill(c);
        rect(pos.x, pos.y, Width, Height);
        fill(originColor);
    }

    public boolean isHit() {
        return hitFlag;
    }

    public void setHit(boolean hitFlag) {
        this.hitFlag = hitFlag;
    }
}