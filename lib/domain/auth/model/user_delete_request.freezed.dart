// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_delete_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDeleteRequest {

 LoginPlatform get provider; String? get authorizationCode;
/// Create a copy of UserDeleteRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDeleteRequestCopyWith<UserDeleteRequest> get copyWith => _$UserDeleteRequestCopyWithImpl<UserDeleteRequest>(this as UserDeleteRequest, _$identity);

  /// Serializes this UserDeleteRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDeleteRequest&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.authorizationCode, authorizationCode) || other.authorizationCode == authorizationCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,authorizationCode);

@override
String toString() {
  return 'UserDeleteRequest(provider: $provider, authorizationCode: $authorizationCode)';
}


}

/// @nodoc
abstract mixin class $UserDeleteRequestCopyWith<$Res>  {
  factory $UserDeleteRequestCopyWith(UserDeleteRequest value, $Res Function(UserDeleteRequest) _then) = _$UserDeleteRequestCopyWithImpl;
@useResult
$Res call({
 LoginPlatform provider, String? authorizationCode
});




}
/// @nodoc
class _$UserDeleteRequestCopyWithImpl<$Res>
    implements $UserDeleteRequestCopyWith<$Res> {
  _$UserDeleteRequestCopyWithImpl(this._self, this._then);

  final UserDeleteRequest _self;
  final $Res Function(UserDeleteRequest) _then;

/// Create a copy of UserDeleteRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provider = null,Object? authorizationCode = freezed,}) {
  return _then(_self.copyWith(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as LoginPlatform,authorizationCode: freezed == authorizationCode ? _self.authorizationCode : authorizationCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDeleteRequest].
extension UserDeleteRequestPatterns on UserDeleteRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDeleteRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDeleteRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDeleteRequest value)  $default,){
final _that = this;
switch (_that) {
case _UserDeleteRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDeleteRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UserDeleteRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoginPlatform provider,  String? authorizationCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDeleteRequest() when $default != null:
return $default(_that.provider,_that.authorizationCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoginPlatform provider,  String? authorizationCode)  $default,) {final _that = this;
switch (_that) {
case _UserDeleteRequest():
return $default(_that.provider,_that.authorizationCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoginPlatform provider,  String? authorizationCode)?  $default,) {final _that = this;
switch (_that) {
case _UserDeleteRequest() when $default != null:
return $default(_that.provider,_that.authorizationCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDeleteRequest implements UserDeleteRequest {
  const _UserDeleteRequest({required this.provider, this.authorizationCode});
  factory _UserDeleteRequest.fromJson(Map<String, dynamic> json) => _$UserDeleteRequestFromJson(json);

@override final  LoginPlatform provider;
@override final  String? authorizationCode;

/// Create a copy of UserDeleteRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDeleteRequestCopyWith<_UserDeleteRequest> get copyWith => __$UserDeleteRequestCopyWithImpl<_UserDeleteRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDeleteRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDeleteRequest&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.authorizationCode, authorizationCode) || other.authorizationCode == authorizationCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,authorizationCode);

@override
String toString() {
  return 'UserDeleteRequest(provider: $provider, authorizationCode: $authorizationCode)';
}


}

/// @nodoc
abstract mixin class _$UserDeleteRequestCopyWith<$Res> implements $UserDeleteRequestCopyWith<$Res> {
  factory _$UserDeleteRequestCopyWith(_UserDeleteRequest value, $Res Function(_UserDeleteRequest) _then) = __$UserDeleteRequestCopyWithImpl;
@override @useResult
$Res call({
 LoginPlatform provider, String? authorizationCode
});




}
/// @nodoc
class __$UserDeleteRequestCopyWithImpl<$Res>
    implements _$UserDeleteRequestCopyWith<$Res> {
  __$UserDeleteRequestCopyWithImpl(this._self, this._then);

  final _UserDeleteRequest _self;
  final $Res Function(_UserDeleteRequest) _then;

/// Create a copy of UserDeleteRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provider = null,Object? authorizationCode = freezed,}) {
  return _then(_UserDeleteRequest(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as LoginPlatform,authorizationCode: freezed == authorizationCode ? _self.authorizationCode : authorizationCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
