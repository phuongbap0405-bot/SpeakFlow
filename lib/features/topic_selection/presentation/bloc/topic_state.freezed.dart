// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopicState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicState()';
}


}

/// @nodoc
class $TopicStateCopyWith<$Res>  {
$TopicStateCopyWith(TopicState _, $Res Function(TopicState) __);
}


/// Adds pattern-matching-related methods to [TopicState].
extension TopicStatePatterns on TopicState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TopicInitial value)?  initial,TResult Function( TopicValid value)?  valid,TResult Function( TopicInvalid value)?  invalid,TResult Function( TopicStarting value)?  starting,TResult Function( TopicStarted value)?  started,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TopicInitial() when initial != null:
return initial(_that);case TopicValid() when valid != null:
return valid(_that);case TopicInvalid() when invalid != null:
return invalid(_that);case TopicStarting() when starting != null:
return starting(_that);case TopicStarted() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TopicInitial value)  initial,required TResult Function( TopicValid value)  valid,required TResult Function( TopicInvalid value)  invalid,required TResult Function( TopicStarting value)  starting,required TResult Function( TopicStarted value)  started,}){
final _that = this;
switch (_that) {
case TopicInitial():
return initial(_that);case TopicValid():
return valid(_that);case TopicInvalid():
return invalid(_that);case TopicStarting():
return starting(_that);case TopicStarted():
return started(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TopicInitial value)?  initial,TResult? Function( TopicValid value)?  valid,TResult? Function( TopicInvalid value)?  invalid,TResult? Function( TopicStarting value)?  starting,TResult? Function( TopicStarted value)?  started,}){
final _that = this;
switch (_that) {
case TopicInitial() when initial != null:
return initial(_that);case TopicValid() when valid != null:
return valid(_that);case TopicInvalid() when invalid != null:
return invalid(_that);case TopicStarting() when starting != null:
return starting(_that);case TopicStarted() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String topic)?  valid,TResult Function( String error)?  invalid,TResult Function()?  starting,TResult Function( Session session)?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TopicInitial() when initial != null:
return initial();case TopicValid() when valid != null:
return valid(_that.topic);case TopicInvalid() when invalid != null:
return invalid(_that.error);case TopicStarting() when starting != null:
return starting();case TopicStarted() when started != null:
return started(_that.session);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String topic)  valid,required TResult Function( String error)  invalid,required TResult Function()  starting,required TResult Function( Session session)  started,}) {final _that = this;
switch (_that) {
case TopicInitial():
return initial();case TopicValid():
return valid(_that.topic);case TopicInvalid():
return invalid(_that.error);case TopicStarting():
return starting();case TopicStarted():
return started(_that.session);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String topic)?  valid,TResult? Function( String error)?  invalid,TResult? Function()?  starting,TResult? Function( Session session)?  started,}) {final _that = this;
switch (_that) {
case TopicInitial() when initial != null:
return initial();case TopicValid() when valid != null:
return valid(_that.topic);case TopicInvalid() when invalid != null:
return invalid(_that.error);case TopicStarting() when starting != null:
return starting();case TopicStarted() when started != null:
return started(_that.session);case _:
  return null;

}
}

}

/// @nodoc


class TopicInitial implements TopicState {
  const TopicInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicState.initial()';
}


}




/// @nodoc


class TopicValid implements TopicState {
  const TopicValid(this.topic);
  

 final  String topic;

/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicValidCopyWith<TopicValid> get copyWith => _$TopicValidCopyWithImpl<TopicValid>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicValid&&(identical(other.topic, topic) || other.topic == topic));
}


@override
int get hashCode => Object.hash(runtimeType,topic);

@override
String toString() {
  return 'TopicState.valid(topic: $topic)';
}


}

/// @nodoc
abstract mixin class $TopicValidCopyWith<$Res> implements $TopicStateCopyWith<$Res> {
  factory $TopicValidCopyWith(TopicValid value, $Res Function(TopicValid) _then) = _$TopicValidCopyWithImpl;
@useResult
$Res call({
 String topic
});




}
/// @nodoc
class _$TopicValidCopyWithImpl<$Res>
    implements $TopicValidCopyWith<$Res> {
  _$TopicValidCopyWithImpl(this._self, this._then);

  final TopicValid _self;
  final $Res Function(TopicValid) _then;

/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? topic = null,}) {
  return _then(TopicValid(
null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TopicInvalid implements TopicState {
  const TopicInvalid(this.error);
  

 final  String error;

/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicInvalidCopyWith<TopicInvalid> get copyWith => _$TopicInvalidCopyWithImpl<TopicInvalid>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicInvalid&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'TopicState.invalid(error: $error)';
}


}

/// @nodoc
abstract mixin class $TopicInvalidCopyWith<$Res> implements $TopicStateCopyWith<$Res> {
  factory $TopicInvalidCopyWith(TopicInvalid value, $Res Function(TopicInvalid) _then) = _$TopicInvalidCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$TopicInvalidCopyWithImpl<$Res>
    implements $TopicInvalidCopyWith<$Res> {
  _$TopicInvalidCopyWithImpl(this._self, this._then);

  final TopicInvalid _self;
  final $Res Function(TopicInvalid) _then;

/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(TopicInvalid(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TopicStarting implements TopicState {
  const TopicStarting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicStarting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicState.starting()';
}


}




/// @nodoc


class TopicStarted implements TopicState {
  const TopicStarted(this.session);
  

 final  Session session;

/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicStartedCopyWith<TopicStarted> get copyWith => _$TopicStartedCopyWithImpl<TopicStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicStarted&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'TopicState.started(session: $session)';
}


}

/// @nodoc
abstract mixin class $TopicStartedCopyWith<$Res> implements $TopicStateCopyWith<$Res> {
  factory $TopicStartedCopyWith(TopicStarted value, $Res Function(TopicStarted) _then) = _$TopicStartedCopyWithImpl;
@useResult
$Res call({
 Session session
});


$SessionCopyWith<$Res> get session;

}
/// @nodoc
class _$TopicStartedCopyWithImpl<$Res>
    implements $TopicStartedCopyWith<$Res> {
  _$TopicStartedCopyWithImpl(this._self, this._then);

  final TopicStarted _self;
  final $Res Function(TopicStarted) _then;

/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(TopicStarted(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session,
  ));
}

/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res> get session {
  
  return $SessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
