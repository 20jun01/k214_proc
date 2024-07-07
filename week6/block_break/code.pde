public enum Code {
    NONE,
    BALL,
    BAR,
    BLOCK,
    IS,
    CONTROLLABLE,
    GAME,
    PLAYING,
    NUMBER,
    CLEAR;

    @Override
    public String toString() {
        switch(this) {
            case NONE: return "";
            case BALL: return "Ball";
            case BAR: return "Bar";
            case BLOCK: return "Block";
            case IS: return "is";
            case CONTROLLABLE: return "controllable";
            case GAME: return "Game";
            case PLAYING: return "playing";
            case CLEAR: return "clear";
            case NUMBER: return "number";
            default: throw new IllegalArgumentException();
        }
    }
}