class ParticleCollection {
  ArrayList<Particle> p;
  ArrayList<Spring> springs;
  
  Sonification snd;
  int particleId = 0;
  ParticleCollection() {
    p = new ArrayList<Particle>();
    springs = new ArrayList<Spring>();
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
      destroySpringsWithParticle(which);
      particleId--;
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
            float force_constant = 0.05*emi.forceConstant;
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

  void addSpring(int index1, int index2) {
      springs.add(new Spring(index1, index2, 0.0001, 120.0));
  }

  void applySpringForces(){
     for (int i=0; i<springs.size(); i++){
        Particle prtA, prtB;
        Spring spring;
        spring = springs.get(i);
        float dx, dy, dist2, frad, dr, fx, fy;
        
        prtA = p.get(spring.particle1);
        prtB = p.get(spring.particle2);
        
        dx = prtA.x - prtB.x;
        dy = prtA.y - prtB.y;

        dist2 = pow(dx, 2) + pow(dy, 2);
        dr = sqrt(dist2);
        frad = - spring.forceConstant * (dr-spring.equilibriumDistance);


        fx = dx/dr * frad;
        fy = dy/dr * frad;

        prtA.add_force(fx, fy);
        prtB.add_force(-fx, -fy);
     } 
  }
  void destroySpringsWithParticle(float which){
    IntList toDelete = new IntList();
     for (int i=0; i<springs.size(); i++){
        if (springs.get(i).particle1==which || springs.get(i).particle2==which){
            toDelete.append(i);
        }
     } 
     for (int j=toDelete.size()-1; j>=0; j--){
         springs.remove(toDelete.get(j));
     }
  }

  void move(float dt) {
    for (int i=0; i<p.size(); i++) {
      Particle prt = p.get(i);
      //float fx, fy;
      //fy = -0.000005 * (prt.y-height/2); 
      //prt.add_force(0, fy);
      prt.move(dt);
    }
  }
  void draw() {
    for (int i=0; i<p.size(); i++) {
      Particle prt = p.get(i);
      prt.draw();
    }
    
    for (int j=0; j<springs.size(); j++){
       Particle prtA, prtB;
       Spring spring = springs.get(j);
      prtA = p.get(spring.particle1);
      prtB = p.get(spring.particle2);
      line(prtA.x, prtA.y, prtB.x, prtB.y);
    }
  }
  int size() {
    return p.size();
  }
  Particle get(int which) {
    return p.get(which);
  }
}
