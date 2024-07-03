size(800, 600);
translate(width/2, height/2);
scale(20);

int i = 0;
while(i < 1000 ) {
    fill(i, 255, i/2);
    rotate(0.1);
    scale(0.99);
    rect(0, 0, 50, 50);
    i++;
}