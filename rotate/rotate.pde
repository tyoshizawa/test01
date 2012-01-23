import processing.opengl.*;
 
// x, y, z それぞれの軸での回転角度
float rotX, rotY, rotZ;

public void init() {
  /*frame.dispose();*/
  /*frame.setUndecorated(true); // works.*/

  // call PApplet.init() to take care of business
  super.init();
}

void setup(){
  size(848,480,OPENGL);
  frame.setLocation(0,0);
  frame.setBackground(new java.awt.Color(0, 0, 0));
  frameRate(60);
  smooth();
  noStroke();
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(0,0,0);
  translate(width/2, height/2);
  //X軸を中心に回転
  rotateX(rotX);
  //Y軸を中心に回転
  rotateY(rotY);
  //Z軸を中心に回転
  rotateZ(rotZ);
  //四角形を描く
  for(int x=0; x<10; x++) {
    for(int y=0; y<10; y++) {
      if((x+y)%2==1){
        fill(0, x*5+25, y*5+25);
      } else {
        fill(180, y*5+25, x*5+25);
      }
      rect(-100+(x*25), -100+(y*25), 25, 25);
    }
  }
  //それぞれの軸の回転角度を更新
  rotX += 0.01;
  rotY += 0.0162;
  rotZ += 0.0262;
}
