//Roll-Overs Step Three
//Shafin
//CS30
//
//A sketch that implements a roll-over effect on the microsoft logo, changes quadrant color with fade effect based off mouse location
//Additionally the user can click the bottom-right tile to make it act like a light switch or can press the top-left tile so that all the squares have color

/*Variables*/  
float ww; //window width
float wh; //window height

//Four variables for each quadrants brightness color values
float q1 = 255;
float q2 = 255;
float q3 = 255;
float q4 = 255;

boolean on = false; //Boolean to declare if top-left is on or off
boolean on2 = false; //Boolean to declare if bottom-right is on or off
boolean button = false; //Boolean to declare if user clicked the yellow tile
color q4Color = #ffb900; //variable for quadrant fours color

void setup() {
  //Easy to change width and heigth
  size(600, 600);
  ww = 600;
  wh = 600;
}

void draw() {
  background(255);

  if(mousePressed && (mouseButton == LEFT) && mouseX < ww/2 && mouseY < wh/2){  //if mouse is pressed in the first (red) quadrant set on to true
    on = true;
  }
  if(!(mouseX < ww/2 && mouseY < wh/2)){  //if mouse is not in the red quadrant set on to false
    on = false;
  }

  if(mousePressed && (mouseButton == LEFT) && mouseX > ww/2 && mouseY > wh/2){  //if mouse is pressed in the fourth (yellow) quadrant set on2 to true
    on2 = true;
  }
  if(!(mouseX > ww/2 && mouseY > wh/2)){  //if mouse is not in the yellow quadrant set on2 to false
    on2 = false;
    button = false;
  }

  if(on == false && on2 == false){
    //if mouse is on the quadrant reset transperency value
    if(mouseX < ww/2 && mouseY < wh/2){
      q1 = 255;
    }
    if(mouseX < ww/2 && mouseY > wh/2){
      q2 = 255;
    }
    if(mouseX > ww/2 && mouseY < wh/2){
      q3 = 255;
    }
    if(mouseX > ww/2 && mouseY > wh/2){
      q4 = 255;
    }

    //Increase Transperency when mouse is not ontop
    q1 = q1 - 7;
    q2 = q2 - 7;
    q3 = q3 - 7;
    q4 = q4 - 7;
  }  

  if(on == true){
    //set q1-4 = 0 to make all quadrants white
    q1 = 0;  q2 = 0;  q3 = 0;  q4 = 0;

    //draw all shapes without transperency ontop of the old ones //this is done to copy the gif and eliminate the fade
    fill(242, 80, 34); //Orange Red
    rect(0, 0, ww/2, wh/2);
        
    fill(0, 164, 239); //Green
    rect(0, wh/2, ww/2, wh/2);
      
    fill(127, 186, 0); //Blue
    rect(ww/2, 0, ww/2, wh/2);

    fill(255, 185, 0); //Yellow
    rect(ww/2, wh/2, ww/2, wh/2);
  }

  if(on2 == true){
    //set q1-4 = 0 to make all quadrants white
    q1 = 0;  q2 = 0;  q3 = 0;  q4 = 0;

    fill(q4Color);
    rect(ww/2, wh/2, ww/2, wh/2);

    if(button == true){
      q4Color = #ffffff;
    }else{
      q4Color = #ffb900;
    }
  }

  //Rectangles
  noStroke();
  fill(242, 80, 34, q1); //Orange Red
  rect(0, 0, ww/2, wh/2);
      
  fill(0, 164, 239, q2); //Green
  rect(0, wh/2, ww/2, wh/2);
    
  fill(127, 186, 0, q3); //Blue
  rect(ww/2, 0, ww/2, wh/2);

  fill(255, 185, 0, q4); //Yellow
  rect(ww/2, wh/2, ww/2, wh/2);
  
  //Lines
  stroke(0);
  line(ww/2, 0, ww/2, wh);   //Vertical
  line(0, wh/2, ww, wh/2);   //Horizontal
}

void mousePressed(){
  //if left mouse is pressed in the fourth (yellow) quadrant than set button to whatever its not
  if(mouseButton == LEFT && mouseX > ww/2 && mouseY > wh/2){
      button = !button;
  }
}
