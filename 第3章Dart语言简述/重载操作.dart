//定义一个向量类
class Vector {
  final int x;
  final int y;
  const Vector(this.x, this.y);

  //重载加号 + (a + b).
  Vector operator +(Vector v) {
    return new Vector(x + v.x, y + v.y);
  }

  //重载减号 - (a - b).
  Vector operator -(Vector v) {
    return new Vector(x - v.x, y - v.y);
  }
}

main() {
  //实例化两个向量
  final v = new Vector(2, 3);
  final w = new Vector(2, 2);

  final r1 = v + w;
  print('r1.x='+r1.x.toString() + ' r1.y=' + r1.y.toString());

  final r2 = v - w;
  print('r2.x='+r2.x.toString() + ' r2.y=' + r2.y.toString());
}