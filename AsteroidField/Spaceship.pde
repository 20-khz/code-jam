class Spaceship {
  float x, y, vx, vy, ax, ay, orientation, radius, boost;

  Spaceship() {
    x=width/2;
    y=height/2;
    vx = vy = ax = ay = 0.0;
    orientation = random(TAU);
    radius = 30.0;
    boost = 0.0;
  } 

  void draw() {
    beginShape();
    vertex(x+radius*cos(orientation), y+radius*sin(orientation));
    vertex(x+radius*cos(orientation+TAU/3.0), y+radius*sin(orientation+TAU/3.0));
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
     float vmax = 0.3;
     if(v2 > vmax*vmax){
       float v = sqrt(v2);
      vx = vx/v* vmax;
      vy = vy/v*vmax;
     }
     x = (width+x+dt*vx)%width;
     y = (height+y+dt*vy)%height;
     ax = ay = 0.0; 
  }
  
  void turn(float angle){
     orientation +=  angle;
  }
  
}


