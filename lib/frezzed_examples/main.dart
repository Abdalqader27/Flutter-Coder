import 'package:flutter/cupertino.dart';

import 'frezzed_classes.dart';
import 'model_example/model.dart';
import 'person_example/person.dart';

void main() {
  ///  m1
  var union = const Union.data(42);
  union.when(
    data: (int? value) => debugPrint("$value"),
    loading: () => debugPrint("loading"),
    error: (String? message) => debugPrint("Error $message"),
  );

  ///m2
  if (union is Loading) {
    debugPrint("loading");
  } else if (union is Error) {
    debugPrint("Error");
  } else {
    debugPrint("value : $union");
  }

  var model = Model.first('42');

  debugPrint(
    model.map(
      first: (First value) => 'first ${value.a}',
      second: (Second value) => 'second ${value.b} ${value.c}',
    ),
  );
  var model2 = Model.second(42, false);

  model2.when(
      first: (a) => {debugPrint("a : $a")},
      second: (b, c) {
        debugPrint("b : $b");
        debugPrint("c : $c");
      });

  Person p = Person.fromJson({"name": "abd", "age": 13});
  p.map(named: (named) {
    debugPrint(named.name);
    debugPrint("${named.age}");
  });
}
