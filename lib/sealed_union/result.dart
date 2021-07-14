import 'package:sealed_unions/factories/triplet_factory.dart';
import 'package:sealed_unions/implementations/union_3_impl.dart';
import 'package:sealed_unions/union_3.dart';

class Result extends Union3Impl<_Init, _Loading, _Loaded> {
  Result._(Union3<_Init, _Loading, _Loaded> union) : super(union);

  static final _factory = const Triplet<_Init, _Loading, _Loaded>();

  factory Result.init() => Result._(_factory.first(_Init()));

  factory Result.loading() => Result._(_factory.second(_Loading()));

  factory Result.loaded(data) => Result._(_factory.third(_Loaded(data)));
}

class _Init {}

class _Loading {}

class _Loaded {
  final dynamic data;

  _Loaded(this.data);
}
