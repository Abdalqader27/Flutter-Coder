import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:test/test.dart';

import 'library_example.mocks.dart';


class Cat {
  String sound() => "Meow";

  bool eatFood(String food, {bool? hungry}) => true;

  Future<void> chew() async => debugPrint("Chewing");
  
  int walk(List<String> places) => 7;

  void sleep() {}

  void hunt(String place, String prey) {}
  int lives = 9;
}

@GenerateMocks([Cat])
void main() {
  late Cat cat;
  setUp(() {
    // Create mock object.
    cat = MockCat();
  });

  test("Lets verify some behavior ", () {
    when(cat.sound()).thenReturn("Meow");
    cat.sound();
    verify(cat.sound());
  });

  ///I/flutter (20370): 00:00 +0: Lets verify some behavior
  /// I/flutter (20370): 00:00 +1: All tests passed!

  test("How About some Stabbing?", () {
    try {
      cat.sound();
    } on MissingStubError {
      debugPrint("Stabbing catch");
      //throw method
    }
    //expect(cat.sound(), null);

    when(cat.sound()).thenReturn('Purr');
    expect(cat.sound(), 'Purr');
    expect(cat.sound(), 'Purr');

    when(cat.sound()).thenReturn('Meow');
    expect(cat.sound(), 'Meow');
    when(cat.lives).thenReturn(8);
    expect(cat.lives, 8);
    when(cat.lives).thenThrow(RangeError('Boo'));
    expect(() => cat.lives, throwsRangeError);

    // We can calculate a response at call time.
    var responses = ['Purr', 'Meow'];
    when(cat.sound()).thenAnswer((_) => responses.removeAt(0));
    expect(cat.sound(), 'Purr');
    expect(cat.sound(), 'Meow');
  });
}
