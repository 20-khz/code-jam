class Particle 
{
  int id;
  float x, y;
  float vx, vy;
  float ax, ay;
  float vmax;
  float mass; 
  float r;
  float angle, angleInc;
  boolean playing;

  ParticlePoint[] points;

  public Particle(int id) 
  {
    this.id = id;
    setRandomPos();
    mass = 1.0;
    float r_angle = random(TAU);
    float r_speed = random(0.02, 0.3);
    vx = r_speed  * cos(r_angle);
    vy = r_speed * sin(r_angle);
    ax = ay = 0.0; 
    r = random(2, 5);
    vmax = random(0.05, 0.3);

    angle = random(TAU);
    angleInc = randomGaussian() / 5;

    playing = false;

    // Build the particle co-ordinates
    createParticle();
  }

  void add_force(float fx, float fy) {
    ax = ax + fx/mass;
    ay = ay + fy/mass;
  }

  void setRandomPos() {
    int where = int(random(4));
    switch(where) {
    case 0:
      x = 0;
      y = random(height);
      break;
    case 1:
      x = width;
      y = random(height);
      break;
    case 2:
      x = random(width);
      y = 0;
      break;
    case 3:
      x = random(width);
      y = height;
      break;
    }
  }  


  void createParticle() {
   points = new ParticlePoint[int(random(3, 7))];
  
   int angle = 0;
   int angleIncrement = 360/points.length;
     
   for(int i = 0; i < points.length; i++) {
     
     float x = sin(radians(angle)) * (r * random(5));
     float y = cos(radians(angle)) * (r * random(5));
     angle += angleIncrement;
     points[i] = new ParticlePoint(x, y);
   }
  }

  void draw() {
    stroke(255);
    noFill();

    pushMatrix();
    translate(x, y);
    rotate(angle);
    beginShape();
    for(int i = 0; i < points.length; i++) {
      vertex(points[i].x, points[i].y);
    }
    endShape(CLOSE);
    popMatrix();   
    //ellipse(x, y, r, r);
    
  }
  void move(float dt) {
    vx = (vx+dt*ax);
    vy = (vy+dt*ay);
    float v2 = vx*vx + vy*vy;
    float scale = sqrt(v2/vmax);
    if (scale>1.0) {
      vx = vx / scale ;
      vy = vy / scale;
    }
    x = (width + x+dt*vx)%width;
    y = (height + y+dt*vy)%height;

    ax = ay = 0.0;

    angle += angleInc;
  }
}

