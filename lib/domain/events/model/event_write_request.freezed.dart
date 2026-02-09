// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_write_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventWriteRequest {

 String get title; String get eventDate; int get friendId; ReviewScore get reviewScore; String? get reviewText;
/// Create a copy of EventWriteRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventWriteRequestCopyWith<EventWriteRequest> get copyWith => _$EventWriteRequestCopyWithImpl<EventWriteRequest>(this as EventWriteRequest, _$identity);

  /// Serializes this EventWriteRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventWriteRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.friendId, friendId) || other.friendId == friendId)&&(identical(other.reviewScore, reviewScore) || other.reviewScore == reviewScore)&&(identical(other.reviewText, reviewText) || other.reviewText == reviewText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,eventDate,friendId,reviewScore,reviewText);

@override
String toString() {
  return 'EventWriteRequest(title: $title, eventDate: $eventDate, friendId: $friendId, reviewScore: $reviewScore, reviewText: $reviewText)';
}


}

/// @nodoc
abstract mixin class $EventWriteRequestCopyWith<$Res>  {
  factory $EventWriteRequestCopyWith(EventWriteRequest value, $Res Function(EventWriteRequest) _then) = _$EventWriteRequestCopyWithImpl;
@useResult
$Res call({
 String title, String eventDate, int friendId, ReviewScore reviewScore, String? reviewText
});




}
/// @nodoc
class _$EventWriteRequestCopyWithImpl<$Res>
    implements $EventWriteRequestCopyWith<$Res> {
  _$EventWriteRequestCopyWithImpl(this._self, this._then);

  final EventWriteRequest _self;
  final $Res Function(EventWriteRequest) _then;

/// Create a copy of EventWriteRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? eventDate = null,Object? friendId = null,Object? reviewScore = null,Object? reviewText = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,eventDate: null == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as String,friendId: null == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as int,reviewScore: null == reviewScore ? _self.reviewScore : reviewScore // ignore: cast_nullable_to_non_nullable
as ReviewScore,reviewText: freezed == reviewText ? _self.reviewText : reviewText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EventWriteRequest].
extension EventWriteRequestPatterns on EventWriteRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventWriteRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventWriteRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventWriteRequest value)  $default,){
final _that = this;
switch (_that) {
case _EventWriteRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventWriteRequest value)?  $default,){
final _that = this;
switch (_that) {
case _EventWriteRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String eventDate,  int friendId,  ReviewScore reviewScore,  String? reviewText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventWriteRequest() when $default != null:
return $default(_that.title,_that.eventDate,_that.friendId,_that.reviewScore,_that.reviewText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String eventDate,  int friendId,  ReviewScore reviewScore,  String? reviewText)  $default,) {final _that = this;
switch (_that) {
case _EventWriteRequest():
return $default(_that.title,_that.eventDate,_that.friendId,_that.reviewScore,_that.reviewText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String eventDate,  int friendId,  ReviewScore reviewScore,  String? reviewText)?  $default,) {final _that = this;
switch (_that) {
case _EventWriteRequest() when $default != null:
return $default(_that.title,_that.eventDate,_that.friendId,_that.reviewScore,_that.reviewText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventWriteRequest implements EventWriteRequest {
  const _EventWriteRequest({required this.title, required this.eventDate, required this.friendId, required this.reviewScore, this.reviewText});
  factory _EventWriteRequest.fromJson(Map<String, dynamic> json) => _$EventWriteRequestFromJson(json);

@override final  String title;
@override final  String eventDate;
@override final  int friendId;
@override final  ReviewScore reviewScore;
@override final  String? reviewText;

/// Create a copy of EventWriteRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventWriteRequestCopyWith<_EventWriteRequest> get copyWith => __$EventWriteRequestCopyWithImpl<_EventWriteRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventWriteRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventWriteRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.friendId, friendId) || other.friendId == friendId)&&(identical(other.reviewScore, reviewScore) || other.reviewScore == reviewScore)&&(identical(other.reviewText, reviewText) || other.reviewText == reviewText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,eventDate,friendId,reviewScore,reviewText);

@override
String toString() {
  return 'EventWriteRequest(title: $title, eventDate: $eventDate, friendId: $friendId, reviewScore: $reviewScore, reviewText: $reviewText)';
}


}

/// @nodoc
abstract mixin class _$EventWriteRequestCopyWith<$Res> implements $EventWriteRequestCopyWith<$Res> {
  factory _$EventWriteRequestCopyWith(_EventWriteRequest value, $Res Function(_EventWriteRequest) _then) = __$EventWriteRequestCopyWithImpl;
@override @useResult
$Res call({
 String title, String eventDate, int friendId, ReviewScore reviewScore, String? reviewText
});




}
/// @nodoc
class __$EventWriteRequestCopyWithImpl<$Res>
    implements _$EventWriteRequestCopyWith<$Res> {
  __$EventWriteRequestCopyWithImpl(this._self, this._then);

  final _EventWriteRequest _self;
  final $Res Function(_EventWriteRequest) _then;

/// Create a copy of EventWriteRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? eventDate = null,Object? friendId = null,Object? reviewScore = null,Object? reviewText = freezed,}) {
  return _then(_EventWriteRequest(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,eventDate: null == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as String,friendId: null == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as int,reviewScore: null == reviewScore ? _self.reviewScore : reviewScore // ignore: cast_nullable_to_non_nullable
as ReviewScore,reviewText: freezed == reviewText ? _self.reviewText : reviewText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
