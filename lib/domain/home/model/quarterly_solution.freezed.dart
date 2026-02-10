// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quarterly_solution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuarterlySolution {

 String? get overallAnalysis; List<String?> get positiveInsights; List<String?> get negativeInsights; List<String?> get actionItems;
/// Create a copy of QuarterlySolution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuarterlySolutionCopyWith<QuarterlySolution> get copyWith => _$QuarterlySolutionCopyWithImpl<QuarterlySolution>(this as QuarterlySolution, _$identity);

  /// Serializes this QuarterlySolution to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuarterlySolution&&(identical(other.overallAnalysis, overallAnalysis) || other.overallAnalysis == overallAnalysis)&&const DeepCollectionEquality().equals(other.positiveInsights, positiveInsights)&&const DeepCollectionEquality().equals(other.negativeInsights, negativeInsights)&&const DeepCollectionEquality().equals(other.actionItems, actionItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,overallAnalysis,const DeepCollectionEquality().hash(positiveInsights),const DeepCollectionEquality().hash(negativeInsights),const DeepCollectionEquality().hash(actionItems));

@override
String toString() {
  return 'QuarterlySolution(overallAnalysis: $overallAnalysis, positiveInsights: $positiveInsights, negativeInsights: $negativeInsights, actionItems: $actionItems)';
}


}

