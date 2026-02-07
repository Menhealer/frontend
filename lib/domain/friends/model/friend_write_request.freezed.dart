// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_write_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FriendWriteRequest {

 String get name; String? get birthday; String? get group;
/// Create a copy of FriendWriteRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendWriteRequestCopyWith<FriendWriteRequest> get copyWith => _$FriendWriteRequestCopyWithImpl<FriendWriteRequest>(this as FriendWriteRequest, _$identity);

  /// Serializes this FriendWriteRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendWriteRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.group, group) || other.group == group));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,birthday,group);

@override
String toString() {
  return 'FriendWriteRequest(name: $name, birthday: $birthday, group: $group)';
}


}

/// @nodoc
abstract mixin class $FriendWriteRequestCopyWith<$Res>  {
  factory $FriendWriteRequestCopyWith(FriendWriteRequest value, $Res Function(FriendWriteRequest) _then) = _$FriendWriteRequestCopyWithImpl;
@useResult
$Res call({
 String name, String? birthday, String? group
});




}
/// @nodoc
class _$FriendWriteRequestCopyWithImpl<$Res>
    implements $FriendWriteRequestCopyWith<$Res> {
  _$FriendWriteRequestCopyWithImpl(this._self, this._then);

  final FriendWriteRequest _self;
  final $Res Function(FriendWriteRequest) _then;

/// Create a copy of FriendWriteRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? birthday = freezed,Object? group = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendWriteRequest].
extension FriendWriteRequestPatterns on FriendWriteRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendWriteRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendWriteRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendWriteRequest value)  $default,){
final _that = this;
switch (_that) {
case _FriendWriteRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendWriteRequest value)?  $default,){
final _that = this;
switch (_that) {
case _FriendWriteRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? birthday,  String? group)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendWriteRequest() when $default != null:
return $default(_that.name,_that.birthday,_that.group);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? birthday,  String? group)  $default,) {final _that = this;
switch (_that) {
case _FriendWriteRequest():
return $default(_that.name,_that.birthday,_that.group);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? birthday,  String? group)?  $default,) {final _that = this;
switch (_that) {
case _FriendWriteRequest() when $default != null:
return $default(_that.name,_that.birthday,_that.group);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FriendWriteRequest implements FriendWriteRequest {
  const _FriendWriteRequest({required this.name, this.birthday, this.group});
  factory _FriendWriteRequest.fromJson(Map<String, dynamic> json) => _$FriendWriteRequestFromJson(json);

@override final  String name;
@override final  String? birthday;
@override final  String? group;

/// Create a copy of FriendWriteRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendWriteRequestCopyWith<_FriendWriteRequest> get copyWith => __$FriendWriteRequestCopyWithImpl<_FriendWriteRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FriendWriteRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendWriteRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.group, group) || other.group == group));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,birthday,group);

@override
String toString() {
  return 'FriendWriteRequest(name: $name, birthday: $birthday, group: $group)';
}


}

/// @nodoc
abstract mixin class _$FriendWriteRequestCopyWith<$Res> implements $FriendWriteRequestCopyWith<$Res> {
  factory _$FriendWriteRequestCopyWith(_FriendWriteRequest value, $Res Function(_FriendWriteRequest) _then) = __$FriendWriteRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String? birthday, String? group
});




}
/// @nodoc
class __$FriendWriteRequestCopyWithImpl<$Res>
    implements _$FriendWriteRequestCopyWith<$Res> {
  __$FriendWriteRequestCopyWithImpl(this._self, this._then);

  final _FriendWriteRequest _self;
  final $Res Function(_FriendWriteRequest) _then;

/// Create a copy of FriendWriteRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? birthday = freezed,Object? group = freezed,}) {
  return _then(_FriendWriteRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
