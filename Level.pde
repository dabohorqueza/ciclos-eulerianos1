class Level {
Table selectedlvl;
Level (Table  lvl) {
    selectedlvl=lvl;}
 
  void create () {
    nodes = new Node[selectedlvl.getRowCount()];
    PVector A;
    for (int i = 0; i<selectedlvl.getRowCount(); i++) {
      TableRow row = selectedlvl.getRow(i);
      int x = row.getInt("xposition");
      int y = row.getInt("yposition");
       A = new PVector(x, y);
      nodes [i] = new Node (A,mouseX,mouseY,int (random(20,40)));
      nodes[i].display();
    }
    PVector R;
    R=new PVector (100,500);
    restart =new Node (R,mouseX,mouseY,50);
    restart.display();
  }
}