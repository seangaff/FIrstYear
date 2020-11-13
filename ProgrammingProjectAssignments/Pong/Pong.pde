Player player;
Player computer;
Ball  gameBall;

boolean cont;

void settings(){
    size(SCREENX, SCREENY);
}

void setup(){
    player = new Player(0+MARGIN);
    computer = new Player(SCREENX - MARGIN - PADDLEWIDTH);
    gameBall = new Ball();
    ellipseMode(RADIUS);
    cont = true;
    player.score = 0;
    computer.score = 0;
    PFont myFont = loadFont("Serif-18.vlw");
    textFont(myFont);

}

void draw() {
    if(cont){
        background(0);
        rect(SCREENX/2,0,2,SCREENY);
        player.move(mouseY);
        computer.computerMove();
        
        //player.draw();
        //computer.draw();
        gameBall.move();
        if(gameBall.x<SCREENY/2){
            gameBall.collide(player);
        } else gameBall.collide(computer);
        int scored = gameBall.score();
        if(scored!=0){
          reset(scored);
        }
        player.draw();
        computer.draw();
        gameBall.draw();
        text(player.score,SCREENX/2-30,20);
        text(computer.score,SCREENX/2+20,20);
    } else {
        reset(0);
    }
    
}

void reset(int scorer){
    cont = false;
    gameBall.gameReset();
    // Scoring logic
    if(scorer == -1){
        player.score();
        if(player.score >= 3) {
          println("YOU WIN!");
          text("YOU WIN!",SCREENX/4,SCREENY/2);
          frameRate(0);
        }
        computer.dy*=SPEED_MUL;
    } else if(scorer == 1){
        computer.score();
        if(computer.score >= 3) {
          println("GAME OVER");
          text("GAME OVER",SCREENX/24,SCREENY/2);
          frameRate(0);
        }
        player.dy*=SPEED_MUL;
    }
    //println("playerdy: ",player.dy, "compdy", computer.dy);
}

void mousePressed(){
    cont = true;
}
