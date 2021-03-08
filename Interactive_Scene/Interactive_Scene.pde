//Interactive Scene
//Shafin
//CS30
//
//Draw a scene with multiple shapes and a character, use the mouse and keyboard to impact the drawing. Have right click change the background.
//Use the mouse to move the clouds, use a to throw a party inside the house and z to end the party. Right click to change the time of day.

/*Variables*/
PFont f;
int currentBack = 0;
color morning = #dce5f6;
color afternoon = #aec5c9;
color evening = #698A98;
color night = #234c5b;
float circleY = 0;

/*Function which runs code at the start*/
void setup(){
 size(1280,720);
 f = createFont("Arial",16,true);
 noStroke(); 
}

/*Function which displays the scenes created*/
void draw(){
  //changes background based of currentBack value
  if(currentBack == 0){
    background(morning);
  }else if(currentBack == 1){
    background(afternoon);
  }else if(currentBack == 2){
    background(evening);
  }else if(currentBack == 3){
    background(night);
  }
  
  //snow movement and reset script
  circleY = circleY + 1;
  if(circleY >= 550){
    circleY = 0;
  }

  //scene
  sun();
  snow();
  clouds();
  mountains();
  hills();
  path();
  house();
  penguin();
  snowman();
  
  //Name
  textFont(f,18);
  fill(#e2eff3); 
  text("Shafin",1220,710);
}

/*Functions for all the parts of the scene*/
void sun(){
  fill(#fffac1);
  circle(225, 125, 130);
  fill(#fffac1, 180);
  circle(225, 125, 140);
  fill(#fffac1, 150);
  circle(225, 125, 150); 
}

void clouds(){
  fill(#f2f6f7);
  ellipse(mouseX-50, 195, 75, 60); //lower cloud
  ellipse(mouseX, 195, 75, 60);
  ellipse(mouseX-25, 175, 75, 60);
  
  ellipse(mouseX+175, 150, 75, 60); //upper cloud
  ellipse(mouseX+125, 150, 75, 60);
  ellipse(mouseX+150, 130, 70, 60);  
}

void mountains(){
  fill(#668eab); //bg mountains
  triangle(-300,800,100,200,700,600);
  triangle(0,800,400,150,1000,800);
  triangle(200,800,700,150,1400,800);
  triangle(400,800,1100,100,1650,800); 
  
  fill(#80a0b9);
  triangle(-400,650,175,300,600,500); //front mountains
  triangle(50,850,550,250,950,550);
  triangle(250,775,950,175,1450,525);
}

void hills(){
  fill(#AFCED6); //The last hill in the back
  ellipse(1100,550,1250,300);
  
  fill(#BED8DF); //The second hill
  ellipse(250,600,1250,300);
  
  fill(#CEE4EA); //The closest hill
  ellipse(1200,825,2500,550);
}

void path(){
 noFill(); //The pathway leading up to the house
  stroke(#e2eff3);
  strokeWeight(30);
  bezier(882,590,1000,800,500,570,250,800);
  bezier(882,590,1000,800,470,570,170,800); 
}

void house(){
  noStroke();
  fill(#897d5d); //The small Roof
  quad(835,562,855,562,940,535,840,535);
  
  fill(#b6a988); //The large wall of the house
  rect(850,560,100,50);
  
  fill(#a4956c); //The smaller wall of the house
  quad(840,600,850,610,850,560,840,550);
  
  fill(#897d5d); //The large Roof
  quad(855,567,960,567,940,535,840,535);
  
  fill(#717171); //The door
  rect(880,580,15,30);
  
  if(key == 'a'){
    fill(random(1,255),random(1,255),random(1,255),200);
  }else if(key == 'z'){
    fill(#e3faf7,200); //The window
  }
  square(910,580,20);
  
  
  fill(#2c2c2c,80); //The shadow
  quad(900,650,1000,650,950,610,850,610);
  quad(975,660,995,660,982,650,960,650);
  
  fill(#e6e6e6,100); //The smoke
  ellipse(926,510,13,60);
  
  fill(#736446); //The chimney
  rect(920,525,12,20);  
}

void penguin(){
 fill(0);
  circle(880, 600, 20); //body
  fill(255);
  stroke(255, 210, 0);
  strokeWeight(.5);
  ellipse(880, 600, 16, 25); //body yellow
  fill(0);
  noStroke();
  circle(880, 586, 11); //head
  fill(255);
  circle(877, 585, 2); //eyes
  circle(883, 585, 2); //eyes
  fill(250,50,100);
  noStroke();
  ellipse(880, 586, 6, 3); //nose 
}

void snowman(){
  fill(#e6edf0);
  circle(935,608,25); //circles biggest to smallest
  circle(935,590,18);
  circle(935,578,10);
  strokeWeight(1);
  fill(255, 140, 0);
  triangle(935, 578, 936, 580, 940, 578); //nose
}

void snow(){
  //circleY acts as a the movement variable, Y value for the snow circles
  fill(255, 150);
  circle(10, circleY, 10);
  circle(70, circleY+20, 7);
  circle(150, circleY, 5);
  circle(170, circleY+100, 5);
  circle(200, circleY+150, 10);
  circle(240, circleY-200, 10);
  circle(250, circleY-150, 7);
  circle(300, circleY-50, 5);
  circle(330, circleY, 10);
  circle(380, circleY+20, 5);
  circle(440, circleY, 10);
  circle(550, circleY+100, 10);
  circle(600, circleY-250, 10);
  circle(660, circleY-50, 5);
  circle(720, circleY, 10);
  circle(740, circleY+20, 5);
  circle(800, circleY, 10);
  circle(860, circleY+5, 7);
  circle(920, circleY+100, 10);
  circle(940, circleY-250, 10);
  circle(1000, circleY-200, 7);
  circle(1150, circleY-150, 10);
  circle(1210, circleY-50, 5);
  circle(123, circleY+15, 10);
  circle(456, circleY+20, 7);
  circle(789, circleY+25, 10);
  circle(1011, circleY+123, 10);
}

/*Runs function when mouse is pressed*/
void mousePressed(){
  if(mouseButton == RIGHT){
    //Changes the state of currentBack when mouse is pressed
    if(currentBack == 0){
      currentBack = 1;
    }else if(currentBack == 1){
      currentBack = 2;
    }else if(currentBack == 2){
      currentBack = 3;
    }else if(currentBack == 3){
      currentBack = 0;
    }
  }
}
