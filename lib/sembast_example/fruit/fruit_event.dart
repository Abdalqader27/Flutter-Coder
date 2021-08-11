import 'package:equatable/equatable.dart';
import 'package:futter_coder/sembast_example/model/fruit.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FruitEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadFruits extends FruitEvent {}

class AddRandomFruit extends FruitEvent {}

class UpdateWithRandomFruit extends FruitEvent {
  final Fruit updatedFruit;

  UpdateWithRandomFruit(this.updatedFruit);
}

class DeleteFruit extends FruitEvent {
  final Fruit fruit;

  DeleteFruit(this.fruit);
}
