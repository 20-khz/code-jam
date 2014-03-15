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
  
  void destroyEmitter(int which) 
  {
    soundEmitters.remove(which);
  }
  
  SoundEmitter getEmitter(int which)
  {
     return soundEmitters.get(which); 
  }
  
  void draw() 
  {
    for (int i = 0; i < soundEmitters.size(); i++) {
      soundEmitters.get(i).draw();
    } 
  }  
  int size() {
    return soundEmitters.size();
  }
  void clicked(float x, float y) {
    for (int i=0; i < size(); i++) {
      if (getEmitter(i).intersects(x, y)) {
        destroyEmitter(i);
        return;
      }
    }
    addEmitter(x, y);
  }
}
  
