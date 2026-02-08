// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_write_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GiftWriteRequest {

 int get price; String get giftDate; GiftType get giftType; Direction get direction; String? get description; int get friendId;
/// Create a copy of GiftWriteRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftWriteRequestCopyWith<GiftWriteRequest> get copyWith => _$GiftWriteRequestCopyWithImpl<GiftWriteRequest>(this as GiftWriteRequest, _$identity);

  /// Serializes this GiftWriteRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftWriteRequest&&(identical(other.price, price) || other.price == price)&&(identical(other.giftDate, giftDate) || other.giftDate == giftDate)&&(identical(other.giftType, giftType) || other.giftType == giftType)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.description, description) || other.description == description)&&(identical(other.friendId, friendId) || other.friendId == friendId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,giftDate,giftType,direction,description,friendId);

@override
String toString() {
  return 'GiftWriteRequest(price: $price, giftDate: $giftDate, giftType: $giftType, direction: $direction, description: $description, friendId: $friendId)';
}


}

/// @nodoc
abstract mixin class $GiftWriteRequestCopyWith<$Res>  {
  factory $GiftWriteRequestCopyWith(GiftWriteRequest value, $Res Function(GiftWriteRequest) _then) = _$GiftWriteRequestCopyWithImpl;
@useResult
$Res call({
 int price, String giftDate, GiftType giftType, Direction direction, String? description, int friendId
});




}
/// @nodoc
class _$GiftWriteRequestCopyWithImpl<$Res>
    implements $GiftWriteRequestCopyWith<$Res> {
  _$GiftWriteRequestCopyWithImpl(this._self, this._then);

  final GiftWriteRequest _self;
  final $Res Function(GiftWriteRequest) _then;

/// Create a copy of GiftWriteRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = null,Object? giftDate = null,Object? giftType = null,Object? direction = null,Object? description = freezed,Object? friendId = null,}) {
  return _then(_self.copyWith(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,giftDate: null == giftDate ? _self.giftDate : giftDate // ignore: cast_nullable_to_non_nullable
as String,giftType: null == giftType ? _self.giftType : giftType // ignore: cast_nullable_to_non_nullable
as GiftType,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,friendId: null == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftWriteRequest].
extension GiftWriteRequestPatterns on GiftWriteRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftWriteRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftWriteRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftWriteRequest value)  $default,){
final _that = this;
switch (_that) {
case _GiftWriteRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftWriteRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GiftWriteRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int price,  String giftDate,  GiftType giftType,  Direction direction,  String? description,  int friendId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftWriteRequest() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int price,  String giftDate,  GiftType giftType,  Direction direction,  String? description,  int friendId)  $default,) {final _that = this;
switch (_that) {
case _GiftWriteRequest():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int price,  String giftDate,  GiftType giftType,  Direction direction,  String? description,  int friendId)?  $default,) {final _that = this;
switch (_that) {
case _GiftWriteRequest() when $default != null:
return $default(_that.price,_that.giftDate,_that.giftType,_that.direction,_that.description,_that.friendId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftWriteRequest implements GiftWriteRequest {
  const _GiftWriteRequest({required this.price, required this.giftDate, required this.giftType, required this.direction, this.description, required this.friendId});
  factory _GiftWriteRequest.fromJson(Map<String, dynamic> json) => _$GiftWriteRequestFromJson(json);

@override final  int price;
@override final  String giftDate;
@override final  GiftType giftType;
@override final  Direction direction;
@override final  String? description;
@override final  int friendId;

/// Create a copy of GiftWriteRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftWriteRequestCopyWith<_GiftWriteRequest> get copyWith => __$GiftWriteRequestCopyWithImpl<_GiftWriteRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftWriteRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftWriteRequest&&(identical(other.price, price) || other.price == price)&&(identical(other.giftDate, giftDate) || other.giftDate == giftDate)&&(identical(other.giftType, giftType) || other.giftType == giftType)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.description, description) || other.description == description)&&(identical(other.friendId, friendId) || other.friendId == friendId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,giftDate,giftType,direction,description,friendId);

@override
String toString() {
  return 'GiftWriteRequest(price: $price, giftDate: $giftDate, giftType: $giftType, direction: $direction, description: $description, friendId: $friendId)';
}


}

/// @nodoc
abstract mixin class _$GiftWriteRequestCopyWith<$Res> implements $GiftWriteRequestCopyWith<$Res> {
  factory _$GiftWriteRequestCopyWith(_GiftWriteRequest value, $Res Function(_GiftWriteRequest) _then) = __$GiftWriteRequestCopyWithImpl;
@override @useResult
$Res call({
 int price, String giftDate, GiftType giftType, Direction direction, String? description, int friendId
});




}
/// @nodoc
class __$GiftWriteRequestCopyWithImpl<$Res>
    implements _$GiftWriteRequestCopyWith<$Res> {
  __$GiftWriteRequestCopyWithImpl(this._self, this._then);

  final _GiftWriteRequest _self;
  final $Res Function(_GiftWriteRequest) _then;

/// Create a copy of GiftWriteRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = null,Object? giftDate = null,Object? giftType = null,Object? direction = null,Object? description = freezed,Object? friendId = null,}) {
  return _then(_GiftWriteRequest(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,giftDate: null == giftDate ? _self.giftDate : giftDate // ignore: cast_nullable_to_non_nullable
as String,giftType: null == giftType ? _self.giftType : giftType // ignore: cast_nullable_to_non_nullable
as GiftType,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,friendId: null == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
