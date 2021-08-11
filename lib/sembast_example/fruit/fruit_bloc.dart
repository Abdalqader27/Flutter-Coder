import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:futter_coder/bloc_tutorial/painless_state_mangment/bloc/bloc.dart';
import 'package:futter_coder/sembast_example/data/dao/fruit_dao.dart';

import '../fruit/fruit_event.dart';
import '../fruit/fruit_state.dart';
import '../random_fruit_generator.dart';

int number = 0;

class FruitBloc extends Bloc<FruitEvent, FruitState> {
  final FruitDao _fruitDao = FruitDao();
  int myNumber;
  FruitBloc()
      : myNumber = number++,
        super(FruitsLoading());

  @override
  void onEvent(FruitEvent event) {
    debugPrint(event.toString());
    debugPrint(number.toString());
    super.onEvent(event);
  }

  @override
  Stream<FruitState> mapEventToState(
    FruitEvent event,
  ) async* {
    debugPrint(event.toString());

    if (event is LoadFruits) {
      // Indicating that fruits are being loaded - display progress indicator.
      yield FruitsLoading();
      yield* _reloadFruits();
    } else if (event is AddRandomFruit) {
      // Loading indicator shouldn't be displayed while adding/updating/deleting
      // a single Fruit from the database - we aren't yielding FruitsLoading().
      await _fruitDao.insert(RandomFruitGenerator.getRandomFruit());
      yield* _reloadFruits();
    } else if (event is UpdateWithRandomFruit) {
      final newFruit = RandomFruitGenerator.getRandomFruit();
      // Keeping the ID of the Fruit the same
      newFruit.id = event.updatedFruit.id;
      await _fruitDao.update(newFruit);
      yield* _reloadFruits();
    } else if (event is DeleteFruit) {
      await _fruitDao.delete(event.fruit);
      yield* _reloadFruits();
    }
  }

  Stream<FruitState> _reloadFruits() async* {
    final fruits = await _fruitDao.getAllSortedByName();
    yield FruitsLoaded(List.from(fruits));
  }
}
