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
    x = x + dx;
    y = y + dy;
    bounce();
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
    if (state == 1 || state == 2)
      ellipse(x,y,i,i);
    else if (state == 0)
      ellipse(x, y, 20, 20);

    if (state != 3)
      fill(c);
    else
      fill(0,0,0);
  }
  
  void process(){
    if (state==0){
      move();
    }
    if (state==1){
      for (int i = 20; i <= 50; i++)
         draw(i);
       state = 2;
    }
    if (state==2){
      for (int i = 50; i > 0; i--)
        draw(i);
      state = 3;
    }
    if (state==3){
      draw(0);
    }
    //if (isTouching()
  }
 
 boolean isTouching( Ball other ) {
   return ( (rad + other.rad) > (sqrt( sq(x - other.x)+sq(y - other.y) )));
  }


}//end class Ball