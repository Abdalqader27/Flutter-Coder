class Accumulator {
  int _currentTotal = 0;

  int add(int val) => _currentTotal += val;
  int get currentTotal => _currentTotal;
}
