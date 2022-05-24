public class Obj { //<>//
  public ArrayList<PVector> points;
  PVector center;
  public Obj () {
    this(new ArrayList<PVector>());
  }
  public Obj (ArrayList<PVector> points_) {
    points = points_;
    center = calcCenter();
  }
  PVector calcCenter () {
    PVector cent = new PVector(0, 0, 0);
    for (PVector vec : points) {
      cent.add(vec);
    }
    cent.div(points.size());
    return cent;
  }
  void rotateX(float deg) {
    float rad = radians(deg);
    PVector xaxis = new PVector(1, 0, 0);
    for (PVector point : points) {
      PVector xy = new PVector(point.x, point.y, 0);
      float angle = PVector.angleBetween(xy, xaxis) + rad;
      point.x = xy.mag() * cos(angle);
      point.y = xy.mag() * sin(angle);
      PVector xy2 = new PVector(point.x, point.y, 0);
      println(xy.mag() + " " + xy2.mag());
    }
  }
  void rotateOnX(float deg) {
    float rad = radians(deg);
    //PVector xaxis = new PVector(1,0,0);
    PVector xyCenter = new PVector(center.x, center.y, 0);
    for (PVector point : points) {
      PVector xy = new PVector(point.x, point.y, 0);

      float angle = PVector.angleBetween(xy, xyCenter) + rad;
      xy.sub(xyCenter);
      point.x = xy.mag() * cos(angle);
      point.y = xy.mag() * sin(angle);
    }
  }
}
