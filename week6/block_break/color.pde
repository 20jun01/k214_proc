public enum Color {
    BLACK,
    RANDOM;
    
    public int getColor() {
        if (this == BLACK) {
            return 0;
        }
        return 0;
    }
}

public class ThemeColor {
    int main = color(33, 33, 33);
    int sub = color(50, 50, 50);
    int subsub = color(13, 115, 119);
    int accent = color(20, 255, 236);
    color[] colors = {
        color(225, 83, 89), // red
            color(238, 120, 69), // orange
            color(233, 179, 41), // yellow
            color(159, 90, 211), // purple
            color(73, 199, 65), // green
            color(100, 145, 227), // blue
        };
    public color getRandomColor() {
        return color(random(255), random(255), random(255));
    }
    
    public color getRowColor(int i) {
        return colors[i % colors.length];
    }
}
