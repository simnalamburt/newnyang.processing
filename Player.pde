class Player {
  
  final float offset = 25.0;
  final float size = 5;
  final float block = 80; 
  final float mazeWidth = size*block;
  float xpos = offset + block/4;
  float ypos = offset + block/4;
  final float speed = 2;
  final int player = 25;

  int r = 220;
  int g = 220;
  int b = 220;
  
  color col = color(r,g,b);
  color white = color(255);
 
  color x1;
  color x2;
  color y1;
  color y2;

  void display() {
    fill(col);
    noStroke();
    ellipse(xpos, ypos, player, player);
    
  }
  
  void wall(){

    x1 = get(int(xpos-player/2-0), int(ypos));
    x2 = get(int(xpos+player/2+0), int(ypos));
    y1 = get(int(xpos),            int(ypos-player/2-0));
    y2 = get(int(xpos),            int(ypos+player/2+0));
    

    if(x1 == white) xpos += speed;
    if(x2 == white) xpos -= speed;
    if(y1 == white) ypos += speed;
    if(y2 == white) ypos -= speed;
  }
  
  void movement(){
    if(right) xpos += speed;
    if(left) xpos -= speed;
    if(up) ypos -= speed;
    if(down) ypos += speed;
  }
  
  void move() {
    if(second() % 5 != 0) movement();
    wall();
    wall_detection();
  }
  
  void wall_detection(){
    
    if(xpos <= offset + player/2)             xpos += speed;
    if(xpos >= offset + mazeWidth - player/2) xpos -= speed;
    if(ypos <= offset + player/2)             ypos += speed;
    if(ypos >= offset + mazeWidth - player/2) ypos -= speed;
  
  }
}


