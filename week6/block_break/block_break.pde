GameManager gameManager;
ThemeColor theme;
PFont darFont;

void setup() {
    size(800, 600);

    // set font
    darFont = loadFont("DarumadropOne-Regular-128.vlw");
    textFont(darFont);

    KeyState.initialize();
    theme = new ThemeColor();
    gameManager = new GameManager(new TitleManager(), new GameSceneManager(), new GameOverManager(), new GameClearManager(), KeyState.getInstance());
}

void draw() {
    background(theme.main);
    gameManager.update();
    gameManager.display();
}
