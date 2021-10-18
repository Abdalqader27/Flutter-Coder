void main() {
  final Set<int> someSet = {};
  final someSet2 = <int>{};
  final anotherSet = {1, 2, 3, 1}; // out is 1 2 3
  final Set<int> setA = {1, 2, 3, 4};
  final Set<int> setB = {2, 4, 5};
  final intersection = setA.intersection(setB);
  final union = setA.union(setB);
}
