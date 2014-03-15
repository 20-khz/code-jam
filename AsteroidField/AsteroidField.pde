Particle p;
float t = millis();
void setup() {
  size(800, 600);
  background(0);
  p = new Particle();
}

void draw() {
  float dt = t-millis();
  t = millis();
  
   p.move(dt);
   ellipse(p.x, p.y, p.r, p.r);
}
