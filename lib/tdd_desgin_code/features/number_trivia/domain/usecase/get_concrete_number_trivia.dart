import 'package:dartz/dartz.dart';
import 'package:futter_coder/tdd_desgin_code/core/error/failure.dart';

import '../entities/number_trivial.dart';
import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> call({required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
