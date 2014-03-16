class ParticleCollection {
  ArrayList<Particle> p;
  Sonification snd;
  int particleId = 0;
  ParticleCollection() {
    p = new ArrayList<Particle>();
  }
  void setSnd(Sonification snd) {
    this.snd = snd;
  }
  void addParticle() {
    p.add(new Particle(particleId));
    snd.addParticle(particleId);
    particleId++;
  }
  void destroyParticle() {
    int which = p.size() - 1;
    if(which >= 0) {
      snd.destroyParticle(p.get(which).id);
      p.remove(which);
    }
  }
  void destroyAll() {
    while(p.size() > 0) {
      destroyParticle();
    }
  }

  void add_emitter_force(SoundEmittorCollection sec) {
    if (sec.size()>0) {
      for (int qx=-5; qx<=5; qx+=1) {
        for (int qy=-5; qy<=5; qy+=1) {
          for (int j=0; j<sec.size(); j++) {
            SoundEmitter emi = sec.getEmitter(j);
            float force_constant = 0.05;
            float ex, ey, er;
            ex = emi.x + width*qx;
            ey = emi.y + height*qy;
            //println(qx,qy, ":", ex, ey);
            er = emi.r;
            for (int i=0; i<p.size(); i++) {
              Particle prt = p.get(i);
              float fx, fy, frad, combined_radius, dist2, dist2scaled, dx, dy, dr;

              combined_radius = 1.2*(er + prt.r);
              dx = prt.x - ex;
              dy = prt.y - ey;

              dist2 = pow(dx, 2) + pow(dy, 2);
              //dist2scaled = dist2 / combined_radius / combined_radius;

              // frad = force_constant * (pow(dist2scaled,3) - pow(dist2scaled,6));
              frad = - force_constant / sqrt( dist2 + combined_radius * combined_radius);

              dr = sqrt(dist2);

              fx = dx/dr * frad;
              fy = dy/dr * frad;

              prt.add_force(fx, fy);
            }
          }
        }
      }
    }
  }

  void move(float dt) {
    for (int i=0; i<p.size(); i++) {
      Particle prt = p.get(i);
      float fx, fy;
      fy = -0.000005 * (prt.y-height/2); 
      //prt.add_force(0, fy);
      prt.move(dt);
    }
  }
  void draw() {
    for (int i=0; i<p.size(); i++) {
      Particle prt = p.get(i);
      prt.draw();
    }
  }
  int size() {
    return p.size();
  }
  Particle get(int which) {
    return p.get(which);
  }
}

