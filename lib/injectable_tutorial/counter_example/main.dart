import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../counter_example/presentation/counter_page.dart';
import 'injection.dart';
import 'presentation/counter_change_notifier.dart';

void main() {
  // Environment.dev
  configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ChangeNotifierProvider(
        // Manually passing in the production repository
        create: (_) => CounterChangeNotifier(
          getIt(instanceName: 'DevCounterRepository'),
        ),
        child: CounterPage(),
      ),
    );
  }
}
