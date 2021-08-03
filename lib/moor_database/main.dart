import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futter_coder/moor_database/data/moor_database.dart';
import 'package:provider/provider.dart';

import 'page/home_page.dart';

void main() {
  runApp(MaterialApp(
    home: Provider(
      create: (BuildContext context) => AppDatabase(),
      child: const HomePage(),
    ),
  ));
}
