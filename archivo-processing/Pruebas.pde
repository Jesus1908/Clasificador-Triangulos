void setup() {
  pixelDensity(1);
  size(64, 64);
  noLoop();
}

void draw() {
  for (int t = 0; t < 6; t++) {
    String prefix = "";
    if (t == 0) prefix = "trianguloRTA";
    if (t == 1) prefix = "trianguloRTB";
    if (t == 2) prefix = "trianguloRTC";
    if (t == 3) prefix = "trianguloRTAD";
    if (t == 4) prefix = "trianguloACUTA";
    if (t == 5) prefix = "trianguloACUTB";

    for (int i = 1; i <= 100; i++) {
      background(255);
      strokeWeight(4);
      stroke(100, 100, 100);
      fill(255);

      pushMatrix();
      translate(width / 2, height / 2);
      rotate(random(-0.08, 0.08));

      if (t == 0) drawRectATriangle();
      if (t == 1) drawRectBTriangle();
      if (t == 2) drawRectDTriangle();
      if (t == 3) drawRectCTriangle(); 
      if (t == 4) drawAcuteATriangle();
      if (t == 5) drawAcuteBTriangleUpsideDown(); 

      popMatrix();

      saveTrimmed(prefix, i);
    }
  }
  exit();
}

void drawRectATriangle() {
  float s = 24;
  triangle(-s, s, s, s, -s, -s);
}

void drawRectBTriangle() {
  float s = 24;
  triangle(s, s, s, -s, -s, s);
}

void drawRectCTriangle() {
  float s = 24;
  triangle(s, -s, -s, -s, s, s);
}

void drawRectDTriangle() {
  float s = 24;
  triangle(-s, -s, -s, s, s, -s);
}

void drawAcuteATriangle() {
  float s = 22;
  triangle(0, -s, s * 0.87, s * 0.5, -s * 0.87, s * 0.5);
}

void drawAcuteBTriangleUpsideDown() {
  float s = 24;
  triangle(0, s, -s * 0.95, -s * 0.31, s * 0.6, -s * 0.8);
}

void saveTrimmed(String prefix, int count) {
  PImage trimmed = get(0, 0, width, height);
  String filename = String.format("data/%s%03d.png", prefix, count);
  trimmed.save(filename);
}
