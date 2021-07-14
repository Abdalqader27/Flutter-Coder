import 'package:flutter/material.dart';
import 'package:futter_coder/Sealed_Union/after_used/result.dart' as after;
import 'package:futter_coder/Sealed_Union/before_used/result.dart' as before;

void main() {
  runApp(widgetBuilderBefore());
}

/// Sealed Union
String widgetBuilderBefore(before.Result state) {
  if (state is before.Init)
    return 'init ';
  else if (state is before.Loading)
    return " loading";
  else if (state is before.Loaded) return " Loaded ${state.data}";
  // if remove this will set immutable
  return "";
}

String widgetBuilderAfter(after.Result state) {
  return state.join(
    (init) => 'init',
    (loading) => 'loading',
    (loaded) => 'loaded ${loaded.data}',
  );
}
