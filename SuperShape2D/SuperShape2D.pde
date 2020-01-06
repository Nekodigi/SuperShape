float n = 5;
float a = 200;
float b = 200;

float m = 3;
float n1 = 1;
float n2 = 1;
float n3 = 1;


void setup(){
  size(600, 600);
  
}

void draw(){
  background(0);
  noFill();
  stroke(255);
  m = (float)mouseX / 100;
  n = (float)mouseY / 100;
  n1 = n;
  n2 = n;
  n3 = n;
  translate(width/2, height/2);
  beginShape();
  for(float angle = 0; angle < TWO_PI; angle+=0.01){
    float t1 = 1.0/a*cos(m/4*angle);
    float t2 = 1.0/b*sin(m/4*angle);
    float r = 1/pow(pow(abs(t1), n2) + pow(abs(t2), n3), 1.0/n1);
    float x = r * cos(angle);
    float y = r * sin(angle);
    //float x = pow(abs(cos(angle)), na)*a*sgn(cos(angle));
    //float y = pow(abs(sin(angle)), na)*b*sgn(sin(angle));
    vertex(x, y);
  }
  endShape(CLOSE);
}