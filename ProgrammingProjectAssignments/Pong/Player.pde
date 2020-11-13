class Player {   
    float xpos;
    float ypos;
    int score;
    color paddlecolor = color(255);
    boolean player;

    float dy;
    Player(int screen_x){
        xpos=screen_x;
        ypos=SCREENY/2;
        dy = .7;
    }
    void move(float y){
        if(y>SCREENY-PADDLEHEIGHT) ypos = SCREENY-PADDLEHEIGHT;
        else ypos=y;
    }
    void computerMove(){
      if(gameBall.x < SCREENX && gameBall.x >0){
        if(gameBall.y > (ypos + PADDLEHEIGHT/2)) ypos+=dy;
        else if(gameBall.y < ypos+PADDLEHEIGHT/2) ypos-=dy;
      }
      if((xpos + PADDLEWIDTH) >= SCREENX) xpos = (SCREENX-PADDLEWIDTH);
    }
    void draw(){
        fill(paddlecolor);
        rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
    }
    void score(){
        score++;
        dy += .5;
    }
    void reset(){
      score=0;
    }
}
