class SoundEmitter 
{
  float x, y;
  float r;
  
  SoundEmitter(float x, float y)
  {
    this.x = x;
    this.y = y;
    r = 30;
  }
  
  void draw() 
  {
    stroke(255);
    noFill();
    ellipse(x, y, r, r);
  }
}
