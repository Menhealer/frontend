// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_edit_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GiftEditRequest {

 int? get price; String? get giftDate; GiftType? get giftType; Direction? get direction; String? get description; int? get friendId;
/// Create a copy of GiftEditRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftEditRequestCopyWith<GiftEditRequest> get copyWith => _$GiftEditRequestCopyWithImpl<GiftEditRequest>(this as GiftEditRequest, _$identity);

  /// Serializes this GiftEditRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftEditRequest&&(identical(other.price, price) || other.price == price)&&(identical(other.giftDate, giftDate) || other.giftDate == giftDate)&&(identical(other.giftType, giftType) || other.giftType == giftType)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.description, description) || other.description == description)&&(identical(other.friendId, friendId) || other.friendId == friendId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,giftDate,giftType,direction,description,friendId);

@override
String toString() {
  return 'GiftEditRequest(price: $price, giftDate: $giftDate, giftType: $giftType, direction: $direction, description: $description, friendId: $friendId)';
}


}

/// @nodoc
abstract mixin class $GiftEditRequestCopyWith<$Res>  {
  factory $GiftEditRequestCopyWith(GiftEditRequest value, $Res Function(GiftEditRequest) _then) = _$GiftEditRequestCopyWithImpl;
@useResult
$Res call({
 int? price, String? giftDate, GiftType? giftType, Direction? direction, String? description, int? friendId
});




}
/// @nodoc
class _$GiftEditRequestCopyWithImpl<$Res>
    implements $GiftEditRequestCopyWith<$Res> {
  _$GiftEditRequestCopyWithImpl(this._self, this._then);

  final GiftEditRequest _self;
  final $Res Function(GiftEditRequest) _then;

/// Create a copy of GiftEditRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = freezed,Object? giftDate = freezed,Object? giftType = freezed,Object? direction = freezed,Object? description = freezed,Object? friendId = freezed,}) {
  return _then(_self.copyWith(
price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,giftDate: freezed == giftDate ? _self.giftDate : giftDate // ignore: cast_nullable_to_non_nullable
as String?,giftType: freezed == giftType ? _self.giftType : giftType // ignore: cast_nullable_to_non_nullable
as GiftType?,direction: freezed == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,friendId: freezed == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftEditRequest].
extension GiftEditRequestPatterns on GiftEditRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftEditRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftEditRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftEditRequest value)  $default,){
final _that = this;
switch (_that) {
case _GiftEditRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftEditRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GiftEditRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? price,  String? giftDate,  GiftType? giftType,  Direction? direction,  String? description,  int? friendId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftEditRequest() when $default != null:
return $default(_that.price,_that.giftDate,_that.giftType,_that.direction,_that.description,_that.friendId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? price,  String? giftDate,  GiftType? giftType,  Direction? direction,  String? description,  int? friendId)  $default,) {final _that = this;
switch (_that) {
case _GiftEditRequest():
return $default(_that.price,_that.giftDate,_that.giftType,_that.direction,_that.description,_that.friendId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? price,  String? giftDate,  GiftType? giftType,  Direction? direction,  String? description,  int? friendId)?  $default,) {final _that = this;
switch (_that) {
case _GiftEditRequest() when $default != null:
return $default(_that.price,_that.giftDate,_that.giftType,_that.direction,_that.description,_that.friendId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftEditRequest implements GiftEditRequest {
  const _GiftEditRequest({this.price, this.giftDate, this.giftType, this.direction, this.description, this.friendId});
  factory _GiftEditRequest.fromJson(Map<String, dynamic> json) => _$GiftEditRequestFromJson(json);

@override final  int? price;
@override final  String? giftDate;
@override final  GiftType? giftType;
@override final  Direction? direction;
@override final  String? description;
@override final  int? friendId;

/// Create a copy of GiftEditRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftEditRequestCopyWith<_GiftEditRequest> get copyWith => __$GiftEditRequestCopyWithImpl<_GiftEditRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftEditRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftEditRequest&&(identical(other.price, price) || other.price == price)&&(identical(other.giftDate, giftDate) || other.giftDate == giftDate)&&(identical(other.giftType, giftType) || other.giftType == giftType)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.description, description) || other.description == description)&&(identical(other.friendId, friendId) || other.friendId == friendId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,giftDate,giftType,direction,description,friendId);

@override
String toString() {
  return 'GiftEditRequest(price: $price, giftDate: $giftDate, giftType: $giftType, direction: $direction, description: $description, friendId: $friendId)';
}


}

/// @nodoc
abstract mixin class _$GiftEditRequestCopyWith<$Res> implements $GiftEditRequestCopyWith<$Res> {
  factory _$GiftEditRequestCopyWith(_GiftEditRequest value, $Res Function(_GiftEditRequest) _then) = __$GiftEditRequestCopyWithImpl;
@override @useResult
$Res call({
 int? price, String? giftDate, GiftType? giftType, Direction? direction, String? description, int? friendId
});




}
/// @nodoc
class __$GiftEditRequestCopyWithImpl<$Res>
    implements _$GiftEditRequestCopyWith<$Res> {
  __$GiftEditRequestCopyWithImpl(this._self, this._then);

  final _GiftEditRequest _self;
  final $Res Function(_GiftEditRequest) _then;

/// Create a copy of GiftEditRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = freezed,Object? giftDate = freezed,Object? giftType = freezed,Object? direction = freezed,Object? description = freezed,Object? friendId = freezed,}) {
  return _then(_GiftEditRequest(
price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,giftDate: freezed == giftDate ? _self.giftDate : giftDate // ignore: cast_nullable_to_non_nullable
as String?,giftType: freezed == giftType ? _self.giftType : giftType // ignore: cast_nullable_to_non_nullable
as GiftType?,direction: freezed == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,friendId: freezed == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
