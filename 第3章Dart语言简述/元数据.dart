//动物类
class Animal {

  //动物会吃
  void eat(){
    print('动物会吃');
  }

  //动物会跑
  void run(){
    print('动物会跑');
  }
}
//人类
class Human extends Animal {

  //人类会说
  void say(){
    print('人类会说');
  }

  //人类会学习
  void study(){
    print('人类会学习');
  }

  @override
  //人类也会吃
  void eat(){
    print('人类也会吃');
  }
}


main() {

  print('实例化一个动物类');
  var animal = new Animal();
  animal.eat();
  animal.run();

  print('实例化一个人类');
  var human = new Human();
  human.eat();
  human.run();
  human.say();
  human.study();
}
