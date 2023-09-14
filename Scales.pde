void setup() {
  size(400, 400);
  background(255); // White background
  noLoop();
}

void draw() {
  int numScalesX = width / 20; // scales in the X direction
  int numScalesY = height / 10; //  scales in the Y direction
  int scaleSize = 20; // Size of each scale


  for (int i = 0; i < numScalesX; i++) {
    for (int j = 0; j < numScalesY; j++) {
      float x = i * scaleSize;
      float y = j * scaleSize;
      float gradientValue = map(x, 0, width, 0, 1); // gradient value
      scale(int(x), int(y), gradientValue);
    }
  }
}

void scale(int x, int y, float gradientValue) {
  float clamWidth = 40;
  float clamHeight = 20;

//gradient
  color lightColor = color(255, 255, 255);
  color darkColor = color(152, 140, 198);
  color c = lerpColor(darkColor, lightColor, gradientValue);
 

  fill(c);
  stroke(0); 

  // clamshell scale shape
  beginShape();
  vertex(x, y);
  bezierVertex(x - clamWidth, y - clamHeight, x - clamWidth / 4, y + clamHeight / 2, x, y + clamHeight);
  bezierVertex(x + clamWidth / 4, y + clamHeight / 2, x + clamWidth, y - clamHeight, x, y);
  endShape(CLOSE);

  // Draw a smaller circle inside the clamshell-like scale to simulate a pearl
  fill(229, 225, 247); // Light blue fill for the "pearl"
  noStroke();
  ellipse(x, y + clamHeight / 4, clamWidth / 2, clamHeight / 2);
}
