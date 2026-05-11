// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SttFailure value)?  sttError,TResult Function( LlmFailure value)?  llmError,TResult Function( TtsFailure value)?  ttsError,TResult Function( AudioRecordingFailure value)?  audioRecordingError,TResult Function( StorageFailure value)?  storageError,TResult Function( PermissionDeniedFailure value)?  permissionDenied,TResult Function( NetworkFailure value)?  networkError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SttFailure() when sttError != null:
return sttError(_that);case LlmFailure() when llmError != null:
return llmError(_that);case TtsFailure() when ttsError != null:
return ttsError(_that);case AudioRecordingFailure() when audioRecordingError != null:
return audioRecordingError(_that);case StorageFailure() when storageError != null:
return storageError(_that);case PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied(_that);case NetworkFailure() when networkError != null:
return networkError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SttFailure value)  sttError,required TResult Function( LlmFailure value)  llmError,required TResult Function( TtsFailure value)  ttsError,required TResult Function( AudioRecordingFailure value)  audioRecordingError,required TResult Function( StorageFailure value)  storageError,required TResult Function( PermissionDeniedFailure value)  permissionDenied,required TResult Function( NetworkFailure value)  networkError,}){
final _that = this;
switch (_that) {
case SttFailure():
return sttError(_that);case LlmFailure():
return llmError(_that);case TtsFailure():
return ttsError(_that);case AudioRecordingFailure():
return audioRecordingError(_that);case StorageFailure():
return storageError(_that);case PermissionDeniedFailure():
return permissionDenied(_that);case NetworkFailure():
return networkError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SttFailure value)?  sttError,TResult? Function( LlmFailure value)?  llmError,TResult? Function( TtsFailure value)?  ttsError,TResult? Function( AudioRecordingFailure value)?  audioRecordingError,TResult? Function( StorageFailure value)?  storageError,TResult? Function( PermissionDeniedFailure value)?  permissionDenied,TResult? Function( NetworkFailure value)?  networkError,}){
final _that = this;
switch (_that) {
case SttFailure() when sttError != null:
return sttError(_that);case LlmFailure() when llmError != null:
return llmError(_that);case TtsFailure() when ttsError != null:
return ttsError(_that);case AudioRecordingFailure() when audioRecordingError != null:
return audioRecordingError(_that);case StorageFailure() when storageError != null:
return storageError(_that);case PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied(_that);case NetworkFailure() when networkError != null:
return networkError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  sttError,TResult Function( String message)?  llmError,TResult Function( String message)?  ttsError,TResult Function( String message)?  audioRecordingError,TResult Function( String message)?  storageError,TResult Function()?  permissionDenied,TResult Function( String message)?  networkError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SttFailure() when sttError != null:
return sttError(_that.message);case LlmFailure() when llmError != null:
return llmError(_that.message);case TtsFailure() when ttsError != null:
return ttsError(_that.message);case AudioRecordingFailure() when audioRecordingError != null:
return audioRecordingError(_that.message);case StorageFailure() when storageError != null:
return storageError(_that.message);case PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied();case NetworkFailure() when networkError != null:
return networkError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  sttError,required TResult Function( String message)  llmError,required TResult Function( String message)  ttsError,required TResult Function( String message)  audioRecordingError,required TResult Function( String message)  storageError,required TResult Function()  permissionDenied,required TResult Function( String message)  networkError,}) {final _that = this;
switch (_that) {
case SttFailure():
return sttError(_that.message);case LlmFailure():
return llmError(_that.message);case TtsFailure():
return ttsError(_that.message);case AudioRecordingFailure():
return audioRecordingError(_that.message);case StorageFailure():
return storageError(_that.message);case PermissionDeniedFailure():
return permissionDenied();case NetworkFailure():
return networkError(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  sttError,TResult? Function( String message)?  llmError,TResult? Function( String message)?  ttsError,TResult? Function( String message)?  audioRecordingError,TResult? Function( String message)?  storageError,TResult? Function()?  permissionDenied,TResult? Function( String message)?  networkError,}) {final _that = this;
switch (_that) {
case SttFailure() when sttError != null:
return sttError(_that.message);case LlmFailure() when llmError != null:
return llmError(_that.message);case TtsFailure() when ttsError != null:
return ttsError(_that.message);case AudioRecordingFailure() when audioRecordingError != null:
return audioRecordingError(_that.message);case StorageFailure() when storageError != null:
return storageError(_that.message);case PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied();case NetworkFailure() when networkError != null:
return networkError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SttFailure implements Failure {
  const SttFailure(this.message);
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SttFailureCopyWith<SttFailure> get copyWith => _$SttFailureCopyWithImpl<SttFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SttFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.sttError(message: $message)';
}


}

/// @nodoc
abstract mixin class $SttFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $SttFailureCopyWith(SttFailure value, $Res Function(SttFailure) _then) = _$SttFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SttFailureCopyWithImpl<$Res>
    implements $SttFailureCopyWith<$Res> {
  _$SttFailureCopyWithImpl(this._self, this._then);

  final SttFailure _self;
  final $Res Function(SttFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SttFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LlmFailure implements Failure {
  const LlmFailure(this.message);
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LlmFailureCopyWith<LlmFailure> get copyWith => _$LlmFailureCopyWithImpl<LlmFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LlmFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.llmError(message: $message)';
}


}

/// @nodoc
abstract mixin class $LlmFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $LlmFailureCopyWith(LlmFailure value, $Res Function(LlmFailure) _then) = _$LlmFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LlmFailureCopyWithImpl<$Res>
    implements $LlmFailureCopyWith<$Res> {
  _$LlmFailureCopyWithImpl(this._self, this._then);

  final LlmFailure _self;
  final $Res Function(LlmFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LlmFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TtsFailure implements Failure {
  const TtsFailure(this.message);
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TtsFailureCopyWith<TtsFailure> get copyWith => _$TtsFailureCopyWithImpl<TtsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TtsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.ttsError(message: $message)';
}


}

/// @nodoc
abstract mixin class $TtsFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $TtsFailureCopyWith(TtsFailure value, $Res Function(TtsFailure) _then) = _$TtsFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TtsFailureCopyWithImpl<$Res>
    implements $TtsFailureCopyWith<$Res> {
  _$TtsFailureCopyWithImpl(this._self, this._then);

  final TtsFailure _self;
  final $Res Function(TtsFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TtsFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AudioRecordingFailure implements Failure {
  const AudioRecordingFailure(this.message);
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioRecordingFailureCopyWith<AudioRecordingFailure> get copyWith => _$AudioRecordingFailureCopyWithImpl<AudioRecordingFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioRecordingFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.audioRecordingError(message: $message)';
}


}

/// @nodoc
abstract mixin class $AudioRecordingFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $AudioRecordingFailureCopyWith(AudioRecordingFailure value, $Res Function(AudioRecordingFailure) _then) = _$AudioRecordingFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AudioRecordingFailureCopyWithImpl<$Res>
    implements $AudioRecordingFailureCopyWith<$Res> {
  _$AudioRecordingFailureCopyWithImpl(this._self, this._then);

  final AudioRecordingFailure _self;
  final $Res Function(AudioRecordingFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AudioRecordingFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StorageFailure implements Failure {
  const StorageFailure(this.message);
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorageFailureCopyWith<StorageFailure> get copyWith => _$StorageFailureCopyWithImpl<StorageFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorageFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.storageError(message: $message)';
}


}

/// @nodoc
abstract mixin class $StorageFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $StorageFailureCopyWith(StorageFailure value, $Res Function(StorageFailure) _then) = _$StorageFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$StorageFailureCopyWithImpl<$Res>
    implements $StorageFailureCopyWith<$Res> {
  _$StorageFailureCopyWithImpl(this._self, this._then);

  final StorageFailure _self;
  final $Res Function(StorageFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(StorageFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PermissionDeniedFailure implements Failure {
  const PermissionDeniedFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionDeniedFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.permissionDenied()';
}


}




/// @nodoc


class NetworkFailure implements Failure {
  const NetworkFailure(this.message);
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkFailureCopyWith<NetworkFailure> get copyWith => _$NetworkFailureCopyWithImpl<NetworkFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.networkError(message: $message)';
}


}

/// @nodoc
abstract mixin class $NetworkFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(NetworkFailure value, $Res Function(NetworkFailure) _then) = _$NetworkFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._self, this._then);

  final NetworkFailure _self;
  final $Res Function(NetworkFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NetworkFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
