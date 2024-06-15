import peasy.*;

int DIM = 32;
PeasyCam cam;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 160);
}

float xoff = 0.0;

void draw() {
  xoff = xoff + 1;
  float n = noise(xoff) * 0.4;
  float o = noise(xoff) * 0.4;
  int randomSize = (int)(Math.random() * (n * n * n * 500) + 1);
  background(35 * n, 13 * n, n * 100);

  for (int i = 0; i < DIM; i++) {
    for (int j = 0; j < DIM; j++) {
      for (int k = 0; k < DIM; k++) {
        float x = map(i, 0, DIM, -100, 100);
        float y = map(j, 0, DIM, -100, 100);
        float z = map(k, 0, DIM, -100, 100);
        strokeWeight(randomSize);
        stroke(13, 242, 5);
        point(x + n,y + o,z + n);
      }
    }
  }
}
