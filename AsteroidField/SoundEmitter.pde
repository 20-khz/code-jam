class SoundEmitter 
{
  float x, y;
  float r;

  SoundEmitter(float x, float y)
  {
    this.x = x;
    this.y = y;
    r = random(20, 200);
  }

  void draw() 
  {
    stroke(255);
    noFill();
    ellipse(x, y, r * 2, r * 2);
  }

  boolean intersects(float x, float y) {
    return dist(this.x, this.y, x, y) < r;
  }
}

