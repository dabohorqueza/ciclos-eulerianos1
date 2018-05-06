class Node { 

  PVector pos;
  int ai;
  int uda;
  int size;
  Node (PVector XY, int cx, int cy, int sz ) {
    pos = XY;
    ai=cx;
    uda=cy;
    size=sz;
  }
  //necesito obtener los datos del nodo como la posición etc,etc
  void display () {
    pushStyle();
    strokeWeight(5);
    stroke(255, 0, 255);
    fill(0, 255, 0);
    ellipse(pos.x, pos.y, size, size);
    popStyle();
  }
  //void setPosition(PVector pos) {
  //  position = pos;
  //}

  PVector position() {
    return pos;
  }
  boolean check() {
    float d= dist(ai, uda, pos.x, pos.y);
    if (d<size) {
      return true;
    } else {
      return false;
    }
  }
}