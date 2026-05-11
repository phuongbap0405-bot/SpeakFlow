// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgressState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgressState()';
}


}

/// @nodoc
class $ProgressStateCopyWith<$Res>  {
$ProgressStateCopyWith(ProgressState _, $Res Function(ProgressState) __);
}


/// Adds pattern-matching-related methods to [ProgressState].
extension ProgressStatePatterns on ProgressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProgressLoading value)?  loading,TResult Function( ProgressLoaded value)?  loaded,TResult Function( ProgressError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProgressLoading() when loading != null:
return loading(_that);case ProgressLoaded() when loaded != null:
return loaded(_that);case ProgressError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProgressLoading value)  loading,required TResult Function( ProgressLoaded value)  loaded,required TResult Function( ProgressError value)  error,}){
final _that = this;
switch (_that) {
case ProgressLoading():
return loading(_that);case ProgressLoaded():
return loaded(_that);case ProgressError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProgressLoading value)?  loading,TResult? Function( ProgressLoaded value)?  loaded,TResult? Function( ProgressError value)?  error,}){
final _that = this;
switch (_that) {
case ProgressLoading() when loading != null:
return loading(_that);case ProgressLoaded() when loaded != null:
return loaded(_that);case ProgressError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( ProgressStats stats)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProgressLoading() when loading != null:
return loading();case ProgressLoaded() when loaded != null:
return loaded(_that.stats);case ProgressError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( ProgressStats stats)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ProgressLoading():
return loading();case ProgressLoaded():
return loaded(_that.stats);case ProgressError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( ProgressStats stats)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ProgressLoading() when loading != null:
return loading();case ProgressLoaded() when loaded != null:
return loaded(_that.stats);case ProgressError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProgressLoading implements ProgressState {
  const ProgressLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgressState.loading()';
}


}




/// @nodoc


class ProgressLoaded implements ProgressState {
  const ProgressLoaded(this.stats);
  

 final  ProgressStats stats;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressLoadedCopyWith<ProgressLoaded> get copyWith => _$ProgressLoadedCopyWithImpl<ProgressLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressLoaded&&(identical(other.stats, stats) || other.stats == stats));
}


@override
int get hashCode => Object.hash(runtimeType,stats);

@override
String toString() {
  return 'ProgressState.loaded(stats: $stats)';
}


}

/// @nodoc
abstract mixin class $ProgressLoadedCopyWith<$Res> implements $ProgressStateCopyWith<$Res> {
  factory $ProgressLoadedCopyWith(ProgressLoaded value, $Res Function(ProgressLoaded) _then) = _$ProgressLoadedCopyWithImpl;
@useResult
$Res call({
 ProgressStats stats
});


$ProgressStatsCopyWith<$Res> get stats;

}
/// @nodoc
class _$ProgressLoadedCopyWithImpl<$Res>
    implements $ProgressLoadedCopyWith<$Res> {
  _$ProgressLoadedCopyWithImpl(this._self, this._then);

  final ProgressLoaded _self;
  final $Res Function(ProgressLoaded) _then;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stats = null,}) {
  return _then(ProgressLoaded(
null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as ProgressStats,
  ));
}

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgressStatsCopyWith<$Res> get stats {
  
  return $ProgressStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}

/// @nodoc


class ProgressError implements ProgressState {
  const ProgressError(this.message);
  

 final  String message;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressErrorCopyWith<ProgressError> get copyWith => _$ProgressErrorCopyWithImpl<ProgressError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProgressState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProgressErrorCopyWith<$Res> implements $ProgressStateCopyWith<$Res> {
  factory $ProgressErrorCopyWith(ProgressError value, $Res Function(ProgressError) _then) = _$ProgressErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProgressErrorCopyWithImpl<$Res>
    implements $ProgressErrorCopyWith<$Res> {
  _$ProgressErrorCopyWithImpl(this._self, this._then);

  final ProgressError _self;
  final $Res Function(ProgressError) _then;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProgressError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
