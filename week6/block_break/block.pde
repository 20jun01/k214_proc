class Block extends Square {
    color c;
    color textColor;
    boolean hitFlag;
    
    // constructor
    public Block(float x, float y, float w, float h, color c) {
        pos = new Pos(x, y);
        Width = w;
        Height = h;
        this.c = c;
        float maxRGB = max(red(c), green(c), blue(c));
        float minRGB = min(red(c), green(c), blue(c));
        float maxMinSum = maxRGB + minRGB;
        textColor = color(maxMinSum - red(c), maxMinSum - green(c), maxMinSum - blue(c));
    }
    
    public void display(color originColor) {
        if (hitFlag) {
            return;
        }
        fill(c);
        rect(pos.x, pos.y, Width, Height);
        fill(textColor);
        text("Block", pos.x + Width / 2 - 20, pos.y + Height / 2);
        fill(originColor);
    }
    
    public boolean isHit() {
        return hitFlag;
    }
    
    public void setHit(boolean hitFlag) {
        this.hitFlag = hitFlag;
    }
}