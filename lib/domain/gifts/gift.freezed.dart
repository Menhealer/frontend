// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Gift {

 int get giftId; int get price; String get giftDate; GiftType get giftType; Direction get direction; String? get description;
/// Create a copy of Gift
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftCopyWith<Gift> get copyWith => _$GiftCopyWithImpl<Gift>(this as Gift, _$identity);

  /// Serializes this Gift to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Gift&&(identical(other.giftId, giftId) || other.giftId == giftId)&&(identical(other.price, price) || other.price == price)&&(identical(other.giftDate, giftDate) || other.giftDate == giftDate)&&(identical(other.giftType, giftType) || other.giftType == giftType)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,giftId,price,giftDate,giftType,direction,description);

@override
String toString() {
  return 'Gift(giftId: $giftId, price: $price, giftDate: $giftDate, giftType: $giftType, direction: $direction, description: $description)';
}


}

/// @nodoc
abstract mixin class $GiftCopyWith<$Res>  {
  factory $GiftCopyWith(Gift value, $Res Function(Gift) _then) = _$GiftCopyWithImpl;
@useResult
$Res call({
 int giftId, int price, String giftDate, GiftType giftType, Direction direction, String? description
});




}
/// @nodoc
class _$GiftCopyWithImpl<$Res>
    implements $GiftCopyWith<$Res> {
  _$GiftCopyWithImpl(this._self, this._then);

  final Gift _self;
  final $Res Function(Gift) _then;

/// Create a copy of Gift
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? giftId = null,Object? price = null,Object? giftDate = null,Object? giftType = null,Object? direction = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
giftId: null == giftId ? _self.giftId : giftId // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,giftDate: null == giftDate ? _self.giftDate : giftDate // ignore: cast_nullable_to_non_nullable
as String,giftType: null == giftType ? _self.giftType : giftType // ignore: cast_nullable_to_non_nullable
as GiftType,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Gift].
extension GiftPatterns on Gift {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Gift value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Gift() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Gift value)  $default,){
final _that = this;
switch (_that) {
case _Gift():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Gift value)?  $default,){
final _that = this;
switch (_that) {
case _Gift() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int giftId,  int price,  String giftDate,  GiftType giftType,  Direction direction,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Gift() when $default != null:
return $default(_that.giftId,_that.price,_that.giftDate,_that.giftType,_that.direction,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int giftId,  int price,  String giftDate,  GiftType giftType,  Direction direction,  String? description)  $default,) {final _that = this;
switch (_that) {
case _Gift():
return $default(_that.giftId,_that.price,_that.giftDate,_that.giftType,_that.direction,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int giftId,  int price,  String giftDate,  GiftType giftType,  Direction direction,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _Gift() when $default != null:
return $default(_that.giftId,_that.price,_that.giftDate,_that.giftType,_that.direction,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Gift implements Gift {
  const _Gift({required this.giftId, required this.price, required this.giftDate, required this.giftType, required this.direction, this.description});
  factory _Gift.fromJson(Map<String, dynamic> json) => _$GiftFromJson(json);

@override final  int giftId;
@override final  int price;
@override final  String giftDate;
@override final  GiftType giftType;
@override final  Direction direction;
@override final  String? description;

/// Create a copy of Gift
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftCopyWith<_Gift> get copyWith => __$GiftCopyWithImpl<_Gift>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Gift&&(identical(other.giftId, giftId) || other.giftId == giftId)&&(identical(other.price, price) || other.price == price)&&(identical(other.giftDate, giftDate) || other.giftDate == giftDate)&&(identical(other.giftType, giftType) || other.giftType == giftType)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,giftId,price,giftDate,giftType,direction,description);

@override
String toString() {
  return 'Gift(giftId: $giftId, price: $price, giftDate: $giftDate, giftType: $giftType, direction: $direction, description: $description)';
}


}

/// @nodoc
abstract mixin class _$GiftCopyWith<$Res> implements $GiftCopyWith<$Res> {
  factory _$GiftCopyWith(_Gift value, $Res Function(_Gift) _then) = __$GiftCopyWithImpl;
@override @useResult
$Res call({
 int giftId, int price, String giftDate, GiftType giftType, Direction direction, String? description
});




}
/// @nodoc
class __$GiftCopyWithImpl<$Res>
    implements _$GiftCopyWith<$Res> {
  __$GiftCopyWithImpl(this._self, this._then);

  final _Gift _self;
  final $Res Function(_Gift) _then;

/// Create a copy of Gift
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? giftId = null,Object? price = null,Object? giftDate = null,Object? giftType = null,Object? direction = null,Object? description = freezed,}) {
  return _then(_Gift(
giftId: null == giftId ? _self.giftId : giftId // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,giftDate: null == giftDate ? _self.giftDate : giftDate // ignore: cast_nullable_to_non_nullable
as String,giftType: null == giftType ? _self.giftType : giftType // ignore: cast_nullable_to_non_nullable
as GiftType,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
