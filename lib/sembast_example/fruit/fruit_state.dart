import 'package:equatable/equatable.dart';
import 'package:futter_coder/sembast_example/model/fruit.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FruitState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FruitsLoading extends FruitState {}

class FruitsLoaded extends FruitState {
  final List<Fruit> fruits;

  FruitsLoaded(this.fruits);
  @override
  List<Object?> get props => [fruits];
}
