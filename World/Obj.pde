<<<<<<< HEAD
public class Obj { //<>// //<>// //<>//
  ArrayList<PVector> points;
=======
public class Obj { //<>//
  public ArrayList<PVector> points;
  public ArrayList<Triangle> triangles;
>>>>>>> Raymond
  PVector center;
  public Obj () {
    this(new ArrayList<PVector>(), new PVector (0, 0, 0));
  }
<<<<<<< HEAD
  public Obj (ArrayList<PVector> points_, PVector center_) {
    points = new ArrayList<PVector>();
    center = center_;
    for (PVector point : points_){
      points.add(point.sub(center));
    }
=======
  public Obj (ArrayList<PVector> points_) {
    //center = new PVector(0, 0, 0);
    points = points_;
    center = calcCenter();
>>>>>>> Raymond
  }
  PVector calcCenter () {
    PVector cent = new PVector(0, 0, 0);
    for (PVector vec : points) {
      cent.add(vec);
    }
    cent.div(points.size());
    return cent;
  }
  ArrayList<PVector> getPoints() {
    return points;
  }
  PVector getCenter () {
    return center;
  }
  void rotateX(float deg) {
    float rad = radians(deg);
    for (PVector point : points) {
      PVector xy = new PVector(point.x, point.y, 0);
      float angle = PVector.angleBetween(xy, xaxis) + rad;
      point.x = xy.mag() * cos(angle);
      point.y = xy.mag() * sin(angle);
      PVector xy2 = new PVector(point.x, point.y, 0);
      println(xy.mag() + " " + xy2.mag());
    }
  }
<<<<<<< HEAD
=======
  void rotateOnX(float deg) {
    float rad = radians(deg);
    PVector xyCenter = new PVector(center.x, center.y, center.z);
    for (PVector point : points) {
      point.sub(xyCenter);
      PVector temp = new PVector(point.z, point.y);
      temp.rotate(rad);
      point.y = temp.y;
      point.z = temp.x;
      point.add(xyCenter);
    }
  }
  void rotateOnY(float deg) {
    float rad = radians(deg);
    PVector xyCenter = new PVector(center.x, center.y, center.z);
    for (PVector point : points) {
      point.sub(xyCenter);
      PVector temp = new PVector(point.x, point.z);
      temp.rotate(rad);
      point.x = temp.x;
      point.z = temp.y;
      point.add(xyCenter);
    }
  }
  void rotateOnZ(float deg) {
    float rad = radians(deg);
    PVector xyCenter = new PVector(center.x, center.y, center.z);
    for (PVector point : points) {
      point.sub(xyCenter);
      PVector temp = new PVector(point.x, point.y);
      temp.rotate(rad);
      point.x = temp.x;
      point.y = temp.y;
      point.add(xyCenter);
    }
  }
>>>>>>> Raymond
}
