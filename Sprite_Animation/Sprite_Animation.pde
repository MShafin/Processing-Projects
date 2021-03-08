//Sprite Animation
//Shafin
//CS30
//
//A sprite animation which the user can control with arrow keys (left and right). Sprite faces 
//the direction pressed/moved.

PImage bg;
PImage idle; 
PImage[] marioR = new PImage[5];
PImage[] marioL = new PImage[5];
int numR = 0;
int numL = 0;
float xPos = 100;
float moveSpeed = 10;

void setup(){
    size(800,750);
    frameRate(20);
    bg = loadImage("bg.png");
    idle = loadImage("idle.png");
    for(int i = 0; i < marioR.length; i++){
        marioR[i] = loadImage(i+"R.png");
        marioL[i] = loadImage(i+"L.png");
    }
}

void draw(){
    image(bg, 0, 0);
    if(keyPressed == true && key == 'd'){
        //play animation for right
        image(bg, 0, 0);
        marioR();
    }else{
        //return to idle pose
        image(bg, 0, 0);
        image(idle, xPos, 474,100,180);
    }
    if(keyPressed == true && key == 'a'){
        //play animation for left
        image(bg, 0, 0);
        marioL();
    }
}

void marioR(){
    //animation for mario moving right
    image(marioR[numR],xPos,482);
    numR = numR + 1;
    xPos = xPos + moveSpeed;
    if(numR == 5){
        //reset animation counter
        numR = 0;
    }
}

void marioL(){
    //animation for mario moving left
    image(marioL[numL],xPos,482);
    numL = numL + 1;
    xPos = xPos - moveSpeed;
    if(numL == 5){
        //reset animation counter
        numL = 0;
    }
}