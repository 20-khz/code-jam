class Particle 
{
  int id;
  float x, y;
  float vx, vy;
  float ax, ay;
  float mass; 
  float r;
  float angle, dangle;
  boolean playing;
  
  ParticlePoint[] points;

  public Particle(int id) 
  {
    this.id = id;
    x = random(width);
    y = random(height);
    mass = 1.0;
    float r_angle = random(TAU);
    float r_speed = random(0.02, 0.3);
    vx = r_speed  * cos(r_angle);
    vy = r_speed * sin(r_angle);
    ax = ay = 0.0; 
    r = random(2, 5);
    
    angle = random(TAU);
    dangle = randomGaussian() / 5;
    
    playing = false;
    
    // Build the particle co-ordinates
    createParticle();
  }
   
  void add_force(float fx, float fy) {
    ax = ax + fx/mass;
    ay = ay + fy/mass;
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
    
    angle += dangle;
  }

  void move(float dt) {
    vx = (vx+dt*ax);
    vy = (vy+dt*ay);
    float v2 = vx*vx + vy*vy;
    float vmax2 = 0.3;
    float scale = sqrt(v2/vmax2);
    if (scale>1.0) {
      vx = vx / scale ;
      vy = vy / scale;
    }
    x = (width + x+dt*vx)%width;
    y = (height + y+dt*vy)%height;

    ax = ay = 0.0;
  }
}
