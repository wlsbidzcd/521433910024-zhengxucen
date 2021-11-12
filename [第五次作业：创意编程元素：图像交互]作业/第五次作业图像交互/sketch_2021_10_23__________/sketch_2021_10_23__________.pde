buttonA a;
buttonB b;
boolean A=false;
boolean B=false;

void setup() {
  size(800, 800);
  background(255);
  fill(255,0,0);
  rect(25, 25, 50, 50);
  rect(100, 25, 50, 50);
  a=new buttonA();
  b=new buttonB();
}


void draw() {
  if (mousePressed==true){
    
    if(mouseX<75){
    fill(0);// Black
    rect(25, 25, 50, 50);
    A =true;
    B =false;  
    a.display();
    //a.into();
    

    }
   else if(mouseX<125){
    //fill(126); // Gray
    //rect(100, 25, 50, 50);
    //B=true;
    b.display();
    if(mouseY<75){ 
      B=true;
      A=false;
    fill(126); // Gray
    rect(100, 25, 50, 50);}
  }
 
  } 
  //if(mousePressed==false){
    //fill(255,0,0);
  //rect(25, 25, 50, 50);
  //rect(100, 25, 50, 50);}
  
  //if(.color==)
  if(A==true){
  a.into();
  }
   if(B==true){
  b.into();
  }
}
