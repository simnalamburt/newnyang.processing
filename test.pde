Maze m;
Destination d;
Player p;
boolean right, left, up, down, isDown;

void setup() {
  smooth();
  frameRate(60);

  m = new Maze(5);
  d = new Destination();
  p = new Player();
  
  
}

void draw() {
  background(0);

  m.display();
  p.display();
  d.display();
  
  m.move();
  p.move();
  
  box_detection();

}

void box_detection(){

  p.x1 = get(int(p.xpos-p.player/2-0), int(p.ypos));
  p.x2 = get(int(p.xpos+p.player/2+0), int(p.ypos));
  p.y1 = get(int(p.xpos),              int(p.ypos-p.player/2-0));
  p.y2 = get(int(p.xpos),              int(p.ypos+p.player/2+0));
  

  if(p.x1 == d.boxCol) { m.boxes += 1; p.xpos = p.ypos = p.offset + p.block/4; }
  if(p.x2 == d.boxCol) { m.boxes += 1; p.xpos = p.ypos = p.offset + p.block/4; }
  if(p.y1 == d.boxCol) { m.boxes += 1; p.xpos = p.ypos = p.offset + p.block/4; }
  if(p.y2 == d.boxCol) { m.boxes += 1; p.xpos = p.ypos = p.offset + p.block/4; }
}

void keyHandle(boolean isDown) {
  if(key != CODED) return;

  switch(keyCode) {
  case RIGHT: right = isDown; return;
  case LEFT:  left  = isDown; return;
  case UP:    up    = isDown; return;
  case DOWN:  down  = isDown; return;
  }  
}

void keyPressed(){
  keyHandle(true);
}
  
void keyReleased(){
  keyHandle(false);
}
