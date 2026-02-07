// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_edit_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FriendEditRequest {

 String? get name; String? get birthday; String? get group;
/// Create a copy of FriendEditRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendEditRequestCopyWith<FriendEditRequest> get copyWith => _$FriendEditRequestCopyWithImpl<FriendEditRequest>(this as FriendEditRequest, _$identity);

  /// Serializes this FriendEditRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendEditRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.group, group) || other.group == group));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,birthday,group);

@override
String toString() {
  return 'FriendEditRequest(name: $name, birthday: $birthday, group: $group)';
}


}

/// @nodoc
abstract mixin class $FriendEditRequestCopyWith<$Res>  {
  factory $FriendEditRequestCopyWith(FriendEditRequest value, $Res Function(FriendEditRequest) _then) = _$FriendEditRequestCopyWithImpl;
@useResult
$Res call({
 String? name, String? birthday, String? group
});




}
/// @nodoc
class _$FriendEditRequestCopyWithImpl<$Res>
    implements $FriendEditRequestCopyWith<$Res> {
  _$FriendEditRequestCopyWithImpl(this._self, this._then);

  final FriendEditRequest _self;
  final $Res Function(FriendEditRequest) _then;

/// Create a copy of FriendEditRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? birthday = freezed,Object? group = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendEditRequest].
extension FriendEditRequestPatterns on FriendEditRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendEditRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendEditRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendEditRequest value)  $default,){
final _that = this;
switch (_that) {
case _FriendEditRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendEditRequest value)?  $default,){
final _that = this;
switch (_that) {
case _FriendEditRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? birthday,  String? group)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendEditRequest() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? birthday,  String? group)  $default,) {final _that = this;
switch (_that) {
case _FriendEditRequest():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? birthday,  String? group)?  $default,) {final _that = this;
switch (_that) {
case _FriendEditRequest() when $default != null:
return $default(_that.name,_that.birthday,_that.group);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FriendEditRequest implements FriendEditRequest {
  const _FriendEditRequest({this.name, this.birthday, this.group});
  factory _FriendEditRequest.fromJson(Map<String, dynamic> json) => _$FriendEditRequestFromJson(json);

@override final  String? name;
@override final  String? birthday;
@override final  String? group;

/// Create a copy of FriendEditRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendEditRequestCopyWith<_FriendEditRequest> get copyWith => __$FriendEditRequestCopyWithImpl<_FriendEditRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FriendEditRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendEditRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.group, group) || other.group == group));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,birthday,group);

@override
String toString() {
  return 'FriendEditRequest(name: $name, birthday: $birthday, group: $group)';
}


}

/// @nodoc
abstract mixin class _$FriendEditRequestCopyWith<$Res> implements $FriendEditRequestCopyWith<$Res> {
  factory _$FriendEditRequestCopyWith(_FriendEditRequest value, $Res Function(_FriendEditRequest) _then) = __$FriendEditRequestCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? birthday, String? group
});




}
/// @nodoc
class __$FriendEditRequestCopyWithImpl<$Res>
    implements _$FriendEditRequestCopyWith<$Res> {
  __$FriendEditRequestCopyWithImpl(this._self, this._then);

  final _FriendEditRequest _self;
  final $Res Function(_FriendEditRequest) _then;

/// Create a copy of FriendEditRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? birthday = freezed,Object? group = freezed,}) {
  return _then(_FriendEditRequest(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
