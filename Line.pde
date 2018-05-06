class Line {
  // 1. Attributes
  Node origin, end;
  // 2. Constructors
  // 2.1. Default
 Line(Node node1, Node node2) {
    origin = node1;
    end = node2;
  }
  void connect() {
    pushStyle();
    strokeWeight(20);
    stroke(255, 0, 255);
    line(origin().position().x, origin().position().y, end().position().x, end().position().y);
    popStyle();
  }
  Node origin() {
    return origin;
  }

  Node end() {
    return end;
  }
}