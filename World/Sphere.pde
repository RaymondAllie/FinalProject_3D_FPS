public class Sphere extends Obj {
  //ArrayList<PVector> ps;
  public Sphere(PVector pos, float radius, color clr) {
    super(); 
    ArrayList<Triangle> ts = new ArrayList<Triangle>();
    ArrayList<PVector> ps = new ArrayList<PVector>();
    int angle = 30;
    int rows = 2;
    float rowAngle = 180/rows;
    ps.add(new PVector(pos.x, pos.y+radius, pos.z));
    for (int theta = angle; theta < 360; theta+=angle) {
      float rSin = radius*sin(radians(theta));
      float rCos = radius*cos(radians(theta));
      //for (int phi = 0; phi < 180; phi += rowAngle) {
      //}
      ps.add(new PVector(pos.x+rSin, pos.y+rCos, pos.z));
      ps.add(new PVector(pos.x, pos.y+rCos, pos.z+rSin));
      //ps.add(new PVector(pos.x, pos.y, pos.z+rCos));
    }
    for (int i = 0; i<rows; i++) {
      ts.add(new Triangle(ps.get(0), ps.get(i+1), ps.get(i+2)));
      ts.add(new Triangle(ps.get(0), ps.get(ps.size()-i-1), ps.get(ps.size()-i-2)));
    }
    //ts.add(new Triangle(ps.get(0), ps.get(1), ps.get(2)));
    //ts.add(new Triangle(ps.get(0), ps.get(2), ps.get(ps.size()-2)));
    //ts.add(new Triangle(ps.get(0), ps.get(ps.size()-2), ps.get(ps.size()-1)));
    //ts.add(new Triangle(ps.get(0), ps.get(ps.size()-1), ps.get(1)));

    //ts.add(new Triangle(ps.get(1), ps.get(2), ps.get(3)));
    //ts.add(new Triangle(ps.get(4), ps.get(2), ps.get(3)));

    //ts.add(new Triangle(ps.get(2), ps.get(ps.size()-2), ps.get(4)));
    //ts.add(new Triangle(ps.get(ps.size()-4), ps.get(ps.size()-2), ps.get(4)));

    //ts.add(new Triangle(ps.get(ps.size()-2), ps.get(ps.size()-1), ps.get(ps.size()-4)));
    //ts.add(new Triangle(ps.get(ps.size()-3), ps.get(ps.size()-1), ps.get(ps.size()-4)));

    //ts.add(new Triangle(ps.get(ps.size()-1), ps.get(1), ps.get(ps.size()-3)));
    //ts.add(new Triangle(ps.get(3), ps.get(1), ps.get(ps.size()-3)));


    //ts.add(new Triangle(ps.get(0), ps.get(3), ps.get(4)));
    //for (int i = 0; i<m*2+1; i++) {
    //  ts.add(new Triangle(ps.get(i*2), ps.get(i*2+1), ps.get(i*2), clr));
    //}//ts.add(new Triangle(ps.get(0), ps.get(1), ps.get(2), clr));
    //ts.add(new Triangle(ps.get(2), ps.get(0), ps.get(3), clr));
    //this.ps = (ArrayList<PVector>) ps.clone();
    //super.setObj(ps, new ArrayList<Triangle>());
    //for (Triangle t : ts) {
    //  addTriangles(t.splitTriangle(this, 3));
    //}
    setObj(ps, ts);
  }
}
