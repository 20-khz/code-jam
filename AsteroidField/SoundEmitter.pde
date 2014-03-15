class SoundEmitter 
{
  float x, y;
  float r;
  
  SoundEmitter()
  {
    x = random(width);
    y = random(height);
    r = 30;
  }
  
  void draw() 
  {
    stroke(255);
    noFill();
    ellipse(x, y, r, r);
  }
}
