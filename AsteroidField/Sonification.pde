import oscP5.*;
import netP5.*;

class Sonification {
  OscP5 osc;
  NetAddress supercollider;

  ParticleCollection pc;
  SoundEmittorCollection s;

  Sonification(ParticleCollection pc, SoundEmittorCollection s) {
    this.pc = pc;
    this.s = s;
    osc = new OscP5(this, 12000);
    supercollider = new NetAddress("127.0.0.1", 57120);
  }
  void checkCollisions() {
    for (int i=0; i<pc.size(); i++) {
      Particle prt = pc.get(i);
      for (int j=0; j<s.size(); j++) {
        SoundEmitter se = s.getEmitter(j);
        float d = dist(prt.x, prt.y, se.x, se.y);
        if (d < se.r) {         
          OscMessage msg = new OscMessage("/playParticle");
          msg.add(prt.id);
          msg.add(0); // angle
          msg.add(map(d, 0, se.r, 0, 1)); // dist
          msg.add(0); // velo
          msg.add(j);
          osc.send(msg, supercollider);
        }
      }
    }
  }
  void addParticle(int particleId) {
    OscMessage msg = new OscMessage("/addParticle");
    msg.add(particleId);
    osc.send(msg, supercollider);
  }
  void destroyParticle(int particleId) {
    OscMessage msg = new OscMessage("/destroyParticle");
    msg.add(particleId);
    osc.send(msg, supercollider);
  }
  void quiet() {
    OscMessage msg = new OscMessage("/quiet");
    osc.send(msg, supercollider);
  }
}