/// @nodoc
abstract mixin class $QuarterlySolutionCopyWith<$Res>  {
  factory $QuarterlySolutionCopyWith(QuarterlySolution value, $Res Function(QuarterlySolution) _then) = _$QuarterlySolutionCopyWithImpl;
@useResult
$Res call({
 String? overallAnalysis, List<String?> positiveInsights, List<String?> negativeInsights, List<String?> actionItems
});




}
/// @nodoc
class _$QuarterlySolutionCopyWithImpl<$Res>
    implements $QuarterlySolutionCopyWith<$Res> {
  _$QuarterlySolutionCopyWithImpl(this._self, this._then);

  final QuarterlySolution _self;
  final $Res Function(QuarterlySolution) _then;

/// Create a copy of QuarterlySolution
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? overallAnalysis = freezed,Object? positiveInsights = null,Object? negativeInsights = null,Object? actionItems = null,}) {
  return _then(_self.copyWith(
overallAnalysis: freezed == overallAnalysis ? _self.overallAnalysis : overallAnalysis // ignore: cast_nullable_to_non_nullable
as String?,positiveInsights: null == positiveInsights ? _self.positiveInsights : positiveInsights // ignore: cast_nullable_to_non_nullable
as List<String?>,negativeInsights: null == negativeInsights ? _self.negativeInsights : negativeInsights // ignore: cast_nullable_to_non_nullable
as List<String?>,actionItems: null == actionItems ? _self.actionItems : actionItems // ignore: cast_nullable_to_non_nullable
as List<String?>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuarterlySolution].
extension QuarterlySolutionPatterns on QuarterlySolution {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuarterlySolution value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuarterlySolution() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuarterlySolution value)  $default,){
final _that = this;
switch (_that) {
case _QuarterlySolution():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuarterlySolution value)?  $default,){
final _that = this;
switch (_that) {
case _QuarterlySolution() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? overallAnalysis,  List<String?> positiveInsights,  List<String?> negativeInsights,  List<String?> actionItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuarterlySolution() when $default != null:
return $default(_that.overallAnalysis,_that.positiveInsights,_that.negativeInsights,_that.actionItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? overallAnalysis,  List<String?> positiveInsights,  List<String?> negativeInsights,  List<String?> actionItems)  $default,) {final _that = this;
switch (_that) {
case _QuarterlySolution():
return $default(_that.overallAnalysis,_that.positiveInsights,_that.negativeInsights,_that.actionItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? overallAnalysis,  List<String?> positiveInsights,  List<String?> negativeInsights,  List<String?> actionItems)?  $default,) {final _that = this;
switch (_that) {
case _QuarterlySolution() when $default != null:
return $default(_that.overallAnalysis,_that.positiveInsights,_that.negativeInsights,_that.actionItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuarterlySolution implements QuarterlySolution {
  const _QuarterlySolution({this.overallAnalysis, required final  List<String?> positiveInsights, required final  List<String?> negativeInsights, required final  List<String?> actionItems}): _positiveInsights = positiveInsights,_negativeInsights = negativeInsights,_actionItems = actionItems;
  factory _QuarterlySolution.fromJson(Map<String, dynamic> json) => _$QuarterlySolutionFromJson(json);

@override final  String? overallAnalysis;
 final  List<String?> _positiveInsights;
@override List<String?> get positiveInsights {
  if (_positiveInsights is EqualUnmodifiableListView) return _positiveInsights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_positiveInsights);
}

 final  List<String?> _negativeInsights;
@override List<String?> get negativeInsights {
  if (_negativeInsights is EqualUnmodifiableListView) return _negativeInsights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_negativeInsights);
}

 final  List<String?> _actionItems;
@override List<String?> get actionItems {
  if (_actionItems is EqualUnmodifiableListView) return _actionItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actionItems);
}


/// Create a copy of QuarterlySolution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuarterlySolutionCopyWith<_QuarterlySolution> get copyWith => __$QuarterlySolutionCopyWithImpl<_QuarterlySolution>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuarterlySolutionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuarterlySolution&&(identical(other.overallAnalysis, overallAnalysis) || other.overallAnalysis == overallAnalysis)&&const DeepCollectionEquality().equals(other._positiveInsights, _positiveInsights)&&const DeepCollectionEquality().equals(other._negativeInsights, _negativeInsights)&&const DeepCollectionEquality().equals(other._actionItems, _actionItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,overallAnalysis,const DeepCollectionEquality().hash(_positiveInsights),const DeepCollectionEquality().hash(_negativeInsights),const DeepCollectionEquality().hash(_actionItems));

@override
String toString() {
  return 'QuarterlySolution(overallAnalysis: $overallAnalysis, positiveInsights: $positiveInsights, negativeInsights: $negativeInsights, actionItems: $actionItems)';
}


}

/// @nodoc
abstract mixin class _$QuarterlySolutionCopyWith<$Res> implements $QuarterlySolutionCopyWith<$Res> {
  factory _$QuarterlySolutionCopyWith(_QuarterlySolution value, $Res Function(_QuarterlySolution) _then) = __$QuarterlySolutionCopyWithImpl;
@override @useResult
$Res call({
 String? overallAnalysis, List<String?> positiveInsights, List<String?> negativeInsights, List<String?> actionItems
});




}
/// @nodoc
class __$QuarterlySolutionCopyWithImpl<$Res>
    implements _$QuarterlySolutionCopyWith<$Res> {
  __$QuarterlySolutionCopyWithImpl(this._self, this._then);

  final _QuarterlySolution _self;
  final $Res Function(_QuarterlySolution) _then;

/// Create a copy of QuarterlySolution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? overallAnalysis = freezed,Object? positiveInsights = null,Object? negativeInsights = null,Object? actionItems = null,}) {
  return _then(_QuarterlySolution(
overallAnalysis: freezed == overallAnalysis ? _self.overallAnalysis : overallAnalysis // ignore: cast_nullable_to_non_nullable
as String?,positiveInsights: null == positiveInsights ? _self._positiveInsights : positiveInsights // ignore: cast_nullable_to_non_nullable
as List<String?>,negativeInsights: null == negativeInsights ? _self._negativeInsights : negativeInsights // ignore: cast_nullable_to_non_nullable
as List<String?>,actionItems: null == actionItems ? _self._actionItems : actionItems // ignore: cast_nullable_to_non_nullable
as List<String?>,
  ));
}


}

// dart format on
