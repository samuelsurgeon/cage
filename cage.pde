import peasy.*;

int DIM = 32;
int noiseOffset = 500;
PeasyCam cam;

float xoff = 0.0;
float yoff = 1000.0;  // Different starting point for y-axis noise
float zoff = 2000.0;  // Different starting point for z-axis noise

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 160);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void draw() {
  xoff += 0.01;  // Increment the noise offset
  yoff += 0.01;
  zoff += 0.01;

  float xRot = map(noise(xoff), 0, 1, -PI / noiseOffset, PI / noiseOffset);  // Map noise to rotation range
  float yRot = map(noise(yoff), 0, 1, -PI / noiseOffset, PI / noiseOffset);
  float zRot = map(noise(zoff), 0, 1, -PI / noiseOffset, PI / noiseOffset);

  cam.rotateX(xRot);  // Apply rotations to the camera
  cam.rotateY(yRot);
  cam.rotateZ(zRot);

  float n = noise(xoff) * 0.1;
  float o = noise(yoff) * 0.1;
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
        point(x + n, y + o, z + n);
      }
    }
  }
}
