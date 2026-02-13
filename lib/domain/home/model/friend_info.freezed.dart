// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FriendInfo {

 Friend get friend; String get recommendation;
/// Create a copy of FriendInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendInfoCopyWith<FriendInfo> get copyWith => _$FriendInfoCopyWithImpl<FriendInfo>(this as FriendInfo, _$identity);

  /// Serializes this FriendInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendInfo&&(identical(other.friend, friend) || other.friend == friend)&&(identical(other.recommendation, recommendation) || other.recommendation == recommendation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,friend,recommendation);

@override
String toString() {
  return 'FriendInfo(friend: $friend, recommendation: $recommendation)';
}


}

/// @nodoc
abstract mixin class $FriendInfoCopyWith<$Res>  {
  factory $FriendInfoCopyWith(FriendInfo value, $Res Function(FriendInfo) _then) = _$FriendInfoCopyWithImpl;
@useResult
$Res call({
 Friend friend, String recommendation
});


$FriendCopyWith<$Res> get friend;

}
/// @nodoc
class _$FriendInfoCopyWithImpl<$Res>
    implements $FriendInfoCopyWith<$Res> {
  _$FriendInfoCopyWithImpl(this._self, this._then);

  final FriendInfo _self;
  final $Res Function(FriendInfo) _then;

/// Create a copy of FriendInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? friend = null,Object? recommendation = null,}) {
  return _then(_self.copyWith(
friend: null == friend ? _self.friend : friend // ignore: cast_nullable_to_non_nullable
as Friend,recommendation: null == recommendation ? _self.recommendation : recommendation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of FriendInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FriendCopyWith<$Res> get friend {
  
  return $FriendCopyWith<$Res>(_self.friend, (value) {
    return _then(_self.copyWith(friend: value));
  });
}
}


/// Adds pattern-matching-related methods to [FriendInfo].
extension FriendInfoPatterns on FriendInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendInfo value)  $default,){
final _that = this;
switch (_that) {
case _FriendInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendInfo value)?  $default,){
final _that = this;
switch (_that) {
case _FriendInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Friend friend,  String recommendation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendInfo() when $default != null:
return $default(_that.friend,_that.recommendation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Friend friend,  String recommendation)  $default,) {final _that = this;
switch (_that) {
case _FriendInfo():
return $default(_that.friend,_that.recommendation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Friend friend,  String recommendation)?  $default,) {final _that = this;
switch (_that) {
case _FriendInfo() when $default != null:
return $default(_that.friend,_that.recommendation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FriendInfo implements FriendInfo {
  const _FriendInfo({required this.friend, required this.recommendation});
  factory _FriendInfo.fromJson(Map<String, dynamic> json) => _$FriendInfoFromJson(json);

@override final  Friend friend;
@override final  String recommendation;

/// Create a copy of FriendInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendInfoCopyWith<_FriendInfo> get copyWith => __$FriendInfoCopyWithImpl<_FriendInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FriendInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendInfo&&(identical(other.friend, friend) || other.friend == friend)&&(identical(other.recommendation, recommendation) || other.recommendation == recommendation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,friend,recommendation);

@override
String toString() {
  return 'FriendInfo(friend: $friend, recommendation: $recommendation)';
}


}

/// @nodoc
abstract mixin class _$FriendInfoCopyWith<$Res> implements $FriendInfoCopyWith<$Res> {
  factory _$FriendInfoCopyWith(_FriendInfo value, $Res Function(_FriendInfo) _then) = __$FriendInfoCopyWithImpl;
@override @useResult
$Res call({
 Friend friend, String recommendation
});


@override $FriendCopyWith<$Res> get friend;

}
/// @nodoc
class __$FriendInfoCopyWithImpl<$Res>
    implements _$FriendInfoCopyWith<$Res> {
  __$FriendInfoCopyWithImpl(this._self, this._then);

  final _FriendInfo _self;
  final $Res Function(_FriendInfo) _then;

/// Create a copy of FriendInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? friend = null,Object? recommendation = null,}) {
  return _then(_FriendInfo(
friend: null == friend ? _self.friend : friend // ignore: cast_nullable_to_non_nullable
as Friend,recommendation: null == recommendation ? _self.recommendation : recommendation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of FriendInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FriendCopyWith<$Res> get friend {
  
  return $FriendCopyWith<$Res>(_self.friend, (value) {
    return _then(_self.copyWith(friend: value));
  });
}
}

// dart format on
