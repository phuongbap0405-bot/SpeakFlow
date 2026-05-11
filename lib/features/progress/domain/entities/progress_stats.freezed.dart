// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgressStats {

 int get sessionsCompleted; int get totalSpeakingTimeSeconds; int get currentStreakDays;/// ISO-8601 date of the last completed session (nullable).
 DateTime? get lastSessionDate;
/// Create a copy of ProgressStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressStatsCopyWith<ProgressStats> get copyWith => _$ProgressStatsCopyWithImpl<ProgressStats>(this as ProgressStats, _$identity);

  /// Serializes this ProgressStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressStats&&(identical(other.sessionsCompleted, sessionsCompleted) || other.sessionsCompleted == sessionsCompleted)&&(identical(other.totalSpeakingTimeSeconds, totalSpeakingTimeSeconds) || other.totalSpeakingTimeSeconds == totalSpeakingTimeSeconds)&&(identical(other.currentStreakDays, currentStreakDays) || other.currentStreakDays == currentStreakDays)&&(identical(other.lastSessionDate, lastSessionDate) || other.lastSessionDate == lastSessionDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionsCompleted,totalSpeakingTimeSeconds,currentStreakDays,lastSessionDate);

@override
String toString() {
  return 'ProgressStats(sessionsCompleted: $sessionsCompleted, totalSpeakingTimeSeconds: $totalSpeakingTimeSeconds, currentStreakDays: $currentStreakDays, lastSessionDate: $lastSessionDate)';
}


}

/// @nodoc
abstract mixin class $ProgressStatsCopyWith<$Res>  {
  factory $ProgressStatsCopyWith(ProgressStats value, $Res Function(ProgressStats) _then) = _$ProgressStatsCopyWithImpl;
@useResult
$Res call({
 int sessionsCompleted, int totalSpeakingTimeSeconds, int currentStreakDays, DateTime? lastSessionDate
});




}
/// @nodoc
class _$ProgressStatsCopyWithImpl<$Res>
    implements $ProgressStatsCopyWith<$Res> {
  _$ProgressStatsCopyWithImpl(this._self, this._then);

  final ProgressStats _self;
  final $Res Function(ProgressStats) _then;

/// Create a copy of ProgressStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionsCompleted = null,Object? totalSpeakingTimeSeconds = null,Object? currentStreakDays = null,Object? lastSessionDate = freezed,}) {
  return _then(_self.copyWith(
sessionsCompleted: null == sessionsCompleted ? _self.sessionsCompleted : sessionsCompleted // ignore: cast_nullable_to_non_nullable
as int,totalSpeakingTimeSeconds: null == totalSpeakingTimeSeconds ? _self.totalSpeakingTimeSeconds : totalSpeakingTimeSeconds // ignore: cast_nullable_to_non_nullable
as int,currentStreakDays: null == currentStreakDays ? _self.currentStreakDays : currentStreakDays // ignore: cast_nullable_to_non_nullable
as int,lastSessionDate: freezed == lastSessionDate ? _self.lastSessionDate : lastSessionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgressStats].
extension ProgressStatsPatterns on ProgressStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressStats value)  $default,){
final _that = this;
switch (_that) {
case _ProgressStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressStats value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sessionsCompleted,  int totalSpeakingTimeSeconds,  int currentStreakDays,  DateTime? lastSessionDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressStats() when $default != null:
return $default(_that.sessionsCompleted,_that.totalSpeakingTimeSeconds,_that.currentStreakDays,_that.lastSessionDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sessionsCompleted,  int totalSpeakingTimeSeconds,  int currentStreakDays,  DateTime? lastSessionDate)  $default,) {final _that = this;
switch (_that) {
case _ProgressStats():
return $default(_that.sessionsCompleted,_that.totalSpeakingTimeSeconds,_that.currentStreakDays,_that.lastSessionDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sessionsCompleted,  int totalSpeakingTimeSeconds,  int currentStreakDays,  DateTime? lastSessionDate)?  $default,) {final _that = this;
switch (_that) {
case _ProgressStats() when $default != null:
return $default(_that.sessionsCompleted,_that.totalSpeakingTimeSeconds,_that.currentStreakDays,_that.lastSessionDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgressStats implements ProgressStats {
  const _ProgressStats({required this.sessionsCompleted, required this.totalSpeakingTimeSeconds, required this.currentStreakDays, this.lastSessionDate});
  factory _ProgressStats.fromJson(Map<String, dynamic> json) => _$ProgressStatsFromJson(json);

@override final  int sessionsCompleted;
@override final  int totalSpeakingTimeSeconds;
@override final  int currentStreakDays;
/// ISO-8601 date of the last completed session (nullable).
@override final  DateTime? lastSessionDate;

/// Create a copy of ProgressStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressStatsCopyWith<_ProgressStats> get copyWith => __$ProgressStatsCopyWithImpl<_ProgressStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgressStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressStats&&(identical(other.sessionsCompleted, sessionsCompleted) || other.sessionsCompleted == sessionsCompleted)&&(identical(other.totalSpeakingTimeSeconds, totalSpeakingTimeSeconds) || other.totalSpeakingTimeSeconds == totalSpeakingTimeSeconds)&&(identical(other.currentStreakDays, currentStreakDays) || other.currentStreakDays == currentStreakDays)&&(identical(other.lastSessionDate, lastSessionDate) || other.lastSessionDate == lastSessionDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionsCompleted,totalSpeakingTimeSeconds,currentStreakDays,lastSessionDate);

@override
String toString() {
  return 'ProgressStats(sessionsCompleted: $sessionsCompleted, totalSpeakingTimeSeconds: $totalSpeakingTimeSeconds, currentStreakDays: $currentStreakDays, lastSessionDate: $lastSessionDate)';
}


}

/// @nodoc
abstract mixin class _$ProgressStatsCopyWith<$Res> implements $ProgressStatsCopyWith<$Res> {
  factory _$ProgressStatsCopyWith(_ProgressStats value, $Res Function(_ProgressStats) _then) = __$ProgressStatsCopyWithImpl;
@override @useResult
$Res call({
 int sessionsCompleted, int totalSpeakingTimeSeconds, int currentStreakDays, DateTime? lastSessionDate
});




}
/// @nodoc
class __$ProgressStatsCopyWithImpl<$Res>
    implements _$ProgressStatsCopyWith<$Res> {
  __$ProgressStatsCopyWithImpl(this._self, this._then);

  final _ProgressStats _self;
  final $Res Function(_ProgressStats) _then;

/// Create a copy of ProgressStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionsCompleted = null,Object? totalSpeakingTimeSeconds = null,Object? currentStreakDays = null,Object? lastSessionDate = freezed,}) {
  return _then(_ProgressStats(
sessionsCompleted: null == sessionsCompleted ? _self.sessionsCompleted : sessionsCompleted // ignore: cast_nullable_to_non_nullable
as int,totalSpeakingTimeSeconds: null == totalSpeakingTimeSeconds ? _self.totalSpeakingTimeSeconds : totalSpeakingTimeSeconds // ignore: cast_nullable_to_non_nullable
as int,currentStreakDays: null == currentStreakDays ? _self.currentStreakDays : currentStreakDays // ignore: cast_nullable_to_non_nullable
as int,lastSessionDate: freezed == lastSessionDate ? _self.lastSessionDate : lastSessionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
