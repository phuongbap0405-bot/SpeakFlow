// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationEvent()';
}


}

/// @nodoc
class $ConversationEventCopyWith<$Res>  {
$ConversationEventCopyWith(ConversationEvent _, $Res Function(ConversationEvent) __);
}


/// Adds pattern-matching-related methods to [ConversationEvent].
extension ConversationEventPatterns on ConversationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RecordingStarted value)?  recordingStarted,TResult Function( RecordingStopped value)?  recordingStopped,TResult Function( TranscriptionRequested value)?  transcriptionRequested,TResult Function( ResponseRequested value)?  responseRequested,TResult Function( TtsCompleted value)?  ttsCompleted,TResult Function( TtsErrorOccurred value)?  ttsErrorOccurred,TResult Function( CorrectionsOpened value)?  correctionsOpened,TResult Function( CorrectionsDismissed value)?  correctionsDismissed,TResult Function( SessionEnded value)?  sessionEnded,TResult Function( RecordingTick value)?  recordingTick,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RecordingStarted() when recordingStarted != null:
return recordingStarted(_that);case RecordingStopped() when recordingStopped != null:
return recordingStopped(_that);case TranscriptionRequested() when transcriptionRequested != null:
return transcriptionRequested(_that);case ResponseRequested() when responseRequested != null:
return responseRequested(_that);case TtsCompleted() when ttsCompleted != null:
return ttsCompleted(_that);case TtsErrorOccurred() when ttsErrorOccurred != null:
return ttsErrorOccurred(_that);case CorrectionsOpened() when correctionsOpened != null:
return correctionsOpened(_that);case CorrectionsDismissed() when correctionsDismissed != null:
return correctionsDismissed(_that);case SessionEnded() when sessionEnded != null:
return sessionEnded(_that);case RecordingTick() when recordingTick != null:
return recordingTick(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RecordingStarted value)  recordingStarted,required TResult Function( RecordingStopped value)  recordingStopped,required TResult Function( TranscriptionRequested value)  transcriptionRequested,required TResult Function( ResponseRequested value)  responseRequested,required TResult Function( TtsCompleted value)  ttsCompleted,required TResult Function( TtsErrorOccurred value)  ttsErrorOccurred,required TResult Function( CorrectionsOpened value)  correctionsOpened,required TResult Function( CorrectionsDismissed value)  correctionsDismissed,required TResult Function( SessionEnded value)  sessionEnded,required TResult Function( RecordingTick value)  recordingTick,}){
final _that = this;
switch (_that) {
case RecordingStarted():
return recordingStarted(_that);case RecordingStopped():
return recordingStopped(_that);case TranscriptionRequested():
return transcriptionRequested(_that);case ResponseRequested():
return responseRequested(_that);case TtsCompleted():
return ttsCompleted(_that);case TtsErrorOccurred():
return ttsErrorOccurred(_that);case CorrectionsOpened():
return correctionsOpened(_that);case CorrectionsDismissed():
return correctionsDismissed(_that);case SessionEnded():
return sessionEnded(_that);case RecordingTick():
return recordingTick(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RecordingStarted value)?  recordingStarted,TResult? Function( RecordingStopped value)?  recordingStopped,TResult? Function( TranscriptionRequested value)?  transcriptionRequested,TResult? Function( ResponseRequested value)?  responseRequested,TResult? Function( TtsCompleted value)?  ttsCompleted,TResult? Function( TtsErrorOccurred value)?  ttsErrorOccurred,TResult? Function( CorrectionsOpened value)?  correctionsOpened,TResult? Function( CorrectionsDismissed value)?  correctionsDismissed,TResult? Function( SessionEnded value)?  sessionEnded,TResult? Function( RecordingTick value)?  recordingTick,}){
final _that = this;
switch (_that) {
case RecordingStarted() when recordingStarted != null:
return recordingStarted(_that);case RecordingStopped() when recordingStopped != null:
return recordingStopped(_that);case TranscriptionRequested() when transcriptionRequested != null:
return transcriptionRequested(_that);case ResponseRequested() when responseRequested != null:
return responseRequested(_that);case TtsCompleted() when ttsCompleted != null:
return ttsCompleted(_that);case TtsErrorOccurred() when ttsErrorOccurred != null:
return ttsErrorOccurred(_that);case CorrectionsOpened() when correctionsOpened != null:
return correctionsOpened(_that);case CorrectionsDismissed() when correctionsDismissed != null:
return correctionsDismissed(_that);case SessionEnded() when sessionEnded != null:
return sessionEnded(_that);case RecordingTick() when recordingTick != null:
return recordingTick(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  recordingStarted,TResult Function()?  recordingStopped,TResult Function( String audioPath)?  transcriptionRequested,TResult Function( String transcription)?  responseRequested,TResult Function()?  ttsCompleted,TResult Function()?  ttsErrorOccurred,TResult Function( String turnId)?  correctionsOpened,TResult Function()?  correctionsDismissed,TResult Function()?  sessionEnded,TResult Function( Duration elapsed)?  recordingTick,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RecordingStarted() when recordingStarted != null:
return recordingStarted();case RecordingStopped() when recordingStopped != null:
return recordingStopped();case TranscriptionRequested() when transcriptionRequested != null:
return transcriptionRequested(_that.audioPath);case ResponseRequested() when responseRequested != null:
return responseRequested(_that.transcription);case TtsCompleted() when ttsCompleted != null:
return ttsCompleted();case TtsErrorOccurred() when ttsErrorOccurred != null:
return ttsErrorOccurred();case CorrectionsOpened() when correctionsOpened != null:
return correctionsOpened(_that.turnId);case CorrectionsDismissed() when correctionsDismissed != null:
return correctionsDismissed();case SessionEnded() when sessionEnded != null:
return sessionEnded();case RecordingTick() when recordingTick != null:
return recordingTick(_that.elapsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  recordingStarted,required TResult Function()  recordingStopped,required TResult Function( String audioPath)  transcriptionRequested,required TResult Function( String transcription)  responseRequested,required TResult Function()  ttsCompleted,required TResult Function()  ttsErrorOccurred,required TResult Function( String turnId)  correctionsOpened,required TResult Function()  correctionsDismissed,required TResult Function()  sessionEnded,required TResult Function( Duration elapsed)  recordingTick,}) {final _that = this;
switch (_that) {
case RecordingStarted():
return recordingStarted();case RecordingStopped():
return recordingStopped();case TranscriptionRequested():
return transcriptionRequested(_that.audioPath);case ResponseRequested():
return responseRequested(_that.transcription);case TtsCompleted():
return ttsCompleted();case TtsErrorOccurred():
return ttsErrorOccurred();case CorrectionsOpened():
return correctionsOpened(_that.turnId);case CorrectionsDismissed():
return correctionsDismissed();case SessionEnded():
return sessionEnded();case RecordingTick():
return recordingTick(_that.elapsed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  recordingStarted,TResult? Function()?  recordingStopped,TResult? Function( String audioPath)?  transcriptionRequested,TResult? Function( String transcription)?  responseRequested,TResult? Function()?  ttsCompleted,TResult? Function()?  ttsErrorOccurred,TResult? Function( String turnId)?  correctionsOpened,TResult? Function()?  correctionsDismissed,TResult? Function()?  sessionEnded,TResult? Function( Duration elapsed)?  recordingTick,}) {final _that = this;
switch (_that) {
case RecordingStarted() when recordingStarted != null:
return recordingStarted();case RecordingStopped() when recordingStopped != null:
return recordingStopped();case TranscriptionRequested() when transcriptionRequested != null:
return transcriptionRequested(_that.audioPath);case ResponseRequested() when responseRequested != null:
return responseRequested(_that.transcription);case TtsCompleted() when ttsCompleted != null:
return ttsCompleted();case TtsErrorOccurred() when ttsErrorOccurred != null:
return ttsErrorOccurred();case CorrectionsOpened() when correctionsOpened != null:
return correctionsOpened(_that.turnId);case CorrectionsDismissed() when correctionsDismissed != null:
return correctionsDismissed();case SessionEnded() when sessionEnded != null:
return sessionEnded();case RecordingTick() when recordingTick != null:
return recordingTick(_that.elapsed);case _:
  return null;

}
}

}

/// @nodoc


class RecordingStarted implements ConversationEvent {
  const RecordingStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecordingStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationEvent.recordingStarted()';
}


}




/// @nodoc


class RecordingStopped implements ConversationEvent {
  const RecordingStopped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecordingStopped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationEvent.recordingStopped()';
}


}




