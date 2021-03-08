//Multi-Coloured Grid
//Shafin
//CS30
//
//A sketch which displays random colors in a grid. The grid size can be changed with left and right mouse
//buttons. As well pressing any keyboard key will recolor the grid tiles.

/*Variables*/
//rectangle x y , width height
float x = 0;
float y = 0;
int w = 25;
int h = 25;

//color scheme array
color[] c = {
    //change these to whatever
    color(255, 159, 243), 
    color(254, 202, 87),
    color(255, 159, 67),
    color(255, 107, 107),
    color(238, 82, 83),
    color(72, 219, 251),
    color(10, 189, 227),
    color(29, 209, 161),
    color(16, 172, 132),
    color(0, 210, 211),
    color(1, 163, 164),
    color(84, 160, 255),
    color(46, 134, 222),
    color(46, 80, 144), //YInMn Blue
};

void setup(){
    size(800,800);
    noStroke();
    colorGrid();
}

void draw(){
    //its empty and the program doest run without it so....
}

void colorGrid(){
    background(255);
    //randomSeed(0); //return the same pseudo-random numbers each time the software is run.
    for(x = 0; x < (width/w); x++){
        for(y = 0; y < (height/h); y++){
            fill(c[(int)random(c.length)]); //convert float to int and choose random color from arr.length
            rect(x*w, y*h, w, h);
        }
    }
}

void mousePressed() {
  //decrease size of boxes with right button and ensure box xize does not decrease below 1
  if (mouseButton == LEFT && w >= 6 && h >= 6) {
    w -= 5;
    h -= 5;
    //ensure the boxes fit by finding a smaller size divisible by the width or height
    while (width%w != 0) {
      w--;
    }
    while (height%h != 0) {
      h--;
    }
    colorGrid();
  }

  //decrease size of boxes with right button and ensure box xize does not increase more than canvas size
  if (mouseButton == RIGHT && w <= width-5 && h <= height-5) {
    w +=5;
    h += 5;
    //ensure the boxes fit by finding a bigger size divisible by the width or height
    while (width%w != 0) {
      w++;
    }
    while (height%h != 0) {
      h++;
    }
    colorGrid();
  }
}

void keyPressed(){
    colorGrid();
}
