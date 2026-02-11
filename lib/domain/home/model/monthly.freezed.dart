// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Monthly {

 String? get analysis; List<String?> get suggestions;
/// Create a copy of Monthly
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthlyCopyWith<Monthly> get copyWith => _$MonthlyCopyWithImpl<Monthly>(this as Monthly, _$identity);

  /// Serializes this Monthly to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Monthly&&(identical(other.analysis, analysis) || other.analysis == analysis)&&const DeepCollectionEquality().equals(other.suggestions, suggestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,analysis,const DeepCollectionEquality().hash(suggestions));

@override
String toString() {
  return 'Monthly(analysis: $analysis, suggestions: $suggestions)';
}


}

/// @nodoc
abstract mixin class $MonthlyCopyWith<$Res>  {
  factory $MonthlyCopyWith(Monthly value, $Res Function(Monthly) _then) = _$MonthlyCopyWithImpl;
@useResult
$Res call({
 String? analysis, List<String?> suggestions
});




}
/// @nodoc
class _$MonthlyCopyWithImpl<$Res>
    implements $MonthlyCopyWith<$Res> {
  _$MonthlyCopyWithImpl(this._self, this._then);

  final Monthly _self;
  final $Res Function(Monthly) _then;

/// Create a copy of Monthly
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? analysis = freezed,Object? suggestions = null,}) {
  return _then(_self.copyWith(
analysis: freezed == analysis ? _self.analysis : analysis // ignore: cast_nullable_to_non_nullable
as String?,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String?>,
  ));
}

}


/// Adds pattern-matching-related methods to [Monthly].
extension MonthlyPatterns on Monthly {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Monthly value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Monthly() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Monthly value)  $default,){
final _that = this;
switch (_that) {
case _Monthly():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Monthly value)?  $default,){
final _that = this;
switch (_that) {
case _Monthly() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? analysis,  List<String?> suggestions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Monthly() when $default != null:
return $default(_that.analysis,_that.suggestions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? analysis,  List<String?> suggestions)  $default,) {final _that = this;
switch (_that) {
case _Monthly():
return $default(_that.analysis,_that.suggestions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? analysis,  List<String?> suggestions)?  $default,) {final _that = this;
switch (_that) {
case _Monthly() when $default != null:
return $default(_that.analysis,_that.suggestions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Monthly implements Monthly {
  const _Monthly({this.analysis, required final  List<String?> suggestions}): _suggestions = suggestions;
  factory _Monthly.fromJson(Map<String, dynamic> json) => _$MonthlyFromJson(json);

@override final  String? analysis;
 final  List<String?> _suggestions;
@override List<String?> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}


/// Create a copy of Monthly
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthlyCopyWith<_Monthly> get copyWith => __$MonthlyCopyWithImpl<_Monthly>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonthlyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Monthly&&(identical(other.analysis, analysis) || other.analysis == analysis)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,analysis,const DeepCollectionEquality().hash(_suggestions));

@override
String toString() {
  return 'Monthly(analysis: $analysis, suggestions: $suggestions)';
}


}

/// @nodoc
abstract mixin class _$MonthlyCopyWith<$Res> implements $MonthlyCopyWith<$Res> {
  factory _$MonthlyCopyWith(_Monthly value, $Res Function(_Monthly) _then) = __$MonthlyCopyWithImpl;
@override @useResult
$Res call({
 String? analysis, List<String?> suggestions
});




}
/// @nodoc
class __$MonthlyCopyWithImpl<$Res>
    implements _$MonthlyCopyWith<$Res> {
  __$MonthlyCopyWithImpl(this._self, this._then);

  final _Monthly _self;
  final $Res Function(_Monthly) _then;

/// Create a copy of Monthly
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? analysis = freezed,Object? suggestions = null,}) {
  return _then(_Monthly(
analysis: freezed == analysis ? _self.analysis : analysis // ignore: cast_nullable_to_non_nullable
as String?,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String?>,
  ));
}


}

// dart format on
