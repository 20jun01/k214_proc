public class GameSceneManager extends SceneManager {
    Bar bar;
    Ball ball;
    Block[] blocks;
    Condition conditions;
    ThemeColor theme;
    int missCounter;
    
    public GameSceneManager() {
        bar = new Bar();
        ball = new Ball(Const.BALL_START_X, Const.BALL_START_Y, Const.BALL_START_VX, Const.BALL_START_VY, Const.BALL_RADIUS);
        theme = new ThemeColor();
        blocks = new Block[Const.BLOCK_NUM];
        for (int j = 0; j < Const.VERTICAL_BLOCK_NUM; j++) {
            color rowColor = theme.getRandomColor();
            for (int i = 0; i < Const.HORIZONTAL_BLOCK_NUM; i++) {
                blocks[i * Const.VERTICAL_BLOCK_NUM + j] = new Block(Const.BLOCK_START_X + i * Const.BLOCK_WIDTH, Const.BLOCK_START_Y + j * Const.BLOCK_HEIGHT, Const.BLOCK_WIDTH, Const.BLOCK_HEIGHT, rowColor, Codes[j][i], Colors[j][i]);
            }
        }
        missCounter = 0;
        conditions = new Condition();
        checkConditions(blocks);
    }
    
    public Scene update(KeyState keyState) {
        missCounter = moveCall(missCounter, conditions);
        checkConditions(blocks);
        collisionCall(conditions);
        if (missCounter >= Const.MISS_THRESHOLD) {
            missCounter = 0;
            return Scene.GAMEOVER;
        }
        if (conditions.isGameClear()) {
            return Scene.GAMECLEAR;
        }
        return Scene.GAME;
    }

    // return miss count's sum
    private int moveCall(int missCounter, Condition conditions) {
        int count = missCounter;
        boolean isMissed = false;
        if (conditions.isBarYou()) {
            bar.moveYou(width);
        }
        
        if (conditions.isBallYou()) {
            isMissed = ball.moveYou();
        } else {
            isMissed = ball.move();
        }
        count += isMissed ? 1 : 0;
        if (conditions.isTextFall()) {
            moveText();
        }
        return count;
    }

    private void moveText() {
        for (int j = 0; j < Const.VERTICAL_BLOCK_NUM - 1; j++) {
            for (int i = 0; i < Const.HORIZONTAL_BLOCK_NUM; i++) {
                // pass text to under block
                blocks[i * Const.VERTICAL_BLOCK_NUM + j].moveText(blocks[i * Const.VERTICAL_BLOCK_NUM + j + 1]);
            }
        }

        for (int i = 0; i < Const.HORIZONTAL_BLOCK_NUM; i++) {
            blocks[i * Const.VERTICAL_BLOCK_NUM + Const.VERTICAL_BLOCK_NUM - 1].moveText(bar);
        }
    }
    
    private void collisionCall(Condition conditions) {
        ball.handleCollision(bar);
        for (Block block : blocks) {
            if (block != null) {
                block.setHit(ball.handleCollision(block), conditions.isBlackHard());
            }
        }
    }

    private void checkConditions(Block[] blocks) {
        conditions.resetCondition();
        for (int j = 0; j < Const.VERTICAL_BLOCK_NUM; j++) {
            checkRowConditions(blocks, j);
        }
    }

    private void checkRowConditions(Block[] blocks, int rowIndex) {
        for (int i = 0; i < Const.HORIZONTAL_BLOCK_NUM - 1; i++) {
            conditions.checkCondition(blocks[i * Const.VERTICAL_BLOCK_NUM + rowIndex].getCode(), blocks[(i + 1) * Const.VERTICAL_BLOCK_NUM + rowIndex].getCode());
        }

        for (int i = 0; i < Const.HORIZONTAL_BLOCK_NUM - 2; i++) {
            conditions.checkCondition(blocks[i * Const.VERTICAL_BLOCK_NUM + rowIndex].getCode(), blocks[(i + 1) * Const.VERTICAL_BLOCK_NUM + rowIndex].getCode(),  blocks[(i + 2) * Const.VERTICAL_BLOCK_NUM + rowIndex].getCode());
        }
    }

    public void display() {
        fill(theme.accent);
        bar.display();
        ball.display();
        for (Block block : blocks) {
            if (block != null) {
                block.display(theme.accent);
            }
        }
        for (Block block : blocks) {
            if (block != null) {
                block.displayCode(theme.accent);
            }
        }
    }
}