class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
 
  float lifespan;
  Particle(PVector l) {
    // The acceleration
    acceleration = new PVector(0, 0.05);
    // circel's x and y ==> range
    velocity = new PVector(random(-1, 1), random(-2, 0));
    // apawn's position
    location = l.copy();
    // the circle life time
    lifespan = 255.0;
  }
  void run() {
    update();
    display();
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan-=1.0;
  }
 
  boolean isDead() {
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
  void display() {
    // border
    stroke(0, lifespan);
    // border's weight
    strokeWeight(1);
    float r = random(0,255);
    float g = random(0,255);
    float b = random(0,255);
    // random the circle's color
    fill(r,g,b, lifespan);
    // draw circle
    ellipse(location.x, location.y, 3, 3);
  }
}
