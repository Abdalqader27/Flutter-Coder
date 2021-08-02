// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Model _$ModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'first':
      return First.fromJson(json);
    case 'second':
      return Second.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$ModelTearOff {
  const _$ModelTearOff();

  First first(String a) {
    return First(
      a,
    );
  }

  Second second(int b, bool c) {
    return Second(
      b,
      c,
    );
  }

  Model fromJson(Map<String, Object> json) {
    return Model.fromJson(json);
  }
}

/// @nodoc
const $Model = _$ModelTearOff();

/// @nodoc
mixin _$Model {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String a) first,
    required TResult Function(int b, bool c) second,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String a)? first,
    TResult Function(int b, bool c)? second,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(First value) first,
    required TResult Function(Second value) second,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(First value)? first,
    TResult Function(Second value)? second,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelCopyWith<$Res> {
  factory $ModelCopyWith(Model value, $Res Function(Model) then) =
      _$ModelCopyWithImpl<$Res>;
}

/// @nodoc
class _$ModelCopyWithImpl<$Res> implements $ModelCopyWith<$Res> {
  _$ModelCopyWithImpl(this._value, this._then);

  final Model _value;
  // ignore: unused_field
  final $Res Function(Model) _then;
}

/// @nodoc
abstract class $FirstCopyWith<$Res> {
  factory $FirstCopyWith(First value, $Res Function(First) then) =
      _$FirstCopyWithImpl<$Res>;
  $Res call({String a});
}

/// @nodoc
class _$FirstCopyWithImpl<$Res> extends _$ModelCopyWithImpl<$Res>
    implements $FirstCopyWith<$Res> {
  _$FirstCopyWithImpl(First _value, $Res Function(First) _then)
      : super(_value, (v) => _then(v as First));

  @override
  First get _value => super._value as First;

  @override
  $Res call({
    Object? a = freezed,
  }) {
    return _then(First(
      a == freezed
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$First implements First {
  _$First(this.a);

  factory _$First.fromJson(Map<String, dynamic> json) =>
      _$_$FirstFromJson(json);

  @override
  final String a;

  @override
  String toString() {
    return 'Model.first(a: $a)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is First &&
            (identical(other.a, a) ||
                const DeepCollectionEquality().equals(other.a, a)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(a);

  @JsonKey(ignore: true)
  @override
  $FirstCopyWith<First> get copyWith =>
      _$FirstCopyWithImpl<First>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String a) first,
    required TResult Function(int b, bool c) second,
  }) {
    return first(a);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String a)? first,
    TResult Function(int b, bool c)? second,
    required TResult orElse(),
  }) {
    if (first != null) {
      return first(a);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(First value) first,
    required TResult Function(Second value) second,
  }) {
    return first(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(First value)? first,
    TResult Function(Second value)? second,
    required TResult orElse(),
  }) {
    if (first != null) {
      return first(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$FirstToJson(this)..['runtimeType'] = 'first';
  }
}

abstract class First implements Model {
  factory First(String a) = _$First;

  factory First.fromJson(Map<String, dynamic> json) = _$First.fromJson;

  String get a => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirstCopyWith<First> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecondCopyWith<$Res> {
  factory $SecondCopyWith(Second value, $Res Function(Second) then) =
      _$SecondCopyWithImpl<$Res>;
  $Res call({int b, bool c});
}

/// @nodoc
class _$SecondCopyWithImpl<$Res> extends _$ModelCopyWithImpl<$Res>
    implements $SecondCopyWith<$Res> {
  _$SecondCopyWithImpl(Second _value, $Res Function(Second) _then)
      : super(_value, (v) => _then(v as Second));

  @override
  Second get _value => super._value as Second;

  @override
  $Res call({
    Object? b = freezed,
    Object? c = freezed,
  }) {
    return _then(Second(
      b == freezed
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
      c == freezed
          ? _value.c
          : c // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Second implements Second {
  _$Second(this.b, this.c);

  factory _$Second.fromJson(Map<String, dynamic> json) =>
      _$_$SecondFromJson(json);

  @override
  final int b;
  @override
  final bool c;

  @override
  String toString() {
    return 'Model.second(b: $b, c: $c)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Second &&
            (identical(other.b, b) ||
                const DeepCollectionEquality().equals(other.b, b)) &&
            (identical(other.c, c) ||
                const DeepCollectionEquality().equals(other.c, c)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(b) ^
      const DeepCollectionEquality().hash(c);

  @JsonKey(ignore: true)
  @override
  $SecondCopyWith<Second> get copyWith =>
      _$SecondCopyWithImpl<Second>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String a) first,
    required TResult Function(int b, bool c) second,
  }) {
    return second(b, c);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String a)? first,
    TResult Function(int b, bool c)? second,
    required TResult orElse(),
  }) {
    if (second != null) {
      return second(b, c);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(First value) first,
    required TResult Function(Second value) second,
  }) {
    return second(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(First value)? first,
    TResult Function(Second value)? second,
    required TResult orElse(),
  }) {
    if (second != null) {
      return second(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$SecondToJson(this)..['runtimeType'] = 'second';
  }
}

abstract class Second implements Model {
  factory Second(int b, bool c) = _$Second;

  factory Second.fromJson(Map<String, dynamic> json) = _$Second.fromJson;

  int get b => throw _privateConstructorUsedError;
  bool get c => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecondCopyWith<Second> get copyWith => throw _privateConstructorUsedError;
}
