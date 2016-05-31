//Team WoeBeGone -- Jannie Li, Henry Zhang, Leo Auyeung
//APCS2 pd09
//HW47 -- All That Bouncin'
//2016-05-31

class Ball {
  
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
      
  //other constants necessary?
  
  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;

  
  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );
    
    rad = 10;
    
    x = random( (width - r) + r/2 );
    y = random( (height - r) + r/2 );

    dx = random(10) - 5;
    dy = random(10) - 5;
    
    state = MOVING;
  }
  
  void move() {
    if (state == 0) {
      x = x + dx;
      y = y + dy;
      bounce();
    }
  }
  
  void bounce(){
    if (x <=0 || x>=600){
      dx=-dx;
    }
    if (y <=0 || y>= 600){
      dy=-dy;
    }
  }
  
  void draw(int i){
    ellipse(x, y, rad, rad);
    fill(c);
  }
  
  void process(){
    move();
    if (state==1){ //growing
      if (rad >= 70) //at this point, start shrinking
        state = 2;
      rad += .5;
    }
    if (state==2){ //shrinking
      if (rad <= 0) //at this point, dead
        state = 3;
      rad -= .5;
    }
    if (state==3) { //dead
      rad = 0;
    }
  }
 
 boolean isTouching( Ball other ) {
   boolean touching = ((rad + other.rad/2) > (sqrt( sq(x - other.x)+sq(y - other.y))));
   boolean otherInfected = (other.state == 1 || other.state == 2);
   return touching && otherInfected; 
  }


}//end class Ball