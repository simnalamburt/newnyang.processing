class Destination {
  final float size = 5;
  final float offset = 25.0;
  final float block = 80;

  int r;
  int g;
  int b;

  color boxCol;

  int bx;
  int by;
  int m;
  int n;

  void display() {
    if(second() % 5 == 0) {
      r = int(random(0,255));
      g = int(random(0,255));
      b = int(random(0,255));
      boxCol = color(r,g,b);

      m = int(random(2,size*2));
      n = int(random(2,size*2));
    }

    if(m+n>0) {
      bx = int(offset + m * block/2);
      by = int(offset + n * block/2);

      constrain(bx, offset, offset + size * block - block/2);
      constrain(by, offset, offset + size * block - block/2);

      if((bx-offset % block/2) == 0 && (by-offset) % block/2 == 0) {
        dHandle(true);
      } else {
        dHandle(false);
      }
    }
  }

  void dHandle(boolean interval) {
    if(second() % 5 != 0) {
        randomSeed(second());
        fill(boxCol);
        stroke(boxCol);
        strokeWeight(3);
        rect(bx, by, block/2, block/2);
    }
  }
}
