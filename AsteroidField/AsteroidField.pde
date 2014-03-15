ParticleCollection pc;
SoundEmittorCollection soundEmitters; //<>//

float t = millis();

void setup() {
  size(800, 600);
  background(0);

  pc = new ParticleCollection();
  pc.addParticle();
  pc.addParticle();
  pc.addParticle();
  pc.addParticle();
  
  soundEmitters = new SoundEmittorCollection();
  soundEmitters.addEmitter();
}

void draw() {
  background(0);
  float dt = t-millis();
  t = millis();

  pc.draw(dt);
  soundEmitters.draw();
}
