class Spring {
  int particle1, particle2;
  float forceConstant, equilibriumDistance;
  Spring(int indx1, int indx2, float fc, float len) {
    particle1 = indx1;
    particle2 = indx2;
    forceConstant = fc;
    equilibriumDistance = len;
  }  
}

