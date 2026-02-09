// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_edit_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventEditRequest {

 String? get title; String? get eventDate; int? get friendId; ReviewScore? get reviewScore; String? get reviewText;
/// Create a copy of EventEditRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventEditRequestCopyWith<EventEditRequest> get copyWith => _$EventEditRequestCopyWithImpl<EventEditRequest>(this as EventEditRequest, _$identity);

  /// Serializes this EventEditRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventEditRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.friendId, friendId) || other.friendId == friendId)&&(identical(other.reviewScore, reviewScore) || other.reviewScore == reviewScore)&&(identical(other.reviewText, reviewText) || other.reviewText == reviewText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,eventDate,friendId,reviewScore,reviewText);

@override
String toString() {
  return 'EventEditRequest(title: $title, eventDate: $eventDate, friendId: $friendId, reviewScore: $reviewScore, reviewText: $reviewText)';
}


}

/// @nodoc
abstract mixin class $EventEditRequestCopyWith<$Res>  {
  factory $EventEditRequestCopyWith(EventEditRequest value, $Res Function(EventEditRequest) _then) = _$EventEditRequestCopyWithImpl;
@useResult
$Res call({
 String? title, String? eventDate, int? friendId, ReviewScore? reviewScore, String? reviewText
});




}
/// @nodoc
class _$EventEditRequestCopyWithImpl<$Res>
    implements $EventEditRequestCopyWith<$Res> {
  _$EventEditRequestCopyWithImpl(this._self, this._then);

  final EventEditRequest _self;
  final $Res Function(EventEditRequest) _then;

/// Create a copy of EventEditRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? eventDate = freezed,Object? friendId = freezed,Object? reviewScore = freezed,Object? reviewText = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,eventDate: freezed == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as String?,friendId: freezed == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as int?,reviewScore: freezed == reviewScore ? _self.reviewScore : reviewScore // ignore: cast_nullable_to_non_nullable
as ReviewScore?,reviewText: freezed == reviewText ? _self.reviewText : reviewText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EventEditRequest].
extension EventEditRequestPatterns on EventEditRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventEditRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventEditRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventEditRequest value)  $default,){
final _that = this;
switch (_that) {
case _EventEditRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventEditRequest value)?  $default,){
final _that = this;
switch (_that) {
case _EventEditRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? eventDate,  int? friendId,  ReviewScore? reviewScore,  String? reviewText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventEditRequest() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? eventDate,  int? friendId,  ReviewScore? reviewScore,  String? reviewText)  $default,) {final _that = this;
switch (_that) {
case _EventEditRequest():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? eventDate,  int? friendId,  ReviewScore? reviewScore,  String? reviewText)?  $default,) {final _that = this;
switch (_that) {
case _EventEditRequest() when $default != null:
return $default(_that.title,_that.eventDate,_that.friendId,_that.reviewScore,_that.reviewText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventEditRequest implements EventEditRequest {
  const _EventEditRequest({this.title, this.eventDate, this.friendId, this.reviewScore, this.reviewText});
  factory _EventEditRequest.fromJson(Map<String, dynamic> json) => _$EventEditRequestFromJson(json);

@override final  String? title;
@override final  String? eventDate;
@override final  int? friendId;
@override final  ReviewScore? reviewScore;
@override final  String? reviewText;

/// Create a copy of EventEditRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventEditRequestCopyWith<_EventEditRequest> get copyWith => __$EventEditRequestCopyWithImpl<_EventEditRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventEditRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventEditRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.friendId, friendId) || other.friendId == friendId)&&(identical(other.reviewScore, reviewScore) || other.reviewScore == reviewScore)&&(identical(other.reviewText, reviewText) || other.reviewText == reviewText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,eventDate,friendId,reviewScore,reviewText);

@override
String toString() {
  return 'EventEditRequest(title: $title, eventDate: $eventDate, friendId: $friendId, reviewScore: $reviewScore, reviewText: $reviewText)';
}


}

/// @nodoc
abstract mixin class _$EventEditRequestCopyWith<$Res> implements $EventEditRequestCopyWith<$Res> {
  factory _$EventEditRequestCopyWith(_EventEditRequest value, $Res Function(_EventEditRequest) _then) = __$EventEditRequestCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? eventDate, int? friendId, ReviewScore? reviewScore, String? reviewText
});




}
/// @nodoc
class __$EventEditRequestCopyWithImpl<$Res>
    implements _$EventEditRequestCopyWith<$Res> {
  __$EventEditRequestCopyWithImpl(this._self, this._then);

  final _EventEditRequest _self;
  final $Res Function(_EventEditRequest) _then;

/// Create a copy of EventEditRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? eventDate = freezed,Object? friendId = freezed,Object? reviewScore = freezed,Object? reviewText = freezed,}) {
  return _then(_EventEditRequest(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,eventDate: freezed == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as String?,friendId: freezed == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as int?,reviewScore: freezed == reviewScore ? _self.reviewScore : reviewScore // ignore: cast_nullable_to_non_nullable
as ReviewScore?,reviewText: freezed == reviewText ? _self.reviewText : reviewText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
