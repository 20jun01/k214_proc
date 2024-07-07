public class GameClearManager extends SceneManager {
    public GameClearManager() {
    }
    public Scene update(KeyState keyState) {
        if (keyState.get(int(ENTER))) {
            return Scene.TITLE;
        }
        return Scene.GAMECLEAR;
    }
    public void display() {
        fill(255);
        textSize(20);
        text("Game Clear!!", width / 2 - 40, height / 2);
        textSize(20);
        text("Press Enter to restart", width / 2 - 100, height / 2 + 50);
    }
}