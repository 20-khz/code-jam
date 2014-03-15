import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress supercollider;

ParticleCollection pc;

void setup() {
  size(500, 400);
  background(0);

  osc = new OscP5(this, 12000);
  supercollider = new NetAddress("127.0.0.1", 57120);
  
  pc = new ParticleCollection();
  pc.addParticle();
  pc.addParticle();
  pc.addParticle();
  pc.addParticle();
}

void draw() {
  background(0);

  pc.draw();

  /*
  OscMessage msg = new OscMessage("/starhit");
  msg.add(map(p[i].y, 0, height, 0, 1));
  osc.send(msg, supercollider);
  */  
}

