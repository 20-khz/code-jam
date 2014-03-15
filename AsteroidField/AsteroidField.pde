ParticleCollection pc;
SoundEmittorCollection soundEmitters;
Sonification snd;

float t = millis();

void setup() {
  size(800, 600);
  background(0);

  pc = new ParticleCollection();
  for (int i=0; i<2; i++) {
    pc.addParticle();
  }
  
  soundEmitters = new SoundEmittorCollection();
  snd = new Sonification(pc, soundEmitters);  
}

void draw() {
  background(0);
  float dt = t-millis();
  t = millis();

  pc.add_emitter_force(soundEmitters);
  pc.move(dt);
  pc.draw(dt);
  soundEmitters.draw();
  
  snd.checkCollisions();
}

void mousePressed() {
  if(mouseButton == LEFT) {
    for(int i=0; i < soundEmitters.size(); i++) {
      if (soundEmitters.getEmitter(i).intersects(float(mouseX), float(mouseY))) {
        soundEmitters.destroyEmitter(i);
        return;
      }
    }
    soundEmitters.addEmitter(mouseX, mouseY);
  }
}
