class Block extends Square {
    color c;
    color textColor;
    boolean hitFlag;
    Code code;
    
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

    public Block(float x, float y, float w, float h, color c, Code code) {
        pos = new Pos(x, y);
        Width = w;
        Height = h;
        this.c = c;
        float maxRGB = max(red(c), green(c), blue(c));
        float minRGB = min(red(c), green(c), blue(c));
        float maxMinSum = maxRGB + minRGB;
        textColor = color(maxMinSum - red(c), maxMinSum - green(c), maxMinSum - blue(c));
        this.code = code;
    }
    
    public void display(color originColor) {
        if (hitFlag || code != Code.NONE) {
            return;
        }
        fill(c);
        rect(pos.x, pos.y, Width, Height);
        fill(originColor);
    }

    public void displayCode(color originColor) {
        if (hitFlag) {
            return;
        }
        fill(textColor);
        text(code.toString(), pos.x + Width / 2 - 20, pos.y + Height / 2);
        fill(originColor);
    }
    
    public boolean isHit() {
        return hitFlag;
    }
    
    public void setHit(boolean hitFlag) {
        this.hitFlag = hitFlag;
    }
}