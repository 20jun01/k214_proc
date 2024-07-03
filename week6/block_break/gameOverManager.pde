public class GameOverManager extends SceneManager {
    public GameOverManager() {
    }
    public Scene update(KeyState keyState){
        if (keyState.get(ENTER)) {
            return Scene.TITLE;
        }
        return Scene.GAMEOVER;
    }
    public void display(){
        background(0);
        fill(255);
        textSize(20);
        text("Game Over", width / 2 - 40, height / 2);
        textSize(20);
        text("Press Enter to restart", width / 2 - 100, height / 2 + 50);
    }
}