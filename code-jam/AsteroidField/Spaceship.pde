class Spaceship {
  float x, y, vx, vy, ax, ay, orientation, radius, boost, mass;

  Spaceship() {
    x=width/2;
    y=height/2;
    vx = vy = ax = ay = 0.0;
    mass = 1.0;
    orientation = random(TAU);
    radius = 30.0;
    boost = 0.0;
  } 

  void draw() {
    beginShape();
    vertex(x+radius*cos(orientation), y+radius*sin(orientation));
    vertex(x+radius*cos(orientation+TAU/3.0), y+radius*sin(orientation+TAU/3.0));
    vertex(x+0.3*radius*cos(orientation+PI), y+0.3*radius*sin(orientation+PI));
    vertex(x+radius*cos(orientation+2*TAU/3.0), y+radius*sin(orientation+2*TAU/3.0));
    endShape(CLOSE);
  }
  
  void enableBoost(){
     boost = 0.0001;
   }
  void disableBoost(){
     boost = 0.0; 
  }
  
  void move(float dt){
     ax += boost * cos(orientation);
     ay += boost * sin(orientation);
     vx = vx + dt * ax;
     vy = vy + dt * ay;
     float v2 = vx*vx+vy*vy;
     float vmax = 0.7;
     if(v2 > vmax*vmax){
       float v = sqrt(v2);
      vx = vx/v* vmax;
      vy = vy/v*vmax;
     }
     x = (width+x+dt*vx)%width;
     y = (height+y+dt*vy)%height;
     ax = ay = 0.0; 
  }
    void add_emitter_force(SoundEmittorCollection sec) {
    if (sec.size()>0) {
      for (int qx=-5; qx<=5; qx+=1) {
        for (int qy=-5; qy<=5; qy+=1) {
          for (int j=0; j<sec.size(); j++) {
            SoundEmitter emi = sec.getEmitter(j);
            float force_constant = 0.05*emi.forceConstant;
            float ex, ey, er;
            ex = emi.x + width*qx;
            ey = emi.y + height*qy;
            //println(qx,qy, ":", ex, ey);
            er = emi.r;
              float fx, fy, frad, combined_radius, dist2, dist2scaled, dx, dy, dr;

              combined_radius = 1.2*(er + radius);
              dx = x - ex;
              dy = y - ey;

              dist2 = pow(dx, 2) + pow(dy, 2);
              //dist2scaled = dist2 / combined_radius / combined_radius;

              // frad = force_constant * (pow(dist2scaled,3) - pow(dist2scaled,6));
              frad = - force_constant / sqrt( dist2 + combined_radius * combined_radius);

              dr = sqrt(dist2);

              fx = dx/dr * frad;
              fy = dy/dr * frad;

              ax += fx / mass;
              ay += fy / mass;
          }
        }
      }
    }
  }

  void turn(float angle){
     orientation +=  angle;
  }
  
}
