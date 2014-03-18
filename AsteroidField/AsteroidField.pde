ParticleCollection pc;
SoundEmittorCollection soundEmitters;
Sonification snd;
DisposeHandler dh;
Spaceship player;

float t = millis();

void setup() {
  dh = new DisposeHandler(this);
  player = new Spaceship();
  size(800, 600, P2D);
  background(0);

  pc = new ParticleCollection();
  soundEmitters = new SoundEmittorCollection();

  snd = new Sonification(pc, soundEmitters);
  pc.setSnd(snd);  

  pc.addParticle();

  println("+ to add, - to remove, q for exit");
}

void draw() {
  background(0);
  //fill(0,10);
  stroke(255);
  rect(0, 0, width-1, height-1);

  for (int repeat=0; repeat<1; repeat++) {
    float dt = t-millis();
    t = millis();
    pc.add_emitter_force(soundEmitters);
    pc.applySpringForces();
    pc.move(dt);
    player.move(dt);
  }
  pc.draw();
  soundEmitters.draw();

  snd.checkCollisions();
  player.draw();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    soundEmitters.clicked(mouseX, mouseY, 1.0);
  }
  if (mouseButton == RIGHT) {
    soundEmitters.clicked(mouseX, mouseY, -1.0);
  }
}
void keyPressed() {
  if (key == '+') {
    pc.addParticle();
  }
  if (key == '-') {
    pc.destroyParticle();
  }
  if (key == 's') {
    int indx1, indx2;
    indx1 = pc.particleId;
    pc.addParticle();
    indx2 = pc.particleId;
    pc.addParticle();
    pc.addSpring(indx1, indx2);
  }
  if (key == 'd') {
    int indx1, indx2, indx3;
    indx1 = pc.particleId;
    pc.addParticle();
    indx2 = pc.particleId;
    pc.addParticle();
    indx3 = pc.particleId;
    pc.addParticle();
    pc.addSpring(indx1, indx2);
    pc.addSpring(indx2, indx3);
    pc.addSpring(indx3, indx1);
  }
  if (key == 'f') {
    int indx1, indx2, indx3, indx4;
    indx1 = pc.particleId;
    pc.addParticle();
    indx2 = pc.particleId;
    pc.addParticle();
    indx3 = pc.particleId;
    pc.addParticle();
    indx4 = pc.particleId;
    pc.addParticle();
    pc.addSpring(indx1, indx2);
    pc.addSpring(indx2, indx3);
    pc.addSpring(indx3, indx1);
    pc.addSpring(indx3, indx4);
    pc.addSpring(indx2, indx4);
  }
  if (keyCode == UP) {
    player.enableBoost();
  }
  if (keyCode == LEFT){
     player.turn(-0.1); 
  }
  if (keyCode == RIGHT){
     player.turn(0.1); 
  }
}

public class DisposeHandler {
  DisposeHandler(PApplet pa) {
    pa.registerMethod("dispose", this);
  } 

  public void dispose() {
    pc.destroyAll();
  }
}

