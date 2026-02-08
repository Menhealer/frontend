// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GiftDetail {

 int get id; int get price; String get giftDate; GiftType get giftType; Direction get direction; String? get description; int get friendId; String get friendName;
/// Create a copy of GiftDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftDetailCopyWith<GiftDetail> get copyWith => _$GiftDetailCopyWithImpl<GiftDetail>(this as GiftDetail, _$identity);

  /// Serializes this GiftDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.price, price) || other.price == price)&&(identical(other.giftDate, giftDate) || other.giftDate == giftDate)&&(identical(other.giftType, giftType) || other.giftType == giftType)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.description, description) || other.description == description)&&(identical(other.friendId, friendId) || other.friendId == friendId)&&(identical(other.friendName, friendName) || other.friendName == friendName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,price,giftDate,giftType,direction,description,friendId,friendName);

@override
String toString() {
  return 'GiftDetail(id: $id, price: $price, giftDate: $giftDate, giftType: $giftType, direction: $direction, description: $description, friendId: $friendId, friendName: $friendName)';
}


}

/// @nodoc
abstract mixin class $GiftDetailCopyWith<$Res>  {
  factory $GiftDetailCopyWith(GiftDetail value, $Res Function(GiftDetail) _then) = _$GiftDetailCopyWithImpl;
@useResult
$Res call({
 int id, int price, String giftDate, GiftType giftType, Direction direction, String? description, int friendId, String friendName
});




}
/// @nodoc
class _$GiftDetailCopyWithImpl<$Res>
    implements $GiftDetailCopyWith<$Res> {
  _$GiftDetailCopyWithImpl(this._self, this._then);

  final GiftDetail _self;
  final $Res Function(GiftDetail) _then;

/// Create a copy of GiftDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? price = null,Object? giftDate = null,Object? giftType = null,Object? direction = null,Object? description = freezed,Object? friendId = null,Object? friendName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,giftDate: null == giftDate ? _self.giftDate : giftDate // ignore: cast_nullable_to_non_nullable
as String,giftType: null == giftType ? _self.giftType : giftType // ignore: cast_nullable_to_non_nullable
as GiftType,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,friendId: null == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as int,friendName: null == friendName ? _self.friendName : friendName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftDetail].
extension GiftDetailPatterns on GiftDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftDetail value)  $default,){
final _that = this;
switch (_that) {
case _GiftDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftDetail value)?  $default,){
final _that = this;
switch (_that) {
case _GiftDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int price,  String giftDate,  GiftType giftType,  Direction direction,  String? description,  int friendId,  String friendName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftDetail() when $default != null:
return $default(_that.id,_that.price,_that.giftDate,_that.giftType,_that.direction,_that.description,_that.friendId,_that.friendName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int price,  String giftDate,  GiftType giftType,  Direction direction,  String? description,  int friendId,  String friendName)  $default,) {final _that = this;
switch (_that) {
case _GiftDetail():
return $default(_that.id,_that.price,_that.giftDate,_that.giftType,_that.direction,_that.description,_that.friendId,_that.friendName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int price,  String giftDate,  GiftType giftType,  Direction direction,  String? description,  int friendId,  String friendName)?  $default,) {final _that = this;
switch (_that) {
case _GiftDetail() when $default != null:
return $default(_that.id,_that.price,_that.giftDate,_that.giftType,_that.direction,_that.description,_that.friendId,_that.friendName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftDetail implements GiftDetail {
  const _GiftDetail({required this.id, required this.price, required this.giftDate, required this.giftType, required this.direction, this.description, required this.friendId, required this.friendName});
  factory _GiftDetail.fromJson(Map<String, dynamic> json) => _$GiftDetailFromJson(json);

@override final  int id;
@override final  int price;
@override final  String giftDate;
@override final  GiftType giftType;
@override final  Direction direction;
@override final  String? description;
@override final  int friendId;
@override final  String friendName;

/// Create a copy of GiftDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftDetailCopyWith<_GiftDetail> get copyWith => __$GiftDetailCopyWithImpl<_GiftDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.price, price) || other.price == price)&&(identical(other.giftDate, giftDate) || other.giftDate == giftDate)&&(identical(other.giftType, giftType) || other.giftType == giftType)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.description, description) || other.description == description)&&(identical(other.friendId, friendId) || other.friendId == friendId)&&(identical(other.friendName, friendName) || other.friendName == friendName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,price,giftDate,giftType,direction,description,friendId,friendName);

@override
String toString() {
  return 'GiftDetail(id: $id, price: $price, giftDate: $giftDate, giftType: $giftType, direction: $direction, description: $description, friendId: $friendId, friendName: $friendName)';
}


}

/// @nodoc
abstract mixin class _$GiftDetailCopyWith<$Res> implements $GiftDetailCopyWith<$Res> {
  factory _$GiftDetailCopyWith(_GiftDetail value, $Res Function(_GiftDetail) _then) = __$GiftDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, int price, String giftDate, GiftType giftType, Direction direction, String? description, int friendId, String friendName
});




}
/// @nodoc
class __$GiftDetailCopyWithImpl<$Res>
    implements _$GiftDetailCopyWith<$Res> {
  __$GiftDetailCopyWithImpl(this._self, this._then);

  final _GiftDetail _self;
  final $Res Function(_GiftDetail) _then;

/// Create a copy of GiftDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? price = null,Object? giftDate = null,Object? giftType = null,Object? direction = null,Object? description = freezed,Object? friendId = null,Object? friendName = null,}) {
  return _then(_GiftDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,giftDate: null == giftDate ? _self.giftDate : giftDate // ignore: cast_nullable_to_non_nullable
as String,giftType: null == giftType ? _self.giftType : giftType // ignore: cast_nullable_to_non_nullable
as GiftType,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,friendId: null == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as int,friendName: null == friendName ? _self.friendName : friendName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
