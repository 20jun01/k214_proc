GameManager gameManager;
ThemeColor theme;

void setup() {
    size(800, 600);
    KeyState.initialize();
    theme = new ThemeColor();
    gameManager = new GameManager(new TitleManager(), new GameSceneManager(), new GameOverManager(), KeyState.getInstance());
}

void draw() {
    background(theme.main);
    gameManager.update();
    gameManager.display();
}
