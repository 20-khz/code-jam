class SoundEmitter 
{
  float x, y;
  float r;
  
  SoundEmitter(float x, float y)
  {
    this.x = x;
    this.y = y;
    r = 25;
  }
  
  void draw() 
  {
    stroke(255);
    noFill();
    ellipse(x, y, r * 2, r * 2);
  }
  
  boolean intersects(float x, float y) {
    return ( (this.x - r < x && x < this.x + r) &&
        (this.y - r < x && y < this.x + r));
  }
}
