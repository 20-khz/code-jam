ParticleCollection pc;
SoundEmittorCollection soundEmitters;
Sonification snd;

float t = millis();

void setup() {
  size(800, 600, P2D);
  background(0);

  pc = new ParticleCollection();
  soundEmitters = new SoundEmittorCollection();
  
  snd = new Sonification(pc, soundEmitters);
  pc.setSnd(snd);  
  
  for (int i=0; i<4; i++) {
    pc.addParticle();
  }  
}

void draw() {
  background(0);
  //fill(0,10);
  //rect(0,0,width-1,height-1);
  
  for (int repeat=0; repeat<1; repeat++) {
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
    soundEmitters.clicked(mouseX, mouseY);
  }
}
