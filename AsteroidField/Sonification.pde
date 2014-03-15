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
        println(i, j);
        SoundEmitter se = s.getEmitter(j);
        if (dist(prt.x, prt.y, se.x, se.y) < se.r) {
          // test code
          fill(#FF0000);
          ellipse(se.x, se.y, 10, 10);
          noFill();

          /*
           OscMessage msg = new OscMessage("/starhit");
           msg.add(map(p[i].y, 0, height, 0, 1));
           osc.send(msg, supercollider);
           */
        }
      }
    }
  }
}

