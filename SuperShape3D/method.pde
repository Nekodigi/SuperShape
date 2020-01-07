// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/akM4wMZIBWg

float superShape(float theta, float a, float b, float m, float n1, float n2, float n3){
  float t1 = pow(abs(1/a*cos(m*theta/4)), n2);
  float t2 = pow(abs(1/b*sin(m*theta/4)), n3);
  float r = pow(t1 + t2, -1/n1);
  
  return r;
}
