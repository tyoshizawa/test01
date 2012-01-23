/**
 * Rotate 2. 
 * 
 * The push() and pop() functions allow for more control over transformations.
 * The push function saves the current coordinate system to the stack 
 * and pop() restores the prior coordinate system. 
 */
 
float a;                          // Angle of rotation
float offset = PI/24.0;             // Angle offset between boxes
int num = 12;                     // Number of boxes
color[] colors = new color[num];  // Colors of each box
color safecolor;

boolean pink = true;

void setup() 
{ 
  colorMode(HSB, 360, 100, 100, 100);
  size(640, 360, P3D);
  noStroke();  
  for(int i=0; i<num; i++) {
    colors[i] = color(360 * (i+1)/num, 50, 30);
  }
} 
 

void draw() 
{     
  background(0, 0, 0);
  translate(width/2, height/2);
  a += 0.01;   
  
  for(int i = 0; i < num; i++) {
    pushMatrix();
    fill(colors[i]);
    rotateY(a + offset*i);
    rotateX(a/2 + offset*i);
    box(200);
    vertex();
    popMatrix();
  }
}
/*import processing.opengl.*;*/
/**/
/*float rotX=0, rotY=0, rotZ=0;*/
/*int hue=0;*/
/**/
/*void setup() {*/
/*  size(400, 400, OPENGL);*/
/*  frameRate(60);*/
/*  noStroke();*/
/*  smooth();*/
/*  rectMode(CENTER);*/
/*  background(0, 0, 0);*/
/*  fill(hue, 50, 50);*/
/*}*/
/**/
/*void draw() {*/
/*  ambientLight(0, 0, 50);*/
/*  directionalLight(0, 0, 50, 1, 1, -1);*/
/*  pointLight(0,0,50,-30,-30,200);*/
/*  translate(width/2, height/2);*/
/*  rotateX(rotX);*/
/*  rotateY(rotY);*/
/*  rotateZ(rotZ);*/
/*  rect(0, 0, 200, 200);*/
/*  rotX += 0.001;*/
/*  rotY += 0.002;*/
/*  rotZ += 0.003;*/
/*}*/
