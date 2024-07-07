class Block extends Square {
    color c;
    boolean hitFlag;
    Code code;
    int fallCounter = 0;
    
    // constructor
    public Block(float x, float y, float w, float h, color c) {
        pos = new Pos(x, y);
        Width = w;
        Height = h;
        this.c = c;
        float maxRGB = max(red(c), green(c), blue(c));
        float minRGB = min(red(c), green(c), blue(c));
        float maxMinSum = maxRGB + minRGB;
    }
    
    public Block(float x, float y, float w, float h, color c, Code code) {
        pos = new Pos(x, y);
        Width = w;
        Height = h;
        this.c = c;
        float maxRGB = max(red(c), green(c), blue(c));
        float minRGB = min(red(c), green(c), blue(c));
        float maxMinSum = maxRGB + minRGB;
        this.code = code;
        if (code == Code.EMPTY) {
            hitFlag = true;
        }
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
        if (hitFlag || code == Code.NONE || code == Code.EMPTY) {
            return;
        }
        fill(c);
        text(code.toString(), pos.x + Width / 2 - 20, pos.y + Height / 2);
        fill(originColor);
    }
    
    public void moveText(Block underBlock) {
        if (code == Code.NONE || code == Code.EMPTY) {
            return;
        }
        if (underBlock.isExist()) {
            return;
        }
        fallCounter += 1;
        if (fallCounter > Const.FALL_THRESHOLD) {
            underBlock.receiveText(this.passText());
            fallCounter = 0;
        }
    }
    
    public void moveText(Bar bar) {
        fallCounter += 1;
        if (fallCounter > Const.FALL_THRESHOLD) {
            this.passText();
            fallCounter = 0;
        }
    }
    
    public boolean isHit() {
        return hitFlag;
    }
    
    public void setHit(boolean hitFlag) {
        this.hitFlag = hitFlag;
        if (hitFlag) {
            this.code = Code.EMPTY;
        }
    }
    
    public Code getCode() {
        return code;
    }

    public boolean isExist() {
        if (code == Code.EMPTY) {
            return false;
        }
        return true;
    }

    public Code passText() {
        Code tmp = code;
        code = Code.EMPTY;
        return tmp;
    }

    public void receiveText(Code code) {
        this.code = code;
    }
}