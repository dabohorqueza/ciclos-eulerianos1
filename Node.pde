class Node { 
  PVector pos;
  int ai;
  int da;
  int size;
  Node (PVector XY, int cx, int cy, int sz ) {
    pos = XY;
    ai  = cx;
    da = cy;
    size= sz;
  }
  void display () {
    pushStyle();
    strokeWeight(5);
    stroke(random(0,500), random(0,500), random(0,500));
    fill(90);
    ellipse(pos.x, pos.y, size, size);
    popStyle();
  }
  PVector position() {
    return pos;
  }
  boolean check() {
    float d= dist(ai, da, pos.x, pos.y);
    if (d<size) {
      return true;
    } else {
      return false;
    }
  }
}