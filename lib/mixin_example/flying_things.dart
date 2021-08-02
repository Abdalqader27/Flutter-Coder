import 'package:flutter/cupertino.dart';

mixin Fluttering {
  void flutter() {
    debugPrint('fluttering');
  }
}

abstract class Insect {
  void crawl() {
    debugPrint('crawling');
  }
}

abstract class AirborneInsect extends Insect with Fluttering {
  void buzz() {
    debugPrint('buzzing annoyingly');
  }
}

class Mosquito extends AirborneInsect {
  void doMosquitoThing() {
    crawl();
    flutter();
    buzz();
    debugPrint('sucking blood');
  }
}

abstract class Bird with Fluttering {
  void chirp() {
    debugPrint('chirp chirp');
  }
}

class Swallow extends Bird {
  void doSwallowThing() {
    chirp();
    flutter();
    debugPrint('eating a mosquito');
  }
}
