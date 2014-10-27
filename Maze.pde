class Maze {
  final int size;
  boolean[][][] decision;

  final float offset = 25.0;
  final float block = 80;

  float wait;
  float time;
  float timeTotal;
  float timeLeft;

  PFont font;
  float title = 100;
  float txt = 30;

  int boxes = 0;
  int life = 3;
  int intNum;
  int modulo;

  // Maze
  Maze(int size) {
    this.size = size;
    this.decision = new boolean[size][size][8];

    randomSeed(0);
    size(int(offset*2 + block*size), int(offset*2 + block*size + title + txt*5));
  }

  void decide() {
    for (int i = 0; i < size; ++i) {
      for (int j = 0; j < size; ++j) {
        for (int k = 0; k < 8; ++k) {
          decision[i][j][k] = random(0, 1) <= .5;
        }
      }
    }
  }

  void cell(int i, int j) {
    // horizontal
    if (decision[i][j][0]) { line(offset + i*block,           offset + j*block,           offset + i*block + block/2, offset + j*block); }
    if (decision[i][j][1]) { line(offset + i*block + block/2, offset + j*block,           offset + i*block + block,   offset + j*block); }
    if (decision[i][j][2]) { line(offset + i*block,           offset + j*block + block/2, offset + i*block + block/2, offset + j*block + block/2); }
    if (decision[i][j][3]) { line(offset + i*block + block/2, offset + j*block + block/2, offset + i*block + block,   offset + j*block + block/2); }

    // vertical
    if (decision[i][j][4]) { line(offset + i*block,           offset + j*block,           offset + i*block,           offset + j*block + block/2); }
    if (decision[i][j][5]) { line(offset + i*block,           offset + j*block + block/2, offset + i*block,           offset + j*block + block); }
    if (decision[i][j][6]) { line(offset + i*block + block/2, offset + j*block,           offset + i*block + block/2, offset + j*block + block/2); }
    if (decision[i][j][7]) { line(offset + i*block + block/2, offset + j*block + block/2, offset + i*block + block/2, offset + j*block + block); }
  }

  void time() {
    wait = 5;     //set time
    intNum = int(second());
    modulo = intNum % 5;
    time = wait - modulo;
  }

  void timeLeft() {
    timeLeft = 60;
    timeTotal = 60;
    intNum = int(second());
    timeLeft = timeTotal - intNum;
  }

  void display() {
    stroke(255);
    strokeWeight(3);

    for (int i = 0; i < size; ++i) {
      for (int j = 0; j < size; ++j) {
        cell(i, j);
      }
    }

    float mazeWidth = size * block;
    strokeWeight(3);
    line(offset + mazeWidth, offset, offset + mazeWidth, offset + mazeWidth);
    line(offset, offset + mazeWidth, offset + mazeWidth, offset + mazeWidth);
    line(offset, offset, offset, offset+mazeWidth);
    line(offset, offset, offset+mazeWidth, offset);

    float x1 = offset + mazeWidth/2;
    float y1 = offset + mazeWidth + title/2;
    float y2 = offset + mazeWidth + title + txt/2*1;
    float y3 = offset + mazeWidth + title + txt/2*3;
    float y4 = offset + mazeWidth + title + txt/2*5;
    float y5 = offset + mazeWidth + title + txt/2*7;
    float y6 = offset + mazeWidth + title + txt/2*9;
    float y7 = offset + mazeWidth + title + txt/2*11;


    font = loadFont("OCRAExtended-48.vlw");
    textFont(font);
    textAlign(CENTER);
    textSize(title/2);
    fill(255);
    text("MazeCollector", x1, y1);
    textSize(txt/2);
    text("Collect as many boxes as you can", x1, y2);
    text("Use arrow keys to move",  x1, y3);
    rect(offset, y3+txt/2, mazeWidth, txt/2);
    fill(0);
    text("Time Interval : " + time,     x1, y4);
    fill(255);
    rect(offset, y3+txt/2*3, mazeWidth, txt/2);
    fill(0);
    text("Time Left : " + timeLeft, x1, y5);
    fill(255);
    rect(offset, y3+txt/2*5, mazeWidth, txt/2);
    fill(0);
    text("Number of Boxes Collected : " + boxes, x1, y6);
    fill(255);
    text("Number of Lives : " + life, x1, y7);

    if(life == 0) {
      noLoop();
      fill(0);
      noStroke();
      rect(offset, y3+txt/2*7, mazeWidth, txt/2);
      fill(255);
      text("Game Over!", x1, y7);
    }
  }


  void move() {
    if (intNum % 5 == 0) { decide(); time = 0; timeLeft(); }
    if (intNum % 5 != 0) { time(); timeLeft(); }
    if (intNum % 60 == 0) { life -= 1; }
  }
}
