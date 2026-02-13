// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quarterly.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Quarterly {

 List<FriendInfo?> get bestFriends; List<FriendInfo?> get worstFriends; QuarterlySolution? get solution;
/// Create a copy of Quarterly
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuarterlyCopyWith<Quarterly> get copyWith => _$QuarterlyCopyWithImpl<Quarterly>(this as Quarterly, _$identity);

  /// Serializes this Quarterly to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Quarterly&&const DeepCollectionEquality().equals(other.bestFriends, bestFriends)&&const DeepCollectionEquality().equals(other.worstFriends, worstFriends)&&(identical(other.solution, solution) || other.solution == solution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bestFriends),const DeepCollectionEquality().hash(worstFriends),solution);

@override
String toString() {
  return 'Quarterly(bestFriends: $bestFriends, worstFriends: $worstFriends, solution: $solution)';
}


}

/// @nodoc
abstract mixin class $QuarterlyCopyWith<$Res>  {
  factory $QuarterlyCopyWith(Quarterly value, $Res Function(Quarterly) _then) = _$QuarterlyCopyWithImpl;
@useResult
$Res call({
 List<FriendInfo?> bestFriends, List<FriendInfo?> worstFriends, QuarterlySolution? solution
});


$QuarterlySolutionCopyWith<$Res>? get solution;

}
/// @nodoc
class _$QuarterlyCopyWithImpl<$Res>
    implements $QuarterlyCopyWith<$Res> {
  _$QuarterlyCopyWithImpl(this._self, this._then);

  final Quarterly _self;
  final $Res Function(Quarterly) _then;

/// Create a copy of Quarterly
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bestFriends = null,Object? worstFriends = null,Object? solution = freezed,}) {
  return _then(_self.copyWith(
bestFriends: null == bestFriends ? _self.bestFriends : bestFriends // ignore: cast_nullable_to_non_nullable
as List<FriendInfo?>,worstFriends: null == worstFriends ? _self.worstFriends : worstFriends // ignore: cast_nullable_to_non_nullable
as List<FriendInfo?>,solution: freezed == solution ? _self.solution : solution // ignore: cast_nullable_to_non_nullable
as QuarterlySolution?,
  ));
}
/// Create a copy of Quarterly
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuarterlySolutionCopyWith<$Res>? get solution {
    if (_self.solution == null) {
    return null;
  }

  return $QuarterlySolutionCopyWith<$Res>(_self.solution!, (value) {
    return _then(_self.copyWith(solution: value));
  });
}
}


/// Adds pattern-matching-related methods to [Quarterly].
extension QuarterlyPatterns on Quarterly {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Quarterly value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Quarterly() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Quarterly value)  $default,){
final _that = this;
switch (_that) {
case _Quarterly():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Quarterly value)?  $default,){
final _that = this;
switch (_that) {
case _Quarterly() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FriendInfo?> bestFriends,  List<FriendInfo?> worstFriends,  QuarterlySolution? solution)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Quarterly() when $default != null:
return $default(_that.bestFriends,_that.worstFriends,_that.solution);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FriendInfo?> bestFriends,  List<FriendInfo?> worstFriends,  QuarterlySolution? solution)  $default,) {final _that = this;
switch (_that) {
case _Quarterly():
return $default(_that.bestFriends,_that.worstFriends,_that.solution);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FriendInfo?> bestFriends,  List<FriendInfo?> worstFriends,  QuarterlySolution? solution)?  $default,) {final _that = this;
switch (_that) {
case _Quarterly() when $default != null:
return $default(_that.bestFriends,_that.worstFriends,_that.solution);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Quarterly implements Quarterly {
  const _Quarterly({required final  List<FriendInfo?> bestFriends, required final  List<FriendInfo?> worstFriends, this.solution}): _bestFriends = bestFriends,_worstFriends = worstFriends;
  factory _Quarterly.fromJson(Map<String, dynamic> json) => _$QuarterlyFromJson(json);

 final  List<FriendInfo?> _bestFriends;
@override List<FriendInfo?> get bestFriends {
  if (_bestFriends is EqualUnmodifiableListView) return _bestFriends;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bestFriends);
}

 final  List<FriendInfo?> _worstFriends;
@override List<FriendInfo?> get worstFriends {
  if (_worstFriends is EqualUnmodifiableListView) return _worstFriends;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_worstFriends);
}

@override final  QuarterlySolution? solution;

/// Create a copy of Quarterly
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuarterlyCopyWith<_Quarterly> get copyWith => __$QuarterlyCopyWithImpl<_Quarterly>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuarterlyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Quarterly&&const DeepCollectionEquality().equals(other._bestFriends, _bestFriends)&&const DeepCollectionEquality().equals(other._worstFriends, _worstFriends)&&(identical(other.solution, solution) || other.solution == solution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bestFriends),const DeepCollectionEquality().hash(_worstFriends),solution);

@override
String toString() {
  return 'Quarterly(bestFriends: $bestFriends, worstFriends: $worstFriends, solution: $solution)';
}


}

/// @nodoc
abstract mixin class _$QuarterlyCopyWith<$Res> implements $QuarterlyCopyWith<$Res> {
  factory _$QuarterlyCopyWith(_Quarterly value, $Res Function(_Quarterly) _then) = __$QuarterlyCopyWithImpl;
@override @useResult
$Res call({
 List<FriendInfo?> bestFriends, List<FriendInfo?> worstFriends, QuarterlySolution? solution
});


@override $QuarterlySolutionCopyWith<$Res>? get solution;

}
/// @nodoc
class __$QuarterlyCopyWithImpl<$Res>
    implements _$QuarterlyCopyWith<$Res> {
  __$QuarterlyCopyWithImpl(this._self, this._then);

  final _Quarterly _self;
  final $Res Function(_Quarterly) _then;

/// Create a copy of Quarterly
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bestFriends = null,Object? worstFriends = null,Object? solution = freezed,}) {
  return _then(_Quarterly(
bestFriends: null == bestFriends ? _self._bestFriends : bestFriends // ignore: cast_nullable_to_non_nullable
as List<FriendInfo?>,worstFriends: null == worstFriends ? _self._worstFriends : worstFriends // ignore: cast_nullable_to_non_nullable
as List<FriendInfo?>,solution: freezed == solution ? _self.solution : solution // ignore: cast_nullable_to_non_nullable
as QuarterlySolution?,
  ));
}

/// Create a copy of Quarterly
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuarterlySolutionCopyWith<$Res>? get solution {
    if (_self.solution == null) {
    return null;
  }

  return $QuarterlySolutionCopyWith<$Res>(_self.solution!, (value) {
    return _then(_self.copyWith(solution: value));
  });
}
}

// dart format on