/// @nodoc


class TranscriptionRequested implements ConversationEvent {
  const TranscriptionRequested(this.audioPath);
  

 final  String audioPath;

/// Create a copy of ConversationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranscriptionRequestedCopyWith<TranscriptionRequested> get copyWith => _$TranscriptionRequestedCopyWithImpl<TranscriptionRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranscriptionRequested&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath));
}


@override
int get hashCode => Object.hash(runtimeType,audioPath);

@override
String toString() {
  return 'ConversationEvent.transcriptionRequested(audioPath: $audioPath)';
}


}

/// @nodoc
abstract mixin class $TranscriptionRequestedCopyWith<$Res> implements $ConversationEventCopyWith<$Res> {
  factory $TranscriptionRequestedCopyWith(TranscriptionRequested value, $Res Function(TranscriptionRequested) _then) = _$TranscriptionRequestedCopyWithImpl;
@useResult
$Res call({
 String audioPath
});




}
/// @nodoc
class _$TranscriptionRequestedCopyWithImpl<$Res>
    implements $TranscriptionRequestedCopyWith<$Res> {
  _$TranscriptionRequestedCopyWithImpl(this._self, this._then);

  final TranscriptionRequested _self;
  final $Res Function(TranscriptionRequested) _then;

/// Create a copy of ConversationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? audioPath = null,}) {
  return _then(TranscriptionRequested(
null == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResponseRequested implements ConversationEvent {
  const ResponseRequested(this.transcription);
  

 final  String transcription;

/// Create a copy of ConversationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseRequestedCopyWith<ResponseRequested> get copyWith => _$ResponseRequestedCopyWithImpl<ResponseRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseRequested&&(identical(other.transcription, transcription) || other.transcription == transcription));
}


@override
int get hashCode => Object.hash(runtimeType,transcription);

@override
String toString() {
  return 'ConversationEvent.responseRequested(transcription: $transcription)';
}


}

/// @nodoc
abstract mixin class $ResponseRequestedCopyWith<$Res> implements $ConversationEventCopyWith<$Res> {
  factory $ResponseRequestedCopyWith(ResponseRequested value, $Res Function(ResponseRequested) _then) = _$ResponseRequestedCopyWithImpl;
@useResult
$Res call({
 String transcription
});




}
/// @nodoc
class _$ResponseRequestedCopyWithImpl<$Res>
    implements $ResponseRequestedCopyWith<$Res> {
  _$ResponseRequestedCopyWithImpl(this._self, this._then);

  final ResponseRequested _self;
  final $Res Function(ResponseRequested) _then;

/// Create a copy of ConversationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transcription = null,}) {
  return _then(ResponseRequested(
null == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TtsCompleted implements ConversationEvent {
  const TtsCompleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TtsCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationEvent.ttsCompleted()';
}


}




/// @nodoc


class TtsErrorOccurred implements ConversationEvent {
  const TtsErrorOccurred();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TtsErrorOccurred);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationEvent.ttsErrorOccurred()';
}


}




/// @nodoc


class CorrectionsOpened implements ConversationEvent {
  const CorrectionsOpened(this.turnId);
  

 final  String turnId;

/// Create a copy of ConversationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CorrectionsOpenedCopyWith<CorrectionsOpened> get copyWith => _$CorrectionsOpenedCopyWithImpl<CorrectionsOpened>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CorrectionsOpened&&(identical(other.turnId, turnId) || other.turnId == turnId));
}


@override
int get hashCode => Object.hash(runtimeType,turnId);

@override
String toString() {
  return 'ConversationEvent.correctionsOpened(turnId: $turnId)';
}


}

/// @nodoc
abstract mixin class $CorrectionsOpenedCopyWith<$Res> implements $ConversationEventCopyWith<$Res> {
  factory $CorrectionsOpenedCopyWith(CorrectionsOpened value, $Res Function(CorrectionsOpened) _then) = _$CorrectionsOpenedCopyWithImpl;
@useResult
$Res call({
 String turnId
});




}
/// @nodoc
class _$CorrectionsOpenedCopyWithImpl<$Res>
    implements $CorrectionsOpenedCopyWith<$Res> {
  _$CorrectionsOpenedCopyWithImpl(this._self, this._then);

  final CorrectionsOpened _self;
  final $Res Function(CorrectionsOpened) _then;

/// Create a copy of ConversationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? turnId = null,}) {
  return _then(CorrectionsOpened(
null == turnId ? _self.turnId : turnId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CorrectionsDismissed implements ConversationEvent {
  const CorrectionsDismissed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CorrectionsDismissed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationEvent.correctionsDismissed()';
}


}




/// @nodoc


class SessionEnded implements ConversationEvent {
  const SessionEnded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEnded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationEvent.sessionEnded()';
}


}




/// @nodoc


class RecordingTick implements ConversationEvent {
  const RecordingTick(this.elapsed);
  

 final  Duration elapsed;

/// Create a copy of ConversationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecordingTickCopyWith<RecordingTick> get copyWith => _$RecordingTickCopyWithImpl<RecordingTick>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecordingTick&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed));
}


@override
int get hashCode => Object.hash(runtimeType,elapsed);

@override
String toString() {
  return 'ConversationEvent.recordingTick(elapsed: $elapsed)';
}


}

/// @nodoc
abstract mixin class $RecordingTickCopyWith<$Res> implements $ConversationEventCopyWith<$Res> {
  factory $RecordingTickCopyWith(RecordingTick value, $Res Function(RecordingTick) _then) = _$RecordingTickCopyWithImpl;
@useResult
$Res call({
 Duration elapsed
});




}
/// @nodoc
class _$RecordingTickCopyWithImpl<$Res>
    implements $RecordingTickCopyWith<$Res> {
  _$RecordingTickCopyWithImpl(this._self, this._then);

  final RecordingTick _self;
  final $Res Function(RecordingTick) _then;

/// Create a copy of ConversationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? elapsed = null,}) {
  return _then(RecordingTick(
null == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
