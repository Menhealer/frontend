// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Day {

 String get date; List<EventDetail> get events; List<Friend> get birthdays;
/// Create a copy of Day
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayCopyWith<Day> get copyWith => _$DayCopyWithImpl<Day>(this as Day, _$identity);

  /// Serializes this Day to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Day&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.events, events)&&const DeepCollectionEquality().equals(other.birthdays, birthdays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(events),const DeepCollectionEquality().hash(birthdays));

@override
String toString() {
  return 'Day(date: $date, events: $events, birthdays: $birthdays)';
}


}

/// @nodoc
abstract mixin class $DayCopyWith<$Res>  {
  factory $DayCopyWith(Day value, $Res Function(Day) _then) = _$DayCopyWithImpl;
@useResult
$Res call({
 String date, List<EventDetail> events, List<Friend> birthdays
});




}
/// @nodoc
class _$DayCopyWithImpl<$Res>
    implements $DayCopyWith<$Res> {
  _$DayCopyWithImpl(this._self, this._then);

  final Day _self;
  final $Res Function(Day) _then;

/// Create a copy of Day
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? events = null,Object? birthdays = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<EventDetail>,birthdays: null == birthdays ? _self.birthdays : birthdays // ignore: cast_nullable_to_non_nullable
as List<Friend>,
  ));
}

}


/// Adds pattern-matching-related methods to [Day].
extension DayPatterns on Day {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Day value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Day() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Day value)  $default,){
final _that = this;
switch (_that) {
case _Day():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Day value)?  $default,){
final _that = this;
switch (_that) {
case _Day() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  List<EventDetail> events,  List<Friend> birthdays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Day() when $default != null:
return $default(_that.date,_that.events,_that.birthdays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  List<EventDetail> events,  List<Friend> birthdays)  $default,) {final _that = this;
switch (_that) {
case _Day():
return $default(_that.date,_that.events,_that.birthdays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  List<EventDetail> events,  List<Friend> birthdays)?  $default,) {final _that = this;
switch (_that) {
case _Day() when $default != null:
return $default(_that.date,_that.events,_that.birthdays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Day implements Day {
  const _Day({required this.date, required final  List<EventDetail> events, required final  List<Friend> birthdays}): _events = events,_birthdays = birthdays;
  factory _Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

@override final  String date;
 final  List<EventDetail> _events;
@override List<EventDetail> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}

 final  List<Friend> _birthdays;
@override List<Friend> get birthdays {
  if (_birthdays is EqualUnmodifiableListView) return _birthdays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_birthdays);
}


/// Create a copy of Day
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayCopyWith<_Day> get copyWith => __$DayCopyWithImpl<_Day>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Day&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._events, _events)&&const DeepCollectionEquality().equals(other._birthdays, _birthdays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_events),const DeepCollectionEquality().hash(_birthdays));

@override
String toString() {
  return 'Day(date: $date, events: $events, birthdays: $birthdays)';
}


}

/// @nodoc
abstract mixin class _$DayCopyWith<$Res> implements $DayCopyWith<$Res> {
  factory _$DayCopyWith(_Day value, $Res Function(_Day) _then) = __$DayCopyWithImpl;
@override @useResult
$Res call({
 String date, List<EventDetail> events, List<Friend> birthdays
});




}
/// @nodoc
class __$DayCopyWithImpl<$Res>
    implements _$DayCopyWith<$Res> {
  __$DayCopyWithImpl(this._self, this._then);

  final _Day _self;
  final $Res Function(_Day) _then;

/// Create a copy of Day
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? events = null,Object? birthdays = null,}) {
  return _then(_Day(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<EventDetail>,birthdays: null == birthdays ? _self._birthdays : birthdays // ignore: cast_nullable_to_non_nullable
as List<Friend>,
  ));
}


}

// dart format on
