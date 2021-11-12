void setup(){
size(1080, 600); 
background(0);
colorMode(RGB,400);
}

String txt = "Where r u";
float ww = 0; 

void draw(){
for (int i = 0; i < txt.length(); i++) {
char c = txt.charAt(i); 
textSize(floor(random(100,200)));
fill(random(255),random(255),random(255));
int cl = int(c); 
fill(cl);
text(c, ww, 150);
ww += textWidth(c);
}
}
