public enum Code {
    NONE,
    EMPTY,
    BALL,
    BAR,
    BLOCK,
    HARD,
    IS,
    YOU,
    TEXT,
    FALL,
    GAME,
    CLEAR,
    NUMBER,
    COLOR;

    @Override
    public String toString() {
        switch(this) {
            case NONE: return "";
            case EMPTY: return "";
            case BALL: return "Ball";
            case BAR: return "Bar";
            case BLOCK: return "Block";
            case HARD: return "hard"; 
            case IS: return "is";
            case YOU: return "you";
            case TEXT: return "text";
            case FALL: return "fall";
            case GAME: return "Game";
            case CLEAR: return "Clear";
            case NUMBER: return "number";
            // TODO: change to parameter
            case COLOR: return "black";
            default: throw new IllegalArgumentException();
        }
    }
}