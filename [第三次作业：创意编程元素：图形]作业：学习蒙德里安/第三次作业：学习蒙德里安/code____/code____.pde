float linex=0;
 float linex2=0;
 float liney=0;
 float linexWidth=random(25,30);
 float linex2Width=random(3,15);
 float lineyWidth=random(5,20);



 void setup() {
   size(600, 800);
   background(255);
 }




 void draw() {
   background(255);


 linex=0;
   while (linex<width) {
     if (mouseX<1) {
       linex=linex+30;
     } else {
       linex=linex+mouseX;
     }
     stroke(0);
     fill(0);
     rect(linex, 0, linexWidth, height);
   }



   linex2=0;
   while (linex2<width) {
     if (mouseX<1) {
       linex2=linex2+10;
     } else {
       linex2=linex2+mouseX*1.5;
     }
     stroke(0);
     fill(0);
     rect(linex2, 0, linex2Width, height);
   }



   liney=0;
   while (liney<height) {
     if (mouseY<1) {
       liney=liney+20;
     } else {
       liney=liney+mouseY*1.2;
     }
     stroke(0);
     fill(0);
     rect(0, liney, width, lineyWidth);
   }


   liney=0;
   while (liney<height) {
     if (mouseY<1) {
       liney=liney+20;
     } else {
       liney=liney+mouseY*2;
     }
     stroke(100);
     fill(100);
     rect(0, liney+lineyWidth, mouseX*3+10-linex2Width*2, mouseY*3+20-lineyWidth*5);
   }



 }
