class ParticleCollection {
  ArrayList<Particle> p;
  ParticleCollection() {
    p = new ArrayList<Particle>();
  }
  void addParticle() {
    p.add(new Particle());
  }
  void destroyParticle(int which) {
    p.remove(which);
  }
  void draw(float dt) {
    for (int i=0; i<p.size(); i++) {
      Particle prt = p.get(i);
      float fx, fy;
      fy = -0.00005 * (prt.y-height/2); 
      prt.add_force(0, fy);
      prt.move(dt);
      prt.draw();
    } 
  }
}
  
