Level Genlvl;
Node[] nodes;
Line[] lines; 
Table Gen;
Table conn;
IntList connections;
Node restart;
int n;
int win;

void setup() {
  size (600, 600);
  connections = new IntList();
}
void draw() {

  if (key == '1') {
    n =0;
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
          n =n +1;
          line(row1.getInt("xposition"), row1.getInt("yposition"), row2.getInt("xposition"), row2.getInt("yposition"));
          textSize(16);
          text("R", 95, 506);
          textSize(14);
          text("Solve", 483, 504);
        }
      }
    }
  } else if (key == '2') {
    n =0;
    background (50);
    conn =loadTable("lvl2con.csv");
    Gen =loadTable("level2coordinates.csv", "header");
    Genlvl = new Level (Gen);
    Genlvl.create();
    for (int i = 0; i < conn.getRowCount(); i++) {
      for (int j=0; j< conn.getRowCount(); j++) {
        if (conn.getInt(i, j)==1) {
          TableRow row1 = Gen.getRow(i);
          TableRow row2 = Gen.getRow(j);
          n =n +1;
          line(row1.getInt("xposition"), row1.getInt("yposition"), row2.getInt("xposition"), row2.getInt("yposition"));
        }
      }
    }
    textSize(16);
    text("R", 95, 506);
    textSize(14);
    text("Solve", 483, 504);
  } else if (key =='3') {
    n=0;
    background (50);
    conn =loadTable("lvl3con.csv");
    Gen =loadTable("level3coordinates.csv", "header");
    Genlvl = new Level (Gen);
    Genlvl.create();
    for (int i = 0; i < conn.getRowCount(); i++) {
      for (int j=0; j< conn.getRowCount(); j++) {
        if (conn.getInt(i, j)==1) {
          TableRow row1 = Gen.getRow(i);
          TableRow row2 = Gen.getRow(j);
          n =n +1;
          line(row1.getInt("xposition"), row1.getInt("yposition"), row2.getInt("xposition"), row2.getInt("yposition"));
        }
      }
    }
    textSize(16);
    text("R", 95, 506);
    textSize(14);
  } else {
    background (50);
    textSize(24);
    fill(random(999), random(999), random(999));
    text("level1 PRESS 1", 30, 300);
    fill(random(999), random(999), random(999));
    text("level2 PRESS 2", 230, 300);
    fill(random(999), random(999), random(999));
    text("level3 PRESS 3", 420, 300);
  }
  print (win);
  if (win != 0) {
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
  } else if (win ==0) {
    textSize(50);
    text("GANASTE", 200, 300);
  }
  win = ((n/2)+1)-connections.size();
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
  case '3':

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
void keyPressed(){  connections.clear();}