/*jstephens  - 2018_05
 kidsPace 
 R&D with PShape, PGraphics, textures and feedback loops
 
 TODO:
 - [] Create a PGraphic layer
 - [] Create a PShape
 - [] Texture PShape with an image
 - [] Control PShape with perlin noise 
 - scale size
 - translate (xy location)
 - rotation
 - vertex location
 - HSB
 - verticies 
 -----------
 
 */


PGraphics pg_1;
PShape    ps_1;

void setup () {
  size(640, 480, P2D); 
  shapeMode(CENTER);
  imageMode(CENTER);
  pg_1 = createGraphics (width, height, P2D);
  ps_1 = createShape();
  
  pg_1.imageMode(CENTER);
  //ps_1.shapeMode(CENTER);
  ps_1.setFill(color(255));
  ps_1.beginShape();
  ps_1.vertex(10, 10);
  ps_1.vertex(10, 200);
  ps_1.vertex(110, 100);
  ps_1.endShape(CLOSE);
}

void draw() {
  background(0);
  ps_1.setFill(color(255));
  //pushMatrix();
  //translate (width/2, height/2);
  //translate (mouseX, mouseY);
  
  pg_1.beginDraw();
  pg_1.pushMatrix();
  //pg_1.translate (-width/2, -height/2);
  pg_1.translate(mouseX, mouseY);
  
  
  pg_1.shape(ps_1);
  pg_1.fill(127);

  pg_1.image(pg_1, 0, 0);
  pg_1.shape(ps_1);
  
  pg_1.popMatrix();
  pg_1.endDraw();
  
  pushMatrix();
  translate (width/2, height/2);
  image(pg_1, 0, 0);
  
  popMatrix();
}
