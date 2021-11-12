 class buttonB{
   
   void into(){
   translate(mouseX, mouseY); 
   for (int i = 0; i < 10; i++) {
   strokeWeight(i); 
   point(0, i * -5);
   }
 }
   void display(){
fill(255, 50); 
ellipse(mouseX, mouseY, 50, 50);
 }
 
 }
