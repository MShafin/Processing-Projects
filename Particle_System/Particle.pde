class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;

  int size, time, colorX, colorY, LIFETIME;
  boolean alive;

//Single Particle Object Settings
  Particle(int x_, int y_) {
    acceleration = new PVector(0, 0.05);  //Acceleration
    velocity = new PVector(random(-1, 1), random(-1, 1));  //Random initial velocity
    location = new PVector(x_, y_);  //Location set to X and Y passed into class

    size = 39;
    LIFETIME = (int)random(400, 500);  //Random lifetime assigned
    alive = true;
    time = 0;
  }

  void display() {
    //map cursor to color range
    colorX = (int)map(location.x, 0, width, 0, 255);
    colorY = (int)map(location.y, 0, height, 0, 255);
    
    //set visual settings for particles
    fill(colorX, colorY, 150, 200);
    stroke(colorX, colorY, 150);
    strokeWeight(5);
    
    //matrix with particle at origin and manipulate that through matrix transformations
    pushMatrix();
    translate(location.x, location.y);
    
    //reduce size of matrix depending on frames passed
    scale(map(time, 0, LIFETIME, 1, 0));
    circle(0, 0, size);
    popMatrix();
    time++;
  }

  void move() {
    velocity.add(acceleration);
    location.add(velocity);
    //reset acceleration
    acceleration.mult(0);

    //bounce off bottom with opposity lower velocity
    if (location.y > height) {
      velocity.y *= -0.85;
      location.y = height;
    }
  }

  void applyGravity(PVector gravity){
    gravity.div(size/20);
    acceleration.add(gravity);
  }

  boolean isAlive() {
    if(time > LIFETIME){
      alive = false;
    }
    return alive;
  }
}
