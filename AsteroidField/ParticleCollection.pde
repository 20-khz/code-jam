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
      p.get(i).move(dt);
      p.get(i).draw();
    } 
  }
}
  
