
PShape prototile;
int scale = 25;
PVector vec = new PVector(0,0);
float x, y;
float pangle = -PI/6, rangle = 0;

void setup() {
  background(255);
  size(750, 750);
  //fill(0, 100);
  strokeWeight(2);
  stroke(0);
  
  prototile = createShape();
  
  prototile.beginShape();
  prototile.vertex(scale *  0,   scale * sqrt(3)/1.5);
  prototile.vertex(scale *  1, - scale * sqrt(3)/3.0);
  for (float i=1; i>-1; i-=0.1) {
    prototile.vertex(scale * i, scale * ((1.0/6.0)*sin(PI*i) - 1/sqrt(3)));
  }
  prototile.vertex(scale * -1, - scale * sqrt(3)/3.0);
  prototile.vertex(scale *  0,   scale * sqrt(3)/1.5);
  prototile.endShape();
  

  background(125);
  translate(width/2, height/2);
    
  vec.add(PVector.fromAngle(-PI/6).setMag(scale * sqrt(3)/3));
  x = vec.x;  y = vec.y;
  draw_tile((0.0/3.0)*PI);
  
  tile( PI/3,  PI);
  tile(-PI/3, -PI/3);
  tile(-PI/3, -PI/3);
  tile(-PI/3, -PI/3);
  
  for (int layer=2; layer<20; layer++) {
    for (int m=0; m<layer; m++) {
      tile(-PI/3,  PI);
      tile( PI/3,  PI);
    }
    tile(-PI/3, -PI/3);
    for (int n=0; n<layer-1; n++) {
      tile(-PI/3,  PI);
      tile( PI/3,  PI);
    }
    tile(-PI/3, -PI/3);
    for (int n=0; n<layer-1; n++) {
      tile(-PI/3,  PI);
      tile( PI/3,  PI);
    }
    tile(-PI/3, -PI/3);
  } 
  
  saveFrame("output.png");
}

void draw_tile (float rot) {
  pushMatrix();
  translate(x, y);
  rotate(rot);
  shape(prototile, 0, 0);
  popMatrix();
  pushMatrix();
  translate(-x, -y);
  rotate(rot - PI);
  shape(prototile, 0, 0);  
  popMatrix();
}

void tile (float progression, float rotation) {
  pangle = pangle + progression;
  rangle = rangle + rotation;
  vec.add(PVector.fromAngle(pangle).setMag(scale * sqrt(3)/1.5));
  x = vec.x;  y = vec.y;
  draw_tile(rangle);
}
