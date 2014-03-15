class SoundEmittorCollection 
{
  ArrayList<SoundEmitter> soundEmitters;
  
  SoundEmittorCollection() 
  {
    soundEmitters = new ArrayList<SoundEmitter>();
  }
  
  void addEmitter(float x, float y) 
  {
    soundEmitters.add(new SoundEmitter(x, y));
  }
  
  void destroyParticle(int which) 
  {
    soundEmitters.remove(which);
  }
  
  void draw() 
  {
    for (int i = 0; i < soundEmitters.size(); i++) {
      soundEmitters.get(i).draw();
    } 
  }
}
  
