Level Genlvl;
Node[] nodes;
Line[] lines; 
Line [] solution;
Table Gen;
Table conn;
IntList connections;
Node restart;
Node solve;
void setup() {
  size (600, 600);
  connections = new IntList();
}
void draw() {

  if (key == '1') {
    background (50);
    conn =loadTable("lvl1con.csv");
    Gen =loadTable("level1coordinates.csv", "header");
    Genlvl = new Level (Gen);
    Genlvl.create();
    for (int i = 0; i < conn.getRowCount(); i++) {
      for (int j=0; j< conn.getRowCount(); j++) {
        if (conn.getInt(i, j)==1) {
            TableRow row1 = Gen.getRow(i);
            TableRow row2 = Gen.getRow(j);
      line(row1.getInt("xposition"),row1.getInt("yposition"),row2.getInt("xposition"),row2.getInt("yposition"));
        }
      }
    }
  } else if (key == '2') {
    background (50);
    conn =loadTable("lvl1con.csv");
    Gen =loadTable("level2coordinates.csv", "header");
    Genlvl = new Level (Gen);
    Genlvl.create();
  } else if (key =='3') {
    conn =loadTable("lvl1con.csv");
    Gen =loadTable("level3coordinates.csv", "header");
    Genlvl = new Level (Gen);
    Genlvl.create();
  } else {
    textSize(24);
    fill(random(999), random(999), random(999));
    text("level1 PRESS 1", 30, 300);
    fill(random(999), random(999), random(999));
    text("level2 PRESS 2", 230, 300);
    fill(random(999), random(999), random(999));
    text("level3 PRESS 3", 420, 300);
  }
  if (connections.size()>=2 /**esto depende de cada nivel**/) {
    lines = new Line[connections.size()-1];
    for (int j=1; j<connections.size(); j++) {    
      if  (conn.getInt(connections.get(connections.size()-1), connections.get(connections.size()-2))==1) {
        lines[j-1] = new Line(nodes[connections.get(j)], nodes[connections.get(j-1)]);
        lines[j-1].connect();
        conn.setInt(connections.get(j-1), connections.get(j), 0);
        conn.setInt(connections.get(j), connections.get(j-1), 0);
      } else { 
        connections.remove(connections.size()-1);
      }
    }
  }
}
void mouseClicked() {
  switch (key) {
  case '1':
    for (int j = 0; j<Gen.getRowCount(); j++) {
      if ( nodes[j].check()) {
        connections.append(j);
      }
    }
    if (restart.check()) {
      connections.clear();
    }
    break;
  case '2':
    for (int j = 0; j<Gen.getRowCount(); j++) {
      if ( nodes[j].check()) {
        connections.append(j);
      }
    }
    if (restart.check()) {
      connections.clear();
    }
    break;
  }
}