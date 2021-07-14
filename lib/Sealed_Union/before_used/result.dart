abstract class Result {}

class Init extends Result {}

class Loading extends Result {}

class Loaded extends Result {
  final int data;
  Loaded(this.data);
}
