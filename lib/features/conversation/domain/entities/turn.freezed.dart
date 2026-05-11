// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Turn {

 String get id; String get transcription; String get aiResponse; List<GrammarCorrection> get grammarCorrections;/// Recording duration stored as milliseconds for JSON serialisation.
 int get recordingDurationMs; DateTime get timestamp;
/// Create a copy of Turn
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TurnCopyWith<Turn> get copyWith => _$TurnCopyWithImpl<Turn>(this as Turn, _$identity);

  /// Serializes this Turn to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Turn&&(identical(other.id, id) || other.id == id)&&(identical(other.transcription, transcription) || other.transcription == transcription)&&(identical(other.aiResponse, aiResponse) || other.aiResponse == aiResponse)&&const DeepCollectionEquality().equals(other.grammarCorrections, grammarCorrections)&&(identical(other.recordingDurationMs, recordingDurationMs) || other.recordingDurationMs == recordingDurationMs)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,transcription,aiResponse,const DeepCollectionEquality().hash(grammarCorrections),recordingDurationMs,timestamp);

@override
String toString() {
  return 'Turn(id: $id, transcription: $transcription, aiResponse: $aiResponse, grammarCorrections: $grammarCorrections, recordingDurationMs: $recordingDurationMs, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $TurnCopyWith<$Res>  {
  factory $TurnCopyWith(Turn value, $Res Function(Turn) _then) = _$TurnCopyWithImpl;
@useResult
$Res call({
 String id, String transcription, String aiResponse, List<GrammarCorrection> grammarCorrections, int recordingDurationMs, DateTime timestamp
});




}
/// @nodoc
class _$TurnCopyWithImpl<$Res>
    implements $TurnCopyWith<$Res> {
  _$TurnCopyWithImpl(this._self, this._then);

  final Turn _self;
  final $Res Function(Turn) _then;

/// Create a copy of Turn
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transcription = null,Object? aiResponse = null,Object? grammarCorrections = null,Object? recordingDurationMs = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,transcription: null == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String,aiResponse: null == aiResponse ? _self.aiResponse : aiResponse // ignore: cast_nullable_to_non_nullable
as String,grammarCorrections: null == grammarCorrections ? _self.grammarCorrections : grammarCorrections // ignore: cast_nullable_to_non_nullable
as List<GrammarCorrection>,recordingDurationMs: null == recordingDurationMs ? _self.recordingDurationMs : recordingDurationMs // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Turn].
extension TurnPatterns on Turn {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Turn value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Turn() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Turn value)  $default,){
final _that = this;
switch (_that) {
case _Turn():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Turn value)?  $default,){
final _that = this;
switch (_that) {
case _Turn() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String transcription,  String aiResponse,  List<GrammarCorrection> grammarCorrections,  int recordingDurationMs,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Turn() when $default != null:
return $default(_that.id,_that.transcription,_that.aiResponse,_that.grammarCorrections,_that.recordingDurationMs,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String transcription,  String aiResponse,  List<GrammarCorrection> grammarCorrections,  int recordingDurationMs,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _Turn():
return $default(_that.id,_that.transcription,_that.aiResponse,_that.grammarCorrections,_that.recordingDurationMs,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String transcription,  String aiResponse,  List<GrammarCorrection> grammarCorrections,  int recordingDurationMs,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _Turn() when $default != null:
return $default(_that.id,_that.transcription,_that.aiResponse,_that.grammarCorrections,_that.recordingDurationMs,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Turn extends Turn {
  const _Turn({required this.id, required this.transcription, required this.aiResponse, required final  List<GrammarCorrection> grammarCorrections, required this.recordingDurationMs, required this.timestamp}): _grammarCorrections = grammarCorrections,super._();
  factory _Turn.fromJson(Map<String, dynamic> json) => _$TurnFromJson(json);

@override final  String id;
@override final  String transcription;
@override final  String aiResponse;
 final  List<GrammarCorrection> _grammarCorrections;
@override List<GrammarCorrection> get grammarCorrections {
  if (_grammarCorrections is EqualUnmodifiableListView) return _grammarCorrections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_grammarCorrections);
}

/// Recording duration stored as milliseconds for JSON serialisation.
@override final  int recordingDurationMs;
@override final  DateTime timestamp;

/// Create a copy of Turn
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TurnCopyWith<_Turn> get copyWith => __$TurnCopyWithImpl<_Turn>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TurnToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Turn&&(identical(other.id, id) || other.id == id)&&(identical(other.transcription, transcription) || other.transcription == transcription)&&(identical(other.aiResponse, aiResponse) || other.aiResponse == aiResponse)&&const DeepCollectionEquality().equals(other._grammarCorrections, _grammarCorrections)&&(identical(other.recordingDurationMs, recordingDurationMs) || other.recordingDurationMs == recordingDurationMs)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,transcription,aiResponse,const DeepCollectionEquality().hash(_grammarCorrections),recordingDurationMs,timestamp);

@override
String toString() {
  return 'Turn(id: $id, transcription: $transcription, aiResponse: $aiResponse, grammarCorrections: $grammarCorrections, recordingDurationMs: $recordingDurationMs, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$TurnCopyWith<$Res> implements $TurnCopyWith<$Res> {
  factory _$TurnCopyWith(_Turn value, $Res Function(_Turn) _then) = __$TurnCopyWithImpl;
@override @useResult
$Res call({
 String id, String transcription, String aiResponse, List<GrammarCorrection> grammarCorrections, int recordingDurationMs, DateTime timestamp
});




}
/// @nodoc
class __$TurnCopyWithImpl<$Res>
    implements _$TurnCopyWith<$Res> {
  __$TurnCopyWithImpl(this._self, this._then);

  final _Turn _self;
  final $Res Function(_Turn) _then;

/// Create a copy of Turn
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transcription = null,Object? aiResponse = null,Object? grammarCorrections = null,Object? recordingDurationMs = null,Object? timestamp = null,}) {
  return _then(_Turn(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,transcription: null == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String,aiResponse: null == aiResponse ? _self.aiResponse : aiResponse // ignore: cast_nullable_to_non_nullable
as String,grammarCorrections: null == grammarCorrections ? _self._grammarCorrections : grammarCorrections // ignore: cast_nullable_to_non_nullable
as List<GrammarCorrection>,recordingDurationMs: null == recordingDurationMs ? _self.recordingDurationMs : recordingDurationMs // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
