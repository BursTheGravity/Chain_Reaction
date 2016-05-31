//Team WoeBeGone -- Jannie Li, Henry Zhang, Leo Auyeung
//APCS2 pd09
//HW47 -- All That Bouncin'
//2016-05-31

Ball[] balls;

boolean reactionStarted;


void setup() {
  size(600, 600);
  reactionStarted = false;
  balls = new Ball[25];
  for (int i=0; i < balls.length; i++ )
    balls[i] = new Ball();
  balls[0].state = Ball.DEAD; 
}


void draw() {
  background(0);

  for (int i=0; i < balls.length; i++ ) {
    balls[i].move();
    for (int j=0; j < balls.length; j++ ) { //check if getting infected
      if (i != j && (balls[i].state == Ball.MOVING)) {
        if (balls[i].isTouching(balls[j]))
          balls[i].state = Ball.GROWING;
      }
    }
  }

  for (int i=0; i < balls.length; i++ ) {
    balls[i].draw(i);
    balls[i].process();
  }

}


void mouseClicked() {
  if ( !reactionStarted ) {
    balls[0].x = mouseX;
    balls[0].y = mouseY;
    balls[0].rad = 0.1;
    balls[0].state = Ball.GROWING;
    reactionStarted = true;
  }
}