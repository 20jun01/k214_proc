enum Scene {
    TITLE, GAME, GAMEOVER
}

class GameManager {
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
        }
    }
    
    public void display() {
        switch(currentScene) {
            case TITLE:
                titleManager.displayTitle();
                break;
            case GAME:
                gameManager.displayGame();
                break;
            case GAMEOVER:
                gameOverManager.displayGameOver();
                break;
        }
    }
}