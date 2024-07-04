public static class KeyState {
    private static final HashMap<Integer, Boolean> states = new HashMap<Integer, Boolean>();
    
    private static KeyState instance = new KeyState();
    
    public static KeyState getInstance() {
        return instance;
    }
    
    private KeyState() {}
    
    static void initialize() {
        states.put(LEFT,  false);
        states.put(RIGHT, false);
        states.put(UP,    false);
        states.put(DOWN,  false);
        states.put(int(ENTER), false);
    }
    
    public static boolean get(int code) {
        return states.get(code);
    }
    
    public static void put(int code, boolean state) {
        states.put(code, state);
    }
}

void keyPressed() {
    KeyState.put(keyCode, true);
}

void keyReleased() {
    KeyState.put(keyCode, false);
}
