import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'el_map_screen.dart';

void main() {
  runApp(const MaterialApp(home: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ElMapScreen());
  }
}
