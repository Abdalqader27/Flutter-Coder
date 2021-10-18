import 'package:flutter/material.dart';

void main() {
  final Map<String, int> emptyMap = {};
  final emptyMap2 = <String, int>{};
  final emptySomething = {};
  final inventory = {'cakes': 20, 'pies': 14, 'donuts': 37, 'cookies': 141};
  final numberOfCakes = inventory['cakes'];
  inventory['brownies'] = 3;
  for (var x in inventory.entries) {
    debugPrint("KEY -> " + x.key + " VALUE ->" + x.value.toString());
  }
  inventory.forEach((K, V) => debugPrint("KEY -> " + K + " VALUE ->" + V.toString()));

  //Higher orderMethods
  List<int> numbers = [1, 2, 3, 4];
  final squres = numbers.map((e) => e * e).toList();
  final even = numbers.where((element) => element.isEven);
  //The First param [contains the result of the previous function call]
  // The Second param [ contains the current element in the collection ]
  final total = numbers.reduce((result, element) => result += element);
  // REDUCE  == fOLD WITHOUT   empty list
  final total2 = numbers.fold(0, (int previousValue, element) => previousValue + element);

  numbers.sort();
  var reversed = numbers.reversed;

  //Combine Higher
  const desserts = ['cake', 'pie', 'donuts', 'brownies'];
  final bigTallDesert = desserts.where((element) => element.length > 5).map((e) => e.toUpperCase());
  //(DONUTS, BROWNIES) this is output
}
