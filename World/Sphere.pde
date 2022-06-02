public class Sphere extends Obj {
  //ArrayList<PVector> ps;
  public Sphere(PVector pos, float radius, color clr) {
    super();
    ArrayList<Triangle> ts = new ArrayList<Triangle>();
    ArrayList<PVector> ps = new ArrayList<PVector>();
    int m = 10;
    for (int theta = 0; theta <= 180; theta+=180/m) {
      //float rSin = radius*sin(theta);
      float rCos = radius*cos(theta);
      ps.add(new PVector(pos.x+rCos, pos.y, pos.z));
      ps.add(new PVector(pos.x, pos.y+rCos, pos.z));
      ps.add(new PVector(pos.x, pos.y, pos.z+rCos));
    }
    for (int i = 0; i<m+1; i++) {
      ts.add(new Triangle(ps.get(i*3), ps.get(i*3+1), ps.get(i*3+2), clr));
    }//ts.add(new Triangle(ps.get(0), ps.get(1), ps.get(2), clr));
    //ts.add(new Triangle(ps.get(2), ps.get(0), ps.get(3), clr));
    //this.ps = (ArrayList<PVector>) ps.clone();
    //super.setObj(ps, new ArrayList<Triangle>());
    //for (Triangle t : ts) {
    //  addTriangles(t.splitTriangle(this, 3));
    //}
    setObj(ps, ts);
  }
}