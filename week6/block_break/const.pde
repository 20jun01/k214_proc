// 6 * 8
final Code[][] Codes = {
    {Code.NONE, Code.BAR, Code.IS, Code.YOU, Code.NONE, Code.TEXT, Code.IS, Code.FALL } ,
    {Code.NONE, Code.COLOR, Code.IS, Code.HARD, Code.NONE, Code.NONE, Code.NONE, Code.NONE} ,
    {Code.NONE, Code.NONE, Code.NONE, Code.NONE, Code.GAME, Code.NONE, Code.NONE, Code.NONE} ,
    {Code.EMPTY, Code.EMPTY, Code.NONE, Code.NONE, Code.NONE, Code.CLEAR, Code.NONE, Code.NONE} ,
    {Code.EMPTY, Code.EMPTY, Code.NONE, Code.NONE, Code.NONE, Code.NONE, Code.NONE, Code.NONE},
    {Code.EMPTY, Code.EMPTY, Code.EMPTY, Code.EMPTY,Code.EMPTY, Code.EMPTY,Code.EMPTY, Code.EMPTY}
};

final Color[][] Colors = {
    {
        Color.BLACK, Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,
    },
    {
        Color.BLACK, Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,
    },
    {
        Color.RANDOM, Color.BLACK,Color.BLACK,Color.BLACK,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,
    },
    {
        Color.RANDOM, Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,
    },
    {
        Color.RANDOM, Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,
    },
    {
        Color.RANDOM, Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,Color.RANDOM,
    }
};

class Const {
    // screen size
    static final int SCREEN_WIDTH = 800;
    static final int SCREEN_HEIGHT = 600;
    
    // block
    static final int BLOCK_NUM = 50;
    
    static final int VERTICAL_BLOCK_NUM = 6;
    static final int HORIZONTAL_BLOCK_NUM = 8;
    
    static final float HORIZONTAL_BLOCK_MARGIN = 0.0f;
    static final float VERTICAL_BLOCK_MARGIN = 1.0f;
    
    static final float BLOCK_WIDTH = 80.0f;
    static final float BLOCK_HEIGHT = 40.0f;
    
    static final float BLOCK_START_X = 80.0f;
    static final float BLOCK_START_Y = 10.0f;
    
    // ball
    static final float BALL_START_X = 400.0f;
    static final float BALL_START_Y = 400.0f;
    
    static final float BALL_START_VX = 5.0f;
    static final float BALL_START_VY = 5.0f;
    
    static final float BALL_RADIUS = 10.0f;
    
    // game
    static final int MISS_THRESHOLD = 3;
    static final int FALL_THRESHOLD = 50;
}