import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../counter_example/presentation/counter_page.dart';
import 'injection.dart';
import 'presentation/counter_change_notifier.dart';

void main() {
  // Environment.dev
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ChangeNotifierProvider(
        // Manually passing in the production repository
        create: (_) => CounterChangeNotifier(
          getIt(instanceName: 'DevCounterRepository'),
        ),
        child: const CounterPage(),
      ),
    );
  }
}
