class SoundEmitter 
{
  float x, y;
  float r;
  float forceConstant;
  SoundEmitter(float x, float y, float fc)
  {
    this.x = x;
    this.y = y;
    r = random(20, 100);
    forceConstant = fc;
  }

  void draw() 
  {
    stroke(255);
    if (forceConstant > 0){    
    noFill();
    }
    else {
      fill(128); 
    }
    ellipse(x, y, r * 2, r * 2);
    noFill();
  }

  boolean intersects(float x, float y) {
    return dist(this.x, this.y, x, y) < r;
  }
}
