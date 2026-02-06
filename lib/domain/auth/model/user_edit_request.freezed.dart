// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_edit_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserEditRequest {

 String? get nickname; String? get birthday; String? get profileImage;
/// Create a copy of UserEditRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEditRequestCopyWith<UserEditRequest> get copyWith => _$UserEditRequestCopyWithImpl<UserEditRequest>(this as UserEditRequest, _$identity);

  /// Serializes this UserEditRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEditRequest&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nickname,birthday,profileImage);

@override
String toString() {
  return 'UserEditRequest(nickname: $nickname, birthday: $birthday, profileImage: $profileImage)';
}


}

/// @nodoc
abstract mixin class $UserEditRequestCopyWith<$Res>  {
  factory $UserEditRequestCopyWith(UserEditRequest value, $Res Function(UserEditRequest) _then) = _$UserEditRequestCopyWithImpl;
@useResult
$Res call({
 String? nickname, String? birthday, String? profileImage
});




}
/// @nodoc
class _$UserEditRequestCopyWithImpl<$Res>
    implements $UserEditRequestCopyWith<$Res> {
  _$UserEditRequestCopyWithImpl(this._self, this._then);

  final UserEditRequest _self;
  final $Res Function(UserEditRequest) _then;

/// Create a copy of UserEditRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nickname = freezed,Object? birthday = freezed,Object? profileImage = freezed,}) {
  return _then(_self.copyWith(
nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserEditRequest].
extension UserEditRequestPatterns on UserEditRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEditRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEditRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEditRequest value)  $default,){
final _that = this;
switch (_that) {
case _UserEditRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEditRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UserEditRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? nickname,  String? birthday,  String? profileImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEditRequest() when $default != null:
return $default(_that.nickname,_that.birthday,_that.profileImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? nickname,  String? birthday,  String? profileImage)  $default,) {final _that = this;
switch (_that) {
case _UserEditRequest():
return $default(_that.nickname,_that.birthday,_that.profileImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? nickname,  String? birthday,  String? profileImage)?  $default,) {final _that = this;
switch (_that) {
case _UserEditRequest() when $default != null:
return $default(_that.nickname,_that.birthday,_that.profileImage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserEditRequest implements UserEditRequest {
  const _UserEditRequest({this.nickname, this.birthday, this.profileImage});
  factory _UserEditRequest.fromJson(Map<String, dynamic> json) => _$UserEditRequestFromJson(json);

@override final  String? nickname;
@override final  String? birthday;
@override final  String? profileImage;

/// Create a copy of UserEditRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEditRequestCopyWith<_UserEditRequest> get copyWith => __$UserEditRequestCopyWithImpl<_UserEditRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserEditRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEditRequest&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nickname,birthday,profileImage);

@override
String toString() {
  return 'UserEditRequest(nickname: $nickname, birthday: $birthday, profileImage: $profileImage)';
}


}

/// @nodoc
abstract mixin class _$UserEditRequestCopyWith<$Res> implements $UserEditRequestCopyWith<$Res> {
  factory _$UserEditRequestCopyWith(_UserEditRequest value, $Res Function(_UserEditRequest) _then) = __$UserEditRequestCopyWithImpl;
@override @useResult
$Res call({
 String? nickname, String? birthday, String? profileImage
});




}
/// @nodoc
class __$UserEditRequestCopyWithImpl<$Res>
    implements _$UserEditRequestCopyWith<$Res> {
  __$UserEditRequestCopyWithImpl(this._self, this._then);

  final _UserEditRequest _self;
  final $Res Function(_UserEditRequest) _then;

/// Create a copy of UserEditRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nickname = freezed,Object? birthday = freezed,Object? profileImage = freezed,}) {
  return _then(_UserEditRequest(
nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
