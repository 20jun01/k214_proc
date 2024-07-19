class Block extends Square {
    color c;
    color inactiveColor;
    boolean hitFlag;
    Code code;
    Color colorCode;
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
    
    public Block(float x, float y, float w, float h, color c, color inactiveColor, Code code, Color colorCode) {
        pos = new Pos(x, y);
        Width = w;
        Height = h;
        this.c = c;
        this.inactiveColor = inactiveColor;
        float maxRGB = max(red(c), green(c), blue(c));
        float minRGB = min(red(c), green(c), blue(c));
        float maxMinSum = maxRGB + minRGB;
        this.code = code;
        this.colorCode = colorCode;
        if (code == Code.EMPTY) {
            hitFlag = true;
        }
    }
    
    public void display(color originColor) {
        if (hitFlag || code != Code.NONE) {
            return;
        }
        if (colorCode != Color.RANDOM) {
            fill(color(colorCode.getColor()));
        } else{
            fill(c);
        }
        rect(pos.x, pos.y, Width, Height);
        fill(originColor);
    }
    
    public void displayCode(color originColor, boolean isActive) {
        if (hitFlag || code == Code.NONE || code == Code.EMPTY) {
            return;
        }
        if (isActive) {
            fill(c);
        } else{
            fill(inactiveColor);
        }
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
    
    public void setHit(boolean hitFlag, boolean isBlackHard) {
        if (isBlackHard && colorCode == Color.BLACK) {
            return;
        }
        this.hitFlag |= hitFlag;
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
        if (code == Code.EMPTY || code == Code.NONE) {
            return;
        }
        this.hitFlag = false;
    }
}