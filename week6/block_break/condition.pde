public class Condition {
    boolean isBlackHard = false;
    boolean isYouBar = false;
    boolean isYouBall = false;
    boolean isTextFall = false;
    boolean isGameClear = false;
    public Condition(){

    }

    public void resetCondition() {
        isBlackHard = false;
        isYouBar = false;
        isYouBall = false;
        isTextFall = false;
        isGameClear = false;
    }

    public void checkCondition(Code code1, Code code2) {
        isGameClear |= code1 == Code.GAME && code2 == Code.CLEAR;
    }

    public void checkCondition(Code code1, Code code2, Code code3) {
        isBlackHard |= code1 == Code.COLOR && code2 == Code.IS && code3 == Code.HARD;
        isYouBar |= code1 == Code.BAR && code2 == Code.IS && code3 == Code.YOU;
        isYouBall |= code1 == Code.BALL && code2 == Code.IS && code3 == Code.YOU;
        isTextFall |= code1 == Code.TEXT && code2 == Code.IS && code3 == Code.FALL;
    }

    public boolean isBarYou() {
        return isYouBar;
    }

    public boolean isBallYou() {
        return isYouBall;
    }

    public boolean isTextFall() {
        return isTextFall;
    }
}