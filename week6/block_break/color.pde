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
    color[] downColors = {
        color(225 / 2, 83 / 2, 89 / 2, 191), // red
            color(238 / 2, 120 / 2, 69 / 2, 191), // orange
            color(233 / 2, 179 / 2, 41 / 2, 191), // yellow
            color(159 / 2, 90 / 2, 211 / 2, 191), // purple
            color(73/2, 199/2, 65/2, 191), // green
            color(100/2, 145/2, 227/2, 191), // blue
        };

    public color getRandomColor() {
        return color(random(255), random(255), random(255));
    }
    
    public color getColor(int i) {
        return colors[i % colors.length];
    }

    public color getDownColor(int i) {
        return downColors[i % downColors.length];
    }
}
