// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grammar_correction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GrammarCorrection {

 String get originalPhrase; String get suggestedCorrection; String get explanation;
/// Create a copy of GrammarCorrection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GrammarCorrectionCopyWith<GrammarCorrection> get copyWith => _$GrammarCorrectionCopyWithImpl<GrammarCorrection>(this as GrammarCorrection, _$identity);

  /// Serializes this GrammarCorrection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GrammarCorrection&&(identical(other.originalPhrase, originalPhrase) || other.originalPhrase == originalPhrase)&&(identical(other.suggestedCorrection, suggestedCorrection) || other.suggestedCorrection == suggestedCorrection)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,originalPhrase,suggestedCorrection,explanation);

@override
String toString() {
  return 'GrammarCorrection(originalPhrase: $originalPhrase, suggestedCorrection: $suggestedCorrection, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $GrammarCorrectionCopyWith<$Res>  {
  factory $GrammarCorrectionCopyWith(GrammarCorrection value, $Res Function(GrammarCorrection) _then) = _$GrammarCorrectionCopyWithImpl;
@useResult
$Res call({
 String originalPhrase, String suggestedCorrection, String explanation
});




}
/// @nodoc
class _$GrammarCorrectionCopyWithImpl<$Res>
    implements $GrammarCorrectionCopyWith<$Res> {
  _$GrammarCorrectionCopyWithImpl(this._self, this._then);

  final GrammarCorrection _self;
  final $Res Function(GrammarCorrection) _then;

/// Create a copy of GrammarCorrection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? originalPhrase = null,Object? suggestedCorrection = null,Object? explanation = null,}) {
  return _then(_self.copyWith(
originalPhrase: null == originalPhrase ? _self.originalPhrase : originalPhrase // ignore: cast_nullable_to_non_nullable
as String,suggestedCorrection: null == suggestedCorrection ? _self.suggestedCorrection : suggestedCorrection // ignore: cast_nullable_to_non_nullable
as String,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GrammarCorrection].
extension GrammarCorrectionPatterns on GrammarCorrection {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GrammarCorrection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GrammarCorrection() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GrammarCorrection value)  $default,){
final _that = this;
switch (_that) {
case _GrammarCorrection():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GrammarCorrection value)?  $default,){
final _that = this;
switch (_that) {
case _GrammarCorrection() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String originalPhrase,  String suggestedCorrection,  String explanation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GrammarCorrection() when $default != null:
return $default(_that.originalPhrase,_that.suggestedCorrection,_that.explanation);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String originalPhrase,  String suggestedCorrection,  String explanation)  $default,) {final _that = this;
switch (_that) {
case _GrammarCorrection():
return $default(_that.originalPhrase,_that.suggestedCorrection,_that.explanation);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String originalPhrase,  String suggestedCorrection,  String explanation)?  $default,) {final _that = this;
switch (_that) {
case _GrammarCorrection() when $default != null:
return $default(_that.originalPhrase,_that.suggestedCorrection,_that.explanation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GrammarCorrection implements GrammarCorrection {
  const _GrammarCorrection({required this.originalPhrase, required this.suggestedCorrection, required this.explanation});
  factory _GrammarCorrection.fromJson(Map<String, dynamic> json) => _$GrammarCorrectionFromJson(json);

@override final  String originalPhrase;
@override final  String suggestedCorrection;
@override final  String explanation;

/// Create a copy of GrammarCorrection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GrammarCorrectionCopyWith<_GrammarCorrection> get copyWith => __$GrammarCorrectionCopyWithImpl<_GrammarCorrection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GrammarCorrectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GrammarCorrection&&(identical(other.originalPhrase, originalPhrase) || other.originalPhrase == originalPhrase)&&(identical(other.suggestedCorrection, suggestedCorrection) || other.suggestedCorrection == suggestedCorrection)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,originalPhrase,suggestedCorrection,explanation);

@override
String toString() {
  return 'GrammarCorrection(originalPhrase: $originalPhrase, suggestedCorrection: $suggestedCorrection, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class _$GrammarCorrectionCopyWith<$Res> implements $GrammarCorrectionCopyWith<$Res> {
  factory _$GrammarCorrectionCopyWith(_GrammarCorrection value, $Res Function(_GrammarCorrection) _then) = __$GrammarCorrectionCopyWithImpl;
@override @useResult
$Res call({
 String originalPhrase, String suggestedCorrection, String explanation
});




}
/// @nodoc
class __$GrammarCorrectionCopyWithImpl<$Res>
    implements _$GrammarCorrectionCopyWith<$Res> {
  __$GrammarCorrectionCopyWithImpl(this._self, this._then);

  final _GrammarCorrection _self;
  final $Res Function(_GrammarCorrection) _then;

/// Create a copy of GrammarCorrection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? originalPhrase = null,Object? suggestedCorrection = null,Object? explanation = null,}) {
  return _then(_GrammarCorrection(
originalPhrase: null == originalPhrase ? _self.originalPhrase : originalPhrase // ignore: cast_nullable_to_non_nullable
as String,suggestedCorrection: null == suggestedCorrection ? _self.suggestedCorrection : suggestedCorrection // ignore: cast_nullable_to_non_nullable
as String,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
