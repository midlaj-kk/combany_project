// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ready_job_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReadyJobModel {

 int get id;@JsonKey(name: 'job_number') String? get jobNumber;@JsonKey(name: 'customer_name') String? get customerName;@JsonKey(name: 'vehicle_number') String? get vehicleNumber;@JsonKey(name: 'service_type') String? get serviceType;@JsonKey(name: 'customer_phone') String? get customerPhone;
/// Create a copy of ReadyJobModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadyJobModelCopyWith<ReadyJobModel> get copyWith => _$ReadyJobModelCopyWithImpl<ReadyJobModel>(this as ReadyJobModel, _$identity);

  /// Serializes this ReadyJobModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadyJobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobNumber, jobNumber) || other.jobNumber == jobNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobNumber,customerName,vehicleNumber,serviceType,customerPhone);

@override
String toString() {
  return 'ReadyJobModel(id: $id, jobNumber: $jobNumber, customerName: $customerName, vehicleNumber: $vehicleNumber, serviceType: $serviceType, customerPhone: $customerPhone)';
}


}

/// @nodoc
abstract mixin class $ReadyJobModelCopyWith<$Res>  {
  factory $ReadyJobModelCopyWith(ReadyJobModel value, $Res Function(ReadyJobModel) _then) = _$ReadyJobModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'job_number') String? jobNumber,@JsonKey(name: 'customer_name') String? customerName,@JsonKey(name: 'vehicle_number') String? vehicleNumber,@JsonKey(name: 'service_type') String? serviceType,@JsonKey(name: 'customer_phone') String? customerPhone
});




}
/// @nodoc
class _$ReadyJobModelCopyWithImpl<$Res>
    implements $ReadyJobModelCopyWith<$Res> {
  _$ReadyJobModelCopyWithImpl(this._self, this._then);

  final ReadyJobModel _self;
  final $Res Function(ReadyJobModel) _then;

/// Create a copy of ReadyJobModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? jobNumber = freezed,Object? customerName = freezed,Object? vehicleNumber = freezed,Object? serviceType = freezed,Object? customerPhone = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,jobNumber: freezed == jobNumber ? _self.jobNumber : jobNumber // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,vehicleNumber: freezed == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String?,serviceType: freezed == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String?,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReadyJobModel].
extension ReadyJobModelPatterns on ReadyJobModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReadyJobModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadyJobModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReadyJobModel value)  $default,){
final _that = this;
switch (_that) {
case _ReadyJobModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReadyJobModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReadyJobModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'job_number')  String? jobNumber, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'vehicle_number')  String? vehicleNumber, @JsonKey(name: 'service_type')  String? serviceType, @JsonKey(name: 'customer_phone')  String? customerPhone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadyJobModel() when $default != null:
return $default(_that.id,_that.jobNumber,_that.customerName,_that.vehicleNumber,_that.serviceType,_that.customerPhone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'job_number')  String? jobNumber, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'vehicle_number')  String? vehicleNumber, @JsonKey(name: 'service_type')  String? serviceType, @JsonKey(name: 'customer_phone')  String? customerPhone)  $default,) {final _that = this;
switch (_that) {
case _ReadyJobModel():
return $default(_that.id,_that.jobNumber,_that.customerName,_that.vehicleNumber,_that.serviceType,_that.customerPhone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'job_number')  String? jobNumber, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'vehicle_number')  String? vehicleNumber, @JsonKey(name: 'service_type')  String? serviceType, @JsonKey(name: 'customer_phone')  String? customerPhone)?  $default,) {final _that = this;
switch (_that) {
case _ReadyJobModel() when $default != null:
return $default(_that.id,_that.jobNumber,_that.customerName,_that.vehicleNumber,_that.serviceType,_that.customerPhone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReadyJobModel implements ReadyJobModel {
  const _ReadyJobModel({required this.id, @JsonKey(name: 'job_number') this.jobNumber, @JsonKey(name: 'customer_name') this.customerName, @JsonKey(name: 'vehicle_number') this.vehicleNumber, @JsonKey(name: 'service_type') this.serviceType, @JsonKey(name: 'customer_phone') this.customerPhone});
  factory _ReadyJobModel.fromJson(Map<String, dynamic> json) => _$ReadyJobModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'job_number') final  String? jobNumber;
@override@JsonKey(name: 'customer_name') final  String? customerName;
@override@JsonKey(name: 'vehicle_number') final  String? vehicleNumber;
@override@JsonKey(name: 'service_type') final  String? serviceType;
@override@JsonKey(name: 'customer_phone') final  String? customerPhone;

/// Create a copy of ReadyJobModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyJobModelCopyWith<_ReadyJobModel> get copyWith => __$ReadyJobModelCopyWithImpl<_ReadyJobModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadyJobModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadyJobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobNumber, jobNumber) || other.jobNumber == jobNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobNumber,customerName,vehicleNumber,serviceType,customerPhone);

@override
String toString() {
  return 'ReadyJobModel(id: $id, jobNumber: $jobNumber, customerName: $customerName, vehicleNumber: $vehicleNumber, serviceType: $serviceType, customerPhone: $customerPhone)';
}


}

/// @nodoc
abstract mixin class _$ReadyJobModelCopyWith<$Res> implements $ReadyJobModelCopyWith<$Res> {
  factory _$ReadyJobModelCopyWith(_ReadyJobModel value, $Res Function(_ReadyJobModel) _then) = __$ReadyJobModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'job_number') String? jobNumber,@JsonKey(name: 'customer_name') String? customerName,@JsonKey(name: 'vehicle_number') String? vehicleNumber,@JsonKey(name: 'service_type') String? serviceType,@JsonKey(name: 'customer_phone') String? customerPhone
});




}
/// @nodoc
class __$ReadyJobModelCopyWithImpl<$Res>
    implements _$ReadyJobModelCopyWith<$Res> {
  __$ReadyJobModelCopyWithImpl(this._self, this._then);

  final _ReadyJobModel _self;
  final $Res Function(_ReadyJobModel) _then;

/// Create a copy of ReadyJobModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? jobNumber = freezed,Object? customerName = freezed,Object? vehicleNumber = freezed,Object? serviceType = freezed,Object? customerPhone = freezed,}) {
  return _then(_ReadyJobModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,jobNumber: freezed == jobNumber ? _self.jobNumber : jobNumber // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,vehicleNumber: freezed == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String?,serviceType: freezed == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String?,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
