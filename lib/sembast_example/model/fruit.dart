class Fruit {
  int? id;
  final String name;
  final bool isSweet;

  Fruit({required this.name, required this.isSweet});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSweet': isSweet,
    };
  }

  factory Fruit.fromMap(Map<String, dynamic> map) {
    return Fruit(
      name: map['name'] as String,
      isSweet: map['isSweet'] as bool,
    );
  }
}
