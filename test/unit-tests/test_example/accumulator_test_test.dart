import 'package:flutter_test/flutter_test.dart';
import 'package:futter_coder/test_example/accumlator.dart';
int x=9;
void main() {
  late Accumulator accumulator;

  setUp(() => accumulator = Accumulator());

  test('starts at 0', () async {
    expect(accumulator.add(2), 2);
  });

  test('accumulates', () async {
    expect(accumulator.add(2), 2);
    expect(accumulator.add(2), 4);
    expect(accumulator.add(2), 6);
  });
}
