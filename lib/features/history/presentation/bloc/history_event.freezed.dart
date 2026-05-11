// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryEvent()';
}


}

/// @nodoc
class $HistoryEventCopyWith<$Res>  {
$HistoryEventCopyWith(HistoryEvent _, $Res Function(HistoryEvent) __);
}


/// Adds pattern-matching-related methods to [HistoryEvent].
extension HistoryEventPatterns on HistoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadHistory value)?  loadHistory,TResult Function( SessionSelected value)?  sessionSelected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadHistory() when loadHistory != null:
return loadHistory(_that);case SessionSelected() when sessionSelected != null:
return sessionSelected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadHistory value)  loadHistory,required TResult Function( SessionSelected value)  sessionSelected,}){
final _that = this;
switch (_that) {
case LoadHistory():
return loadHistory(_that);case SessionSelected():
return sessionSelected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadHistory value)?  loadHistory,TResult? Function( SessionSelected value)?  sessionSelected,}){
final _that = this;
switch (_that) {
case LoadHistory() when loadHistory != null:
return loadHistory(_that);case SessionSelected() when sessionSelected != null:
return sessionSelected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadHistory,TResult Function( String id)?  sessionSelected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadHistory() when loadHistory != null:
return loadHistory();case SessionSelected() when sessionSelected != null:
return sessionSelected(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadHistory,required TResult Function( String id)  sessionSelected,}) {final _that = this;
switch (_that) {
case LoadHistory():
return loadHistory();case SessionSelected():
return sessionSelected(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadHistory,TResult? Function( String id)?  sessionSelected,}) {final _that = this;
switch (_that) {
case LoadHistory() when loadHistory != null:
return loadHistory();case SessionSelected() when sessionSelected != null:
return sessionSelected(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class LoadHistory implements HistoryEvent {
  const LoadHistory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadHistory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryEvent.loadHistory()';
}


}




/// @nodoc


class SessionSelected implements HistoryEvent {
  const SessionSelected(this.id);
  

 final  String id;

/// Create a copy of HistoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionSelectedCopyWith<SessionSelected> get copyWith => _$SessionSelectedCopyWithImpl<SessionSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionSelected&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'HistoryEvent.sessionSelected(id: $id)';
}


}

/// @nodoc
abstract mixin class $SessionSelectedCopyWith<$Res> implements $HistoryEventCopyWith<$Res> {
  factory $SessionSelectedCopyWith(SessionSelected value, $Res Function(SessionSelected) _then) = _$SessionSelectedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$SessionSelectedCopyWithImpl<$Res>
    implements $SessionSelectedCopyWith<$Res> {
  _$SessionSelectedCopyWithImpl(this._self, this._then);

  final SessionSelected _self;
  final $Res Function(SessionSelected) _then;

/// Create a copy of HistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(SessionSelected(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
