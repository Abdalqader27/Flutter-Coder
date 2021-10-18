import 'package:flutter/material.dart';

void main() {
  List list = [];
  const dessert = ['cookies', 'cupcakes', 'donuts', 'pie'];

  //simple3 printing but we have warning

  // spreadsheet operator
  List l1 = ['One'];
  List l2 = ['Two'];
  List l3 = [...l1, ...l2];
  int x = 2;
  List l4 = [if (x == 2) 'Three', 'Four'];
  List l5 = ["Six", for (var d in dessert) d.toUpperCase()];
  printList(l5, printType.two);
}

void printList(dynamic list, printType type) {
  if (printType.one == type) {
    //simple printing
    list.forEach(debugPrint);
  } else if (printType.two == type) {
    //simple2 printing
    for (var v in list) {
      debugPrint(v);
    }
  } else {
    list.forEach((dessert) => debugPrint(dessert));
  }
}

enum printType { one, two, three }
