ParticleCollection pc;
SoundEmittorCollection soundEmitters;
Sonification snd;

float t = millis();

void setup() {
  size(800, 600);
  background(0);

  pc = new ParticleCollection();
  
  for (int i=0; i<10; i++) {
    pc.addParticle();
  }
  
  soundEmitters = new SoundEmittorCollection();
  snd = new Sonification(pc, soundEmitters);  
}

void draw() {
  //background(0);
  fill(0,50);
  rect(0,0,width,height);
  fill(0,10);
  rect(0,0,width-1,height-1);
  for (int repeat=0; repeat<100; repeat++) {
    float dt = t-millis();
    t = millis();
    pc.add_emitter_force(soundEmitters);
    pc.move(dt);
  }
  pc.draw();
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
