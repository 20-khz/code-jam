ParticleCollection pc;

float t = millis();

void setup() {
  size(800, 600);
  background(0);

  pc = new ParticleCollection();
  for (int i=0; i<10; i++) {
    pc.addParticle();
  }
}

void draw() {
  background(0);
  float dt = t-millis();
  t = millis();

  pc.draw(dt);
}

