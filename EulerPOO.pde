Level Genlvl;
Node[] nodes;
Line[] lines; 
Table Gen;
//Table connn; si aparece un problema de compilación por no declarar estas variables
IntList connections;
void setup() {
  size (600, 600);
  connections = new IntList();
}
void draw() {
  switch  (key) {
  case '1':
    Table conn =loadTable("lvl1con.csv");
    Table Gen =loadTable("level1coordinates.csv", "header");
    Genlvl = new Level (Gen);
    background (0);
    Genlvl.create();
    //if (mousePressed == true){
    print(connections);
    if (connections.size()>1) {
      lines = new Line[connections.size()];
      for (int j=1; j<=connections.size(); j++) {    
        lines[j-1] = new Line(nodes[j-1], nodes[j]);
        if ( conn.getInt(connections.get(j), connections.get(j-1))==1); 
        {
          lines[j-1].connect();
        }
      }
    }
    break;
    //case '2':
    //  Table LVL2=loadTable ("level2coordinates.csv", "header");
    //  Genlvl = new Level (LVL2);
    //  background (0);
    //  Genlvl.create();
    //  if (mousePressed == true) {
    //    for (int j = 0; j<LVL2.getRowCount(); j++) {
    //      if ( nodes[j].check()) {
    //        lines= new Line(nodes [j]);
    //      }
    //    }
    //  }
    //  break;
    //case '3':
    //  Table LVL3= loadTable("level3coordinates.csv", "header");
    //  Genlvl= new Level (LVL3);
    //  background (0);
    //  Genlvl.create();

    //  //    if (mousePressed == true) {

    //  //}
    //  break;
  default:
    fill(34, 432, 21);
    rect(0, 0, width/3, height);
    fill(344, 42, 213);
    rect(width/3, 0, 2*width/3, height);
    fill(12, 432, 213);
    rect(2*width/3, 0, width, height);
    textSize(32);
    fill(random(999), random(999), random(999));
    text("level1", 50, 300);
    fill(random(999), random(999), random(999));
    text("level2", 250, 300);
    fill(random(999), random(999), random(999));
    text("level3", 450, 300);
    break;
  }
}
void mouseClicked() { 
  if (key=='1'/**|| key=='2' || key=='3'*/) {
    Table Gen =loadTable("level1coordinates.csv", "header");
    print (connections);
    for (int j = 0; j<Gen.getRowCount(); j++) {
      if ( nodes[j].check()) {
        connections.append(j);
      }
    }
  }
}