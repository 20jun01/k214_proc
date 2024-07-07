enum Scene {
    TITLE, GAME, GAMEOVER, CLEAR,
}

public class GameManager {
    Scene currentScene = Scene.TITLE;
    SceneManager titleManager;
    SceneManager gameManager;
    SceneManager gameOverManager;
    KeyState keyState;
    
    public GameManager(SceneManager titleManager, SceneManager gameManager, SceneManager gameOverManager, KeyState keyState) {
        this.titleManager = titleManager;
        this.gameManager = gameManager;
        this.gameOverManager = gameOverManager;
        this.keyState = keyState;
    }
    
    public void update() {
        Scene nextScene = currentScene;
        switch(currentScene) {
            case TITLE:
                nextScene = titleManager.update(keyState);
                break;
            case GAME:
                nextScene = gameManager.update(keyState);
                break;
            case GAMEOVER:
                nextScene = gameOverManager.update(keyState);
                break;
            case GAMECLEAR:
                nextScene = gameClearManager.update(keyState);
        }
        if (nextScene != currentScene) {
            currentScene = nextScene;
        }
    }
    
    public void display() {
        switch(currentScene) {
            case TITLE:
                titleManager.display();
                break;
            case GAME:
                gameManager.display();
                break;
            case GAMEOVER:
                gameOverManager.display();
                break;
            case CLEAR:
                gameClearManager.display();
        }
    }
}