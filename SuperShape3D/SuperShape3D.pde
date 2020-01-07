// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/akM4wMZIBWg

import peasy.*;

float scale = 200;
int res = 100;

float a = 1.0;
float b = 1.0;
float m = 7.0;
float n1 = 0.2;
float n2 = 1.7;
float n3 = 1.7;

float mchange = 0;
PeasyCam cam;
PVector[][] points = new PVector[res+1][res+1];
float offset = 0;

void setup(){
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  lights();
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(0);
  
  m = map(sin(mchange), 0, 1, 0, 7);
  n1=map(mouseX, 0, width, 0, 2);
  n2=map(mouseY, 0, height, 0, 2);
  n3=map(mouseY, 0, height, 0, 2);
  
  for(int i = 0; i <= res; i++){
    float phi = map(i, 0, res, -HALF_PI, HALF_PI);
    float r2 = superShape(phi, a, b, m, n1, n2, n3);
    for(int j = 0; j <= res; j++){
      float theta = map(j, 0, res, -PI, PI);
      float r1 = superShape(theta, a, b, m, n1, n2, n3);
      float x = r1*cos(theta)*r2*cos(phi);
      float y = r1*sin(theta)*r2*cos(phi);
      float z = r2*sin(phi);
      points[i][j] = new PVector(x, y, z).mult(scale);
    }
  }
  
  noStroke();
  beginShape(TRIANGLE_STRIP);
  for(int i = 0; i < res; i++){
    float col = map(i, 0, res, 0, 360*6)+offset;
    fill(col%360, 100, 100);
    for(int j = 0; j < res; j++){
      PVector p1 = points[i][j];
      PVector p2 = points[i+1][j];
      vertex(p1.x, p1.y, p1.z);
      vertex(p2.x, p2.y, p2.z);
    }
  }
  endShape(CLOSE);
  mchange += 0.01;
  offset += 5;
}
