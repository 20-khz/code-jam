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
      fill(#B39C7D, 50); 
    }
    else {
      fill(#CFE5D1); 
    }
    ellipse(x, y, r * 2, r * 2);
    noFill();
  }

  boolean intersects(float x, float y) {
    return dist(this.x, this.y, x, y) < r;
  }
}
