// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopicEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicEvent()';
}


}

/// @nodoc
class $TopicEventCopyWith<$Res>  {
$TopicEventCopyWith(TopicEvent _, $Res Function(TopicEvent) __);
}


/// Adds pattern-matching-related methods to [TopicEvent].
extension TopicEventPatterns on TopicEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TopicSelected value)?  topicSelected,TResult Function( CustomTopicChanged value)?  customTopicChanged,TResult Function( SessionStartRequested value)?  sessionStartRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TopicSelected() when topicSelected != null:
return topicSelected(_that);case CustomTopicChanged() when customTopicChanged != null:
return customTopicChanged(_that);case SessionStartRequested() when sessionStartRequested != null:
return sessionStartRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TopicSelected value)  topicSelected,required TResult Function( CustomTopicChanged value)  customTopicChanged,required TResult Function( SessionStartRequested value)  sessionStartRequested,}){
final _that = this;
switch (_that) {
case TopicSelected():
return topicSelected(_that);case CustomTopicChanged():
return customTopicChanged(_that);case SessionStartRequested():
return sessionStartRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TopicSelected value)?  topicSelected,TResult? Function( CustomTopicChanged value)?  customTopicChanged,TResult? Function( SessionStartRequested value)?  sessionStartRequested,}){
final _that = this;
switch (_that) {
case TopicSelected() when topicSelected != null:
return topicSelected(_that);case CustomTopicChanged() when customTopicChanged != null:
return customTopicChanged(_that);case SessionStartRequested() when sessionStartRequested != null:
return sessionStartRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String topic)?  topicSelected,TResult Function( String text)?  customTopicChanged,TResult Function()?  sessionStartRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TopicSelected() when topicSelected != null:
return topicSelected(_that.topic);case CustomTopicChanged() when customTopicChanged != null:
return customTopicChanged(_that.text);case SessionStartRequested() when sessionStartRequested != null:
return sessionStartRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String topic)  topicSelected,required TResult Function( String text)  customTopicChanged,required TResult Function()  sessionStartRequested,}) {final _that = this;
switch (_that) {
case TopicSelected():
return topicSelected(_that.topic);case CustomTopicChanged():
return customTopicChanged(_that.text);case SessionStartRequested():
return sessionStartRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String topic)?  topicSelected,TResult? Function( String text)?  customTopicChanged,TResult? Function()?  sessionStartRequested,}) {final _that = this;
switch (_that) {
case TopicSelected() when topicSelected != null:
return topicSelected(_that.topic);case CustomTopicChanged() when customTopicChanged != null:
return customTopicChanged(_that.text);case SessionStartRequested() when sessionStartRequested != null:
return sessionStartRequested();case _:
  return null;

}
}

}

/// @nodoc


class TopicSelected implements TopicEvent {
  const TopicSelected(this.topic);
  

 final  String topic;

/// Create a copy of TopicEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicSelectedCopyWith<TopicSelected> get copyWith => _$TopicSelectedCopyWithImpl<TopicSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicSelected&&(identical(other.topic, topic) || other.topic == topic));
}


@override
int get hashCode => Object.hash(runtimeType,topic);

@override
String toString() {
  return 'TopicEvent.topicSelected(topic: $topic)';
}


}

/// @nodoc
abstract mixin class $TopicSelectedCopyWith<$Res> implements $TopicEventCopyWith<$Res> {
  factory $TopicSelectedCopyWith(TopicSelected value, $Res Function(TopicSelected) _then) = _$TopicSelectedCopyWithImpl;
@useResult
$Res call({
 String topic
});




}
/// @nodoc
class _$TopicSelectedCopyWithImpl<$Res>
    implements $TopicSelectedCopyWith<$Res> {
  _$TopicSelectedCopyWithImpl(this._self, this._then);

  final TopicSelected _self;
  final $Res Function(TopicSelected) _then;

/// Create a copy of TopicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? topic = null,}) {
  return _then(TopicSelected(
null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CustomTopicChanged implements TopicEvent {
  const CustomTopicChanged(this.text);
  

 final  String text;

/// Create a copy of TopicEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomTopicChangedCopyWith<CustomTopicChanged> get copyWith => _$CustomTopicChangedCopyWithImpl<CustomTopicChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomTopicChanged&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'TopicEvent.customTopicChanged(text: $text)';
}


}

/// @nodoc
abstract mixin class $CustomTopicChangedCopyWith<$Res> implements $TopicEventCopyWith<$Res> {
  factory $CustomTopicChangedCopyWith(CustomTopicChanged value, $Res Function(CustomTopicChanged) _then) = _$CustomTopicChangedCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$CustomTopicChangedCopyWithImpl<$Res>
    implements $CustomTopicChangedCopyWith<$Res> {
  _$CustomTopicChangedCopyWithImpl(this._self, this._then);

  final CustomTopicChanged _self;
  final $Res Function(CustomTopicChanged) _then;

/// Create a copy of TopicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(CustomTopicChanged(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SessionStartRequested implements TopicEvent {
  const SessionStartRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionStartRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicEvent.sessionStartRequested()';
}


}




// dart format on
