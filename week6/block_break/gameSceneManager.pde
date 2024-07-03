public class GameSceneManager extends SceneManager {
    public GameSceneManager() {
    }
    public Scene update(KeyState keyState){
        return Scene.GAME;
    }
    public void display(){
        background(0);
        fill(255);
        textSize(20);
        text("Game", width / 2 - 20, height / 2);
    }
}