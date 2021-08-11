import 'dart:math';

import 'model/fruit.dart';

class RandomFruitGenerator {
  static final _fruit = [
    Fruit(name: "Banana", isSweet: true),
    Fruit(name: "Strawberry", isSweet: true),
    Fruit(name: "Kiwi", isSweet: false),
    Fruit(name: "Apple", isSweet: true),
    Fruit(name: "Pear", isSweet: true),
    Fruit(name: "Lemon", isSweet: false),
  ];

  static Fruit getRandomFruit() {
    return _fruit[Random().nextInt(_fruit.length)];
  }
}
