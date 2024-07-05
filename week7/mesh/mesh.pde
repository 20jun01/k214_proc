import peasy.PeasyCam;
PeasyCam cam;
final float point = 300.0f;

void setup() {
    size(1280, 720, P3D);
    perspective();
    cam = new PeasyCam(this, 1500);
}

void draw() {
    background(0);
    //camera(1000, -1000, 1000, 0, 0, 0, 0, 1, 0);
    beginShape(TRIANGLE_STRIP);
    // front
    vertex(0 - point, 0 - point, point);
    vertex(point, 0 - point, point);
    vertex(0 - point, point, point);
    vertex(point, point, point);
    
    // under
    vertex(0 - point, point, 0 - point);
    vertex(point,point, 0 - point);
    
    // back
    vertex(0 - point, 0 - point, 0 - point);
    vertex(point, 0 - point, 0 - point);
    
    // top
    vertex(0 - point, 0 - point, point);
    vertex(point, 0 - point, point);
    
    // right
    vertex(point, 0 - point, 0 - point);
    vertex(point, point, point);
    vertex(point,point, 0 - point);
    
    // left
    vertex(0 - point, 0 - point, point);
    vertex(0 - point, 0 - point, 0 - point);
    vertex(0 - point, point, point);
    vertex(0 - point, point, 0 - point);
    
    endShape();
}
