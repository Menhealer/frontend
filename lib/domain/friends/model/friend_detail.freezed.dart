// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FriendDetail {

 Friend get friend; List<Event>? get recentEvents; List<Gift>? get giftHistory;
/// Create a copy of FriendDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendDetailCopyWith<FriendDetail> get copyWith => _$FriendDetailCopyWithImpl<FriendDetail>(this as FriendDetail, _$identity);

  /// Serializes this FriendDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendDetail&&(identical(other.friend, friend) || other.friend == friend)&&const DeepCollectionEquality().equals(other.recentEvents, recentEvents)&&const DeepCollectionEquality().equals(other.giftHistory, giftHistory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,friend,const DeepCollectionEquality().hash(recentEvents),const DeepCollectionEquality().hash(giftHistory));

@override
String toString() {
  return 'FriendDetail(friend: $friend, recentEvents: $recentEvents, giftHistory: $giftHistory)';
}


}

/// @nodoc
abstract mixin class $FriendDetailCopyWith<$Res>  {
  factory $FriendDetailCopyWith(FriendDetail value, $Res Function(FriendDetail) _then) = _$FriendDetailCopyWithImpl;
@useResult
$Res call({
 Friend friend, List<Event>? recentEvents, List<Gift>? giftHistory
});


$FriendCopyWith<$Res> get friend;

}
/// @nodoc
class _$FriendDetailCopyWithImpl<$Res>
    implements $FriendDetailCopyWith<$Res> {
  _$FriendDetailCopyWithImpl(this._self, this._then);

  final FriendDetail _self;
  final $Res Function(FriendDetail) _then;

/// Create a copy of FriendDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? friend = null,Object? recentEvents = freezed,Object? giftHistory = freezed,}) {
  return _then(_self.copyWith(
friend: null == friend ? _self.friend : friend // ignore: cast_nullable_to_non_nullable
as Friend,recentEvents: freezed == recentEvents ? _self.recentEvents : recentEvents // ignore: cast_nullable_to_non_nullable
as List<Event>?,giftHistory: freezed == giftHistory ? _self.giftHistory : giftHistory // ignore: cast_nullable_to_non_nullable
as List<Gift>?,
  ));
}
/// Create a copy of FriendDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FriendCopyWith<$Res> get friend {
  
  return $FriendCopyWith<$Res>(_self.friend, (value) {
    return _then(_self.copyWith(friend: value));
  });
}
}


/// Adds pattern-matching-related methods to [FriendDetail].
extension FriendDetailPatterns on FriendDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendDetail value)  $default,){
final _that = this;
switch (_that) {
case _FriendDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendDetail value)?  $default,){
final _that = this;
switch (_that) {
case _FriendDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Friend friend,  List<Event>? recentEvents,  List<Gift>? giftHistory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendDetail() when $default != null:
return $default(_that.friend,_that.recentEvents,_that.giftHistory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Friend friend,  List<Event>? recentEvents,  List<Gift>? giftHistory)  $default,) {final _that = this;
switch (_that) {
case _FriendDetail():
return $default(_that.friend,_that.recentEvents,_that.giftHistory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Friend friend,  List<Event>? recentEvents,  List<Gift>? giftHistory)?  $default,) {final _that = this;
switch (_that) {
case _FriendDetail() when $default != null:
return $default(_that.friend,_that.recentEvents,_that.giftHistory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FriendDetail implements FriendDetail {
  const _FriendDetail({required this.friend, final  List<Event>? recentEvents, final  List<Gift>? giftHistory}): _recentEvents = recentEvents,_giftHistory = giftHistory;
  factory _FriendDetail.fromJson(Map<String, dynamic> json) => _$FriendDetailFromJson(json);

@override final  Friend friend;
 final  List<Event>? _recentEvents;
@override List<Event>? get recentEvents {
  final value = _recentEvents;
  if (value == null) return null;
  if (_recentEvents is EqualUnmodifiableListView) return _recentEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Gift>? _giftHistory;
@override List<Gift>? get giftHistory {
  final value = _giftHistory;
  if (value == null) return null;
  if (_giftHistory is EqualUnmodifiableListView) return _giftHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of FriendDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendDetailCopyWith<_FriendDetail> get copyWith => __$FriendDetailCopyWithImpl<_FriendDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FriendDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendDetail&&(identical(other.friend, friend) || other.friend == friend)&&const DeepCollectionEquality().equals(other._recentEvents, _recentEvents)&&const DeepCollectionEquality().equals(other._giftHistory, _giftHistory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,friend,const DeepCollectionEquality().hash(_recentEvents),const DeepCollectionEquality().hash(_giftHistory));

@override
String toString() {
  return 'FriendDetail(friend: $friend, recentEvents: $recentEvents, giftHistory: $giftHistory)';
}


}

/// @nodoc
abstract mixin class _$FriendDetailCopyWith<$Res> implements $FriendDetailCopyWith<$Res> {
  factory _$FriendDetailCopyWith(_FriendDetail value, $Res Function(_FriendDetail) _then) = __$FriendDetailCopyWithImpl;
@override @useResult
$Res call({
 Friend friend, List<Event>? recentEvents, List<Gift>? giftHistory
});


@override $FriendCopyWith<$Res> get friend;

}
/// @nodoc
class __$FriendDetailCopyWithImpl<$Res>
    implements _$FriendDetailCopyWith<$Res> {
  __$FriendDetailCopyWithImpl(this._self, this._then);

  final _FriendDetail _self;
  final $Res Function(_FriendDetail) _then;

/// Create a copy of FriendDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? friend = null,Object? recentEvents = freezed,Object? giftHistory = freezed,}) {
  return _then(_FriendDetail(
friend: null == friend ? _self.friend : friend // ignore: cast_nullable_to_non_nullable
as Friend,recentEvents: freezed == recentEvents ? _self._recentEvents : recentEvents // ignore: cast_nullable_to_non_nullable
as List<Event>?,giftHistory: freezed == giftHistory ? _self._giftHistory : giftHistory // ignore: cast_nullable_to_non_nullable
as List<Gift>?,
  ));
}

/// Create a copy of FriendDetail
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
