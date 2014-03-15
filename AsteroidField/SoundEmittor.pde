class SoundEmittor 
{
  float x, y;
  float r;
  
  SoundEmittor()
  {
    x = random(width);
    y = random(width);
    r = 10;
  }
  
  void draw() {
    stroke(255);
    noFill();
    ellipse(x, y, r, r);
  }
}
