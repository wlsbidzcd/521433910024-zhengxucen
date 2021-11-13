float theta;   

void setup() {
  size(640, 360);
}

void draw() {
  background(0);
  frameRate(30);
  stroke(255);
  float a = (mouseX / (float) width) ;
  theta = a;
  translate(width/2,height);
  translate(0,-120);
  branch(120);

}

void branch(float h) {
  h *= 0.66;
  
  if (h > 2) {
      
    rotate(theta);   
    ellipse(0, 0, -h, -h);  
    translate(0, -h);  
    branch(h);       
    
    
  }
}
