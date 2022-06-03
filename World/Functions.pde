String print2D(float[][] f) {
  String s = "";
  for (int i = 0; i < f.length; i++) {
    s += Arrays.toString(f[i]);
    s += "\n";
  }
  return s;
}

void display(double[][] test) {
  for (int i = 0; i < test.length; i++) {
    for (int j = 0; j < test[i].length; j++) {
      if (test[i][j] != 0) point(j, i);
    }
  }
}

float dist(PVector a, PVector b) {
  //return a.sub(b).mag();
  return sqrt(sq(a.x - b.x) + sq(a.y - b.y) + sq(a.z - b.z));
}


boolean addGun(Gun g) {
  if (INVENTORY.size() < 3) {
    INVENTORY.add(g);
    return true;
  }
  return false;
}

Enemy inSight() {
  if (AIM != 0) {
    for (int i = 0; i < ENEMIES.size(); i++) {
      if (ENEMIES.get(i).ID == AIM) return ENEMIES.get(i);
    }
  }
  return null;
}

boolean cover(PVector a, PVector b, PVector c) {
  float i1 = a.mag();
  float i2 = b.mag();
  float i3 = c.mag();
  float d1 = dist(a, b);
  float d2 = dist(b, c);
  float d3 = dist(c, a);
  //println(solveT(i1, i2, d1) + solveT(i1, i3, d3) + solveT(i3, i2, d2));
  return (aprox(2*PI, solveT(i1, i2, d1) + solveT(i1, i3, d3) + solveT(i3, i2, d2)));
}

double solveT(float a, float b, float op) {
  double theta = acos((sq(op)-sq(a)-sq(b))/(-2 * a * b));
  return theta;
}

boolean aprox(double a, double b) {
  double err = a * .01;
  return (b >= a - err && b <= a + err);
}
boolean aprox2(double a, double b) {
  if (((a >= 6.2 && a<= 6.37) || (a >= -.1 && a <= .1)) && ((b >= 6.2 && b<= 6.37) || (b >= -.1 && b <= .1))) return true;
  double err = a * .025;
  if (a <= 1 && a >= -1) err = .025;
  return (b >= a - err && b <= a + err);
}
ArrayList<Triangle> copyOf(ArrayList<Triangle> ts) {
  ArrayList<Triangle> tsc = new ArrayList<Triangle>();
  for (Triangle t : ts) {
    tsc.add(t.copyOf());
  }
  return tsc;
}
