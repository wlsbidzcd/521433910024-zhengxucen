void setup(){
background(0);
size(1500,1000);
}

void draw(){
  stroke(255);
   line(pmouseX,pmouseY,mouseX,mouseY);
   rect(mouseX,600,200,200);
   }
