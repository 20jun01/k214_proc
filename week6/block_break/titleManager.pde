public class TitleManager extends SceneManager {
    public TitleManager() {
    }
    public Scene update(KeyState keyState){
        if (keyState.get(ENTER)) {
            return Scene.GAME;
        }
        return Scene.TITLE;
    }
    public void display(){
        background(0);
        fill(255);
        textSize(50);
        text("Block Break", width / 2 - 150, height / 2);
        textSize(20);
        text("Press Enter to start", width / 2 - 100, height / 2 + 50);
    }
}