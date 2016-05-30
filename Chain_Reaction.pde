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
  }

  for (int i=0; i < balls.length; i++ ) {
    balls[i].draw(i);
    if (i < balls.length - 1)
       if (balls[i].isTouching(balls[i+1]))
          balls[i].state = 1;
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
