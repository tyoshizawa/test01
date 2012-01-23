import processing.opengl.*;

void setup() {
  size(400, 400, OPENGL);
  noStroke();
  fill(255,255);
}

void draw() {
  fill(255,255);
  //環境光
  ambientLight(63, 31, 31); 
  //平行光
  directionalLight(255,255,255,-1,0,0); 
  /*//点光源*/
  pointLight(63, 127, 255, mouseX, mouseY, 200); 
  /*//スポットライト*/
  /*spotLight(100, 100, 100, mouseX, mouseY, 200, 0, 0, -1, PI, 2); */

  background(0);
  translate(width / 2, height / 2, -20);

  /*rotateX(mouseX / 200.0);*/
  /*rotateY(mouseY / 100.0);*/

  int dim = 18;
  for(int i = -height/2; i < height/2; i += dim*1.4) {
    for(int j = -width/2; j < width/2; j += dim*1.4) {
      pushMatrix();
      translate(i,j);
      rotateX(radians(30));
      rotateY(radians(30));
      box(dim,dim,dim);
      popMatrix();
    }
  }
  fill(0,255,0);
  rotateX(radians(30));
  rotateY(radians(30));
  box(dim,dim,dim);
}
