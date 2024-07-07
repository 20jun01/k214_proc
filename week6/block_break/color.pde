public enum Color {
    BLACK,
    RANDOM;
}

public class ThemeColor {
    int main = color(33, 33, 33);
    int sub = color(50, 50, 50);
    int subsub = color(13, 115, 119);
    int accent = color(20, 255, 236);
    public color getRandomColor() {
        return color(random(255), random(255), random(255));
    }
}
