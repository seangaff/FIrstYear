class Ball{
    float x;
    float y;
    float dx;
    float dy;
    int radius;
    color ballColour = color(255);
    
    float ballAngle;
    float ballSpeed;
    float intersectAtY;
    float rand;

    Ball(){
      x = SCREENX/2;
      y = random(SCREENY/4, SCREENY/2);
      dx = random(1,2); 
      rand = random(-2,-1);
      if(abs(rand) > dx) {dx = rand;}
      dy = random(1, 2);
      radius = 7;
      ballAngle = MAX_ANGLE;
      ballSpeed = 1.1;
    }

    void move(){
        x += dx;
        y += dy;
    }

    void draw(){
        noStroke();
        fill(ballColour);
        ellipse(int(x), int(y), radius, radius);
    }

    void collide(Player tp){
        // Wall Collision
        if(y-radius<=0){
            dy=-dy;
        } else if(y+radius>=SCREENY){
            dy=-dy;
        }

        // Player Collision
        if(x+radius >= tp.xpos && x-radius<=tp.xpos+PADDLEWIDTH && y>=tp.ypos && y<=tp.ypos+PADDLEHEIGHT){
            intersectAtY = map(x-tp.xpos, -PADDLEHEIGHT/2, PADDLEHEIGHT/2,-1,1);
            ballAngle = MAX_ANGLE*intersectAtY;
            dx=-dx;
            dy=ballSpeed*sin(ballAngle);
            println(dy);
            dy=constrain(dy, -50, 50);
            println("Speed: ", ballSpeed, " Ball Angle: ", ballAngle, " dy: ", dy, " Intersetct: ", intersectAtY);
            ballSpeed++;
            dx = dx+1.1;
        }
    }
    
    int score(){
        if(x-radius>=SCREENX){
            return int(-1);
        } else if(x+radius<=0){
            return int(1);
        } else return int(0);
    }

    void gameReset(){
      x = SCREENX/2;
      y = random(SCREENY/4, SCREENY/2);
      dx = random(1,2); 
      rand = random(-2,-1);
      if(abs(rand) > dx) {dx = rand;}
      dy = random(1, 2);
      ballSpeed=1.1;;
      
    }
}
