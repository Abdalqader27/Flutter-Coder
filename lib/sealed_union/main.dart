import 'package:flutter/foundation.dart';

import 'result.dart';

void main(List<String> args) {
  final fakeWidget = widgetBuilderAfter(Result.loaded(42));
  debugPrint(fakeWidget);
}

String widgetBuilderAfter(Result state) {
  return state.join(
    (init) => 'init',
    (loading) => 'loading',
    (loaded) => 'loaded ${loaded.data}',
  );
}
