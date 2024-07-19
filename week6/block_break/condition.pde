import java.util.Arrays;
public class Condition {
    boolean isBlackHard = false;
    boolean isYouBar = false;
    boolean isYouBall = false;
    boolean isTextFall = false;
    boolean isGameClear = false;

    boolean[][] activeArray = new boolean[Const.VERTICAL_BLOCK_NUM][Const.HORIZONTAL_BLOCK_NUM];

    public Condition(){

    }

    public void resetCondition() {
        isBlackHard = false;
        isYouBar = false;
        isYouBall = false;
        isTextFall = false;
        isGameClear = false;
        for (int i = 0; i < Const.VERTICAL_BLOCK_NUM; i++) {
            Arrays.fill(activeArray[i], false);
        }
    }

    public void checkCondition(Code code1, Code code2) {
        isGameClear |= code1 == Code.GAME && code2 == Code.CLEAR;
    }

    public void checkCondition(Code code1, Code code2, int rowIndex, int colIndex) {
        boolean isFlagTrue = code1 == Code.GAME && code2 == Code.CLEAR;
        activeArray[rowIndex][colIndex] |= isFlagTrue;
        activeArray[rowIndex][colIndex + 1] |= isFlagTrue;
        isGameClear |= isFlagTrue;
    }

    public void checkCondition(Code code1, Code code2, Code code3) {
        isBlackHard |= code1 == Code.COLOR && code2 == Code.IS && code3 == Code.HARD;
        isYouBar |= code1 == Code.BAR && code2 == Code.IS && code3 == Code.YOU;
        isYouBall |= code1 == Code.BALL && code2 == Code.IS && code3 == Code.YOU;
        isTextFall |= code1 == Code.TEXT && code2 == Code.IS && code3 == Code.FALL;
    }

    public void checkCondition(Code code1, Code code2, Code code3, int rowIndex, int colIndex) {
        boolean iBH = code1 == Code.COLOR && code2 == Code.IS && code3 == Code.HARD;
        boolean iYBar = code1 == Code.BAR && code2 == Code.IS && code3 == Code.YOU;
        boolean iYBall = code1 == Code.BALL && code2 == Code.IS && code3 == Code.YOU;
        boolean iTF = code1 == Code.TEXT && code2 == Code.IS && code3 == Code.FALL;
        boolean isFlagTrue = iBH || iYBar || iYBall || iTF;

        activeArray[rowIndex][colIndex] |= isFlagTrue;
        activeArray[rowIndex][colIndex + 1] |= isFlagTrue;
        activeArray[rowIndex][colIndex + 2] |= isFlagTrue;

        isBlackHard |= iBH;
        isYouBar |= iYBar;
        isYouBall |= iYBall;
        isTextFall |= iTF;
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

    public boolean isBlackHard() {
        return isBlackHard;
    }

    public boolean isGameClear() {
        return isGameClear;
    }

    public boolean isActive(int rowIndex, int colIndex) {
        return activeArray[rowIndex][colIndex];
    }
}