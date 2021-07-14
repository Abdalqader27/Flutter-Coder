import 'after_used/result.dart';

void main(List<String> args) {
  final fakeWidget = widgetBuilderAfter(Result.loaded(42));
  print(fakeWidget);
}

String widgetBuilderAfter(Result state) {
  return state.join(
    (init) => 'init',
    (loading) => 'loading',
    (loaded) => 'loaded ${loaded.data}',
  );
}
