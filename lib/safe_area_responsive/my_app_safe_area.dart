import 'package:flutter/material.dart';

import 'responsive_safe_area.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // The Builder widget is no longer needed
        body: ResponsiveSafeArea(
          builder: (BuildContext context, Size size) {
            return Container(
              decoration: BoxDecoration(color: Colors.green.shade200),
              alignment: Alignment.topCenter,
              height: size.height / 2,
              child: Column(
                children: <Widget>[
                  Text(
                    "Let's get",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    "RESPONSIVE",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
