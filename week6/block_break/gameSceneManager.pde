public class GameSceneManager extends SceneManager {
    Bar bar;
    Ball ball;
    Block[] blocks;
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
                blocks[i * Const.VERTICAL_BLOCK_NUM + j] = new Block(Const.BLOCK_START_X + i * Const.BLOCK_WIDTH, Const.BLOCK_START_Y + j * Const.BLOCK_HEIGHT, Const.BLOCK_WIDTH, Const.BLOCK_HEIGHT, rowColor, Codes[j][i]);
            }
        }
        missCounter = 0;
    }
    
    public Scene update(KeyState keyState) {
        missCounter = moveCall(missCounter);
        collisionCall();
        if (missCounter >= Const.MISS_THRESHOLD) {
            missCounter = 0;
            return Scene.GAMEOVER;
        }
        return Scene.GAME;
    }

    // return miss count's sum
    private int moveCall(int missCounter) {
        int count = missCounter;
        bar.move(width);
        boolean isMissed = ball.move();
        count += isMissed ? 1 : 0;
        return count;
    }
    
    private void collisionCall() {
        ball.handleCollision(bar);
        for (Block block : blocks) {
            if (block != null) {
                block.setHit(ball.handleCollision(block));
            }
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