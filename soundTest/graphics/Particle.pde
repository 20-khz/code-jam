class Particle {
  float x, y, radius, angle, speed;
  Particle() {
    x = random(width);
    y = random(height);
    radius = random(2, 10);
    angle = random(TAU);
    speed = random(2, 5);
  }
  void draw() {
    stroke(255);
    noFill();
    ellipse(x, y, radius, radius);
  }
  void move() {
    x += speed * cos(angle);
    y += speed * sin(angle);
    wrap();
  }
  void wrap() {
    x = (width + x) % width;
    y = (height + y) % height;
  }
}

