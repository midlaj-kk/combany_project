// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_job_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceJobModel {

 int get id;@JsonKey(name: 'job_number') String get jobNumber; int get vehicle;@JsonKey(name: 'vehicle_number') String? get vehicleNumber;@JsonKey(name: 'customer_name') String? get customerName; String get complaint;@JsonKey(name: 'service_type') String get serviceType;@JsonKey(name: 'assigned_mechanic') int? get assignedMechanic;@JsonKey(name: 'mechanic_name') String? get mechanicName;@JsonKey(name: 'created_by') int? get createdBy; ServiceJobStatus? get status;@JsonKey(name: 'odometer_reading') int? get odometerReading;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of ServiceJobModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceJobModelCopyWith<ServiceJobModel> get copyWith => _$ServiceJobModelCopyWithImpl<ServiceJobModel>(this as ServiceJobModel, _$identity);

  /// Serializes this ServiceJobModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceJobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobNumber, jobNumber) || other.jobNumber == jobNumber)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.complaint, complaint) || other.complaint == complaint)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.assignedMechanic, assignedMechanic) || other.assignedMechanic == assignedMechanic)&&(identical(other.mechanicName, mechanicName) || other.mechanicName == mechanicName)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.status, status) || other.status == status)&&(identical(other.odometerReading, odometerReading) || other.odometerReading == odometerReading)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobNumber,vehicle,vehicleNumber,customerName,complaint,serviceType,assignedMechanic,mechanicName,createdBy,status,odometerReading,createdAt,updatedAt);

@override
String toString() {
  return 'ServiceJobModel(id: $id, jobNumber: $jobNumber, vehicle: $vehicle, vehicleNumber: $vehicleNumber, customerName: $customerName, complaint: $complaint, serviceType: $serviceType, assignedMechanic: $assignedMechanic, mechanicName: $mechanicName, createdBy: $createdBy, status: $status, odometerReading: $odometerReading, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ServiceJobModelCopyWith<$Res>  {
  factory $ServiceJobModelCopyWith(ServiceJobModel value, $Res Function(ServiceJobModel) _then) = _$ServiceJobModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'job_number') String jobNumber, int vehicle,@JsonKey(name: 'vehicle_number') String? vehicleNumber,@JsonKey(name: 'customer_name') String? customerName, String complaint,@JsonKey(name: 'service_type') String serviceType,@JsonKey(name: 'assigned_mechanic') int? assignedMechanic,@JsonKey(name: 'mechanic_name') String? mechanicName,@JsonKey(name: 'created_by') int? createdBy, ServiceJobStatus? status,@JsonKey(name: 'odometer_reading') int? odometerReading,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$ServiceJobModelCopyWithImpl<$Res>
    implements $ServiceJobModelCopyWith<$Res> {
  _$ServiceJobModelCopyWithImpl(this._self, this._then);

  final ServiceJobModel _self;
  final $Res Function(ServiceJobModel) _then;

/// Create a copy of ServiceJobModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? jobNumber = null,Object? vehicle = null,Object? vehicleNumber = freezed,Object? customerName = freezed,Object? complaint = null,Object? serviceType = null,Object? assignedMechanic = freezed,Object? mechanicName = freezed,Object? createdBy = freezed,Object? status = freezed,Object? odometerReading = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,jobNumber: null == jobNumber ? _self.jobNumber : jobNumber // ignore: cast_nullable_to_non_nullable
as String,vehicle: null == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as int,vehicleNumber: freezed == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,complaint: null == complaint ? _self.complaint : complaint // ignore: cast_nullable_to_non_nullable
as String,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String,assignedMechanic: freezed == assignedMechanic ? _self.assignedMechanic : assignedMechanic // ignore: cast_nullable_to_non_nullable
as int?,mechanicName: freezed == mechanicName ? _self.mechanicName : mechanicName // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ServiceJobStatus?,odometerReading: freezed == odometerReading ? _self.odometerReading : odometerReading // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceJobModel].
extension ServiceJobModelPatterns on ServiceJobModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceJobModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceJobModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceJobModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceJobModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceJobModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceJobModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'job_number')  String jobNumber,  int vehicle, @JsonKey(name: 'vehicle_number')  String? vehicleNumber, @JsonKey(name: 'customer_name')  String? customerName,  String complaint, @JsonKey(name: 'service_type')  String serviceType, @JsonKey(name: 'assigned_mechanic')  int? assignedMechanic, @JsonKey(name: 'mechanic_name')  String? mechanicName, @JsonKey(name: 'created_by')  int? createdBy,  ServiceJobStatus? status, @JsonKey(name: 'odometer_reading')  int? odometerReading, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceJobModel() when $default != null:
return $default(_that.id,_that.jobNumber,_that.vehicle,_that.vehicleNumber,_that.customerName,_that.complaint,_that.serviceType,_that.assignedMechanic,_that.mechanicName,_that.createdBy,_that.status,_that.odometerReading,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'job_number')  String jobNumber,  int vehicle, @JsonKey(name: 'vehicle_number')  String? vehicleNumber, @JsonKey(name: 'customer_name')  String? customerName,  String complaint, @JsonKey(name: 'service_type')  String serviceType, @JsonKey(name: 'assigned_mechanic')  int? assignedMechanic, @JsonKey(name: 'mechanic_name')  String? mechanicName, @JsonKey(name: 'created_by')  int? createdBy,  ServiceJobStatus? status, @JsonKey(name: 'odometer_reading')  int? odometerReading, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ServiceJobModel():
return $default(_that.id,_that.jobNumber,_that.vehicle,_that.vehicleNumber,_that.customerName,_that.complaint,_that.serviceType,_that.assignedMechanic,_that.mechanicName,_that.createdBy,_that.status,_that.odometerReading,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'job_number')  String jobNumber,  int vehicle, @JsonKey(name: 'vehicle_number')  String? vehicleNumber, @JsonKey(name: 'customer_name')  String? customerName,  String complaint, @JsonKey(name: 'service_type')  String serviceType, @JsonKey(name: 'assigned_mechanic')  int? assignedMechanic, @JsonKey(name: 'mechanic_name')  String? mechanicName, @JsonKey(name: 'created_by')  int? createdBy,  ServiceJobStatus? status, @JsonKey(name: 'odometer_reading')  int? odometerReading, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ServiceJobModel() when $default != null:
return $default(_that.id,_that.jobNumber,_that.vehicle,_that.vehicleNumber,_that.customerName,_that.complaint,_that.serviceType,_that.assignedMechanic,_that.mechanicName,_that.createdBy,_that.status,_that.odometerReading,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceJobModel implements ServiceJobModel {
  const _ServiceJobModel({required this.id, @JsonKey(name: 'job_number') required this.jobNumber, required this.vehicle, @JsonKey(name: 'vehicle_number') this.vehicleNumber, @JsonKey(name: 'customer_name') this.customerName, required this.complaint, @JsonKey(name: 'service_type') required this.serviceType, @JsonKey(name: 'assigned_mechanic') this.assignedMechanic, @JsonKey(name: 'mechanic_name') this.mechanicName, @JsonKey(name: 'created_by') this.createdBy, this.status, @JsonKey(name: 'odometer_reading') this.odometerReading, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _ServiceJobModel.fromJson(Map<String, dynamic> json) => _$ServiceJobModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'job_number') final  String jobNumber;
@override final  int vehicle;
@override@JsonKey(name: 'vehicle_number') final  String? vehicleNumber;
@override@JsonKey(name: 'customer_name') final  String? customerName;
@override final  String complaint;
@override@JsonKey(name: 'service_type') final  String serviceType;
@override@JsonKey(name: 'assigned_mechanic') final  int? assignedMechanic;
@override@JsonKey(name: 'mechanic_name') final  String? mechanicName;
@override@JsonKey(name: 'created_by') final  int? createdBy;
@override final  ServiceJobStatus? status;
@override@JsonKey(name: 'odometer_reading') final  int? odometerReading;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of ServiceJobModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceJobModelCopyWith<_ServiceJobModel> get copyWith => __$ServiceJobModelCopyWithImpl<_ServiceJobModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceJobModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceJobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobNumber, jobNumber) || other.jobNumber == jobNumber)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.complaint, complaint) || other.complaint == complaint)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.assignedMechanic, assignedMechanic) || other.assignedMechanic == assignedMechanic)&&(identical(other.mechanicName, mechanicName) || other.mechanicName == mechanicName)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.status, status) || other.status == status)&&(identical(other.odometerReading, odometerReading) || other.odometerReading == odometerReading)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobNumber,vehicle,vehicleNumber,customerName,complaint,serviceType,assignedMechanic,mechanicName,createdBy,status,odometerReading,createdAt,updatedAt);

@override
String toString() {
  return 'ServiceJobModel(id: $id, jobNumber: $jobNumber, vehicle: $vehicle, vehicleNumber: $vehicleNumber, customerName: $customerName, complaint: $complaint, serviceType: $serviceType, assignedMechanic: $assignedMechanic, mechanicName: $mechanicName, createdBy: $createdBy, status: $status, odometerReading: $odometerReading, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ServiceJobModelCopyWith<$Res> implements $ServiceJobModelCopyWith<$Res> {
  factory _$ServiceJobModelCopyWith(_ServiceJobModel value, $Res Function(_ServiceJobModel) _then) = __$ServiceJobModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'job_number') String jobNumber, int vehicle,@JsonKey(name: 'vehicle_number') String? vehicleNumber,@JsonKey(name: 'customer_name') String? customerName, String complaint,@JsonKey(name: 'service_type') String serviceType,@JsonKey(name: 'assigned_mechanic') int? assignedMechanic,@JsonKey(name: 'mechanic_name') String? mechanicName,@JsonKey(name: 'created_by') int? createdBy, ServiceJobStatus? status,@JsonKey(name: 'odometer_reading') int? odometerReading,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$ServiceJobModelCopyWithImpl<$Res>
    implements _$ServiceJobModelCopyWith<$Res> {
  __$ServiceJobModelCopyWithImpl(this._self, this._then);

  final _ServiceJobModel _self;
  final $Res Function(_ServiceJobModel) _then;

/// Create a copy of ServiceJobModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? jobNumber = null,Object? vehicle = null,Object? vehicleNumber = freezed,Object? customerName = freezed,Object? complaint = null,Object? serviceType = null,Object? assignedMechanic = freezed,Object? mechanicName = freezed,Object? createdBy = freezed,Object? status = freezed,Object? odometerReading = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ServiceJobModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,jobNumber: null == jobNumber ? _self.jobNumber : jobNumber // ignore: cast_nullable_to_non_nullable
as String,vehicle: null == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as int,vehicleNumber: freezed == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,complaint: null == complaint ? _self.complaint : complaint // ignore: cast_nullable_to_non_nullable
as String,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String,assignedMechanic: freezed == assignedMechanic ? _self.assignedMechanic : assignedMechanic // ignore: cast_nullable_to_non_nullable
as int?,mechanicName: freezed == mechanicName ? _self.mechanicName : mechanicName // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ServiceJobStatus?,odometerReading: freezed == odometerReading ? _self.odometerReading : odometerReading // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ServiceJobCreateRequest {

 int get vehicle; String get complaint;@JsonKey(name: 'service_type') String get serviceType;@JsonKey(name: 'assigned_mechanic') int? get assignedMechanic;@JsonKey(name: 'odometer_reading') int? get odometerReading;
/// Create a copy of ServiceJobCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceJobCreateRequestCopyWith<ServiceJobCreateRequest> get copyWith => _$ServiceJobCreateRequestCopyWithImpl<ServiceJobCreateRequest>(this as ServiceJobCreateRequest, _$identity);

  /// Serializes this ServiceJobCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceJobCreateRequest&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.complaint, complaint) || other.complaint == complaint)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.assignedMechanic, assignedMechanic) || other.assignedMechanic == assignedMechanic)&&(identical(other.odometerReading, odometerReading) || other.odometerReading == odometerReading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicle,complaint,serviceType,assignedMechanic,odometerReading);

@override
String toString() {
  return 'ServiceJobCreateRequest(vehicle: $vehicle, complaint: $complaint, serviceType: $serviceType, assignedMechanic: $assignedMechanic, odometerReading: $odometerReading)';
}


}

/// @nodoc
abstract mixin class $ServiceJobCreateRequestCopyWith<$Res>  {
  factory $ServiceJobCreateRequestCopyWith(ServiceJobCreateRequest value, $Res Function(ServiceJobCreateRequest) _then) = _$ServiceJobCreateRequestCopyWithImpl;
@useResult
$Res call({
 int vehicle, String complaint,@JsonKey(name: 'service_type') String serviceType,@JsonKey(name: 'assigned_mechanic') int? assignedMechanic,@JsonKey(name: 'odometer_reading') int? odometerReading
});




}
/// @nodoc
class _$ServiceJobCreateRequestCopyWithImpl<$Res>
    implements $ServiceJobCreateRequestCopyWith<$Res> {
  _$ServiceJobCreateRequestCopyWithImpl(this._self, this._then);

  final ServiceJobCreateRequest _self;
  final $Res Function(ServiceJobCreateRequest) _then;

/// Create a copy of ServiceJobCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicle = null,Object? complaint = null,Object? serviceType = null,Object? assignedMechanic = freezed,Object? odometerReading = freezed,}) {
  return _then(_self.copyWith(
vehicle: null == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as int,complaint: null == complaint ? _self.complaint : complaint // ignore: cast_nullable_to_non_nullable
as String,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String,assignedMechanic: freezed == assignedMechanic ? _self.assignedMechanic : assignedMechanic // ignore: cast_nullable_to_non_nullable
as int?,odometerReading: freezed == odometerReading ? _self.odometerReading : odometerReading // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceJobCreateRequest].
extension ServiceJobCreateRequestPatterns on ServiceJobCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceJobCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceJobCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceJobCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _ServiceJobCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceJobCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceJobCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int vehicle,  String complaint, @JsonKey(name: 'service_type')  String serviceType, @JsonKey(name: 'assigned_mechanic')  int? assignedMechanic, @JsonKey(name: 'odometer_reading')  int? odometerReading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceJobCreateRequest() when $default != null:
return $default(_that.vehicle,_that.complaint,_that.serviceType,_that.assignedMechanic,_that.odometerReading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int vehicle,  String complaint, @JsonKey(name: 'service_type')  String serviceType, @JsonKey(name: 'assigned_mechanic')  int? assignedMechanic, @JsonKey(name: 'odometer_reading')  int? odometerReading)  $default,) {final _that = this;
switch (_that) {
case _ServiceJobCreateRequest():
return $default(_that.vehicle,_that.complaint,_that.serviceType,_that.assignedMechanic,_that.odometerReading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int vehicle,  String complaint, @JsonKey(name: 'service_type')  String serviceType, @JsonKey(name: 'assigned_mechanic')  int? assignedMechanic, @JsonKey(name: 'odometer_reading')  int? odometerReading)?  $default,) {final _that = this;
switch (_that) {
case _ServiceJobCreateRequest() when $default != null:
return $default(_that.vehicle,_that.complaint,_that.serviceType,_that.assignedMechanic,_that.odometerReading);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceJobCreateRequest implements ServiceJobCreateRequest {
  const _ServiceJobCreateRequest({required this.vehicle, required this.complaint, @JsonKey(name: 'service_type') required this.serviceType, @JsonKey(name: 'assigned_mechanic') this.assignedMechanic, @JsonKey(name: 'odometer_reading') this.odometerReading});
  factory _ServiceJobCreateRequest.fromJson(Map<String, dynamic> json) => _$ServiceJobCreateRequestFromJson(json);

@override final  int vehicle;
@override final  String complaint;
@override@JsonKey(name: 'service_type') final  String serviceType;
@override@JsonKey(name: 'assigned_mechanic') final  int? assignedMechanic;
@override@JsonKey(name: 'odometer_reading') final  int? odometerReading;

/// Create a copy of ServiceJobCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceJobCreateRequestCopyWith<_ServiceJobCreateRequest> get copyWith => __$ServiceJobCreateRequestCopyWithImpl<_ServiceJobCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceJobCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceJobCreateRequest&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.complaint, complaint) || other.complaint == complaint)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.assignedMechanic, assignedMechanic) || other.assignedMechanic == assignedMechanic)&&(identical(other.odometerReading, odometerReading) || other.odometerReading == odometerReading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicle,complaint,serviceType,assignedMechanic,odometerReading);

@override
String toString() {
  return 'ServiceJobCreateRequest(vehicle: $vehicle, complaint: $complaint, serviceType: $serviceType, assignedMechanic: $assignedMechanic, odometerReading: $odometerReading)';
}


}

/// @nodoc
abstract mixin class _$ServiceJobCreateRequestCopyWith<$Res> implements $ServiceJobCreateRequestCopyWith<$Res> {
  factory _$ServiceJobCreateRequestCopyWith(_ServiceJobCreateRequest value, $Res Function(_ServiceJobCreateRequest) _then) = __$ServiceJobCreateRequestCopyWithImpl;
@override @useResult
$Res call({
 int vehicle, String complaint,@JsonKey(name: 'service_type') String serviceType,@JsonKey(name: 'assigned_mechanic') int? assignedMechanic,@JsonKey(name: 'odometer_reading') int? odometerReading
});




}
/// @nodoc
class __$ServiceJobCreateRequestCopyWithImpl<$Res>
    implements _$ServiceJobCreateRequestCopyWith<$Res> {
  __$ServiceJobCreateRequestCopyWithImpl(this._self, this._then);

  final _ServiceJobCreateRequest _self;
  final $Res Function(_ServiceJobCreateRequest) _then;

/// Create a copy of ServiceJobCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicle = null,Object? complaint = null,Object? serviceType = null,Object? assignedMechanic = freezed,Object? odometerReading = freezed,}) {
  return _then(_ServiceJobCreateRequest(
vehicle: null == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as int,complaint: null == complaint ? _self.complaint : complaint // ignore: cast_nullable_to_non_nullable
as String,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String,assignedMechanic: freezed == assignedMechanic ? _self.assignedMechanic : assignedMechanic // ignore: cast_nullable_to_non_nullable
as int?,odometerReading: freezed == odometerReading ? _self.odometerReading : odometerReading // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PaginatedServiceJobList {

 int get count; String? get next; String? get previous; List<ServiceJobModel> get results;
/// Create a copy of PaginatedServiceJobList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedServiceJobListCopyWith<PaginatedServiceJobList> get copyWith => _$PaginatedServiceJobListCopyWithImpl<PaginatedServiceJobList>(this as PaginatedServiceJobList, _$identity);

  /// Serializes this PaginatedServiceJobList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedServiceJobList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PaginatedServiceJobList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedServiceJobListCopyWith<$Res>  {
  factory $PaginatedServiceJobListCopyWith(PaginatedServiceJobList value, $Res Function(PaginatedServiceJobList) _then) = _$PaginatedServiceJobListCopyWithImpl;
@useResult
$Res call({
 int count, String? next, String? previous, List<ServiceJobModel> results
});




}
/// @nodoc
class _$PaginatedServiceJobListCopyWithImpl<$Res>
    implements $PaginatedServiceJobListCopyWith<$Res> {
  _$PaginatedServiceJobListCopyWithImpl(this._self, this._then);

  final PaginatedServiceJobList _self;
  final $Res Function(PaginatedServiceJobList) _then;

/// Create a copy of PaginatedServiceJobList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<ServiceJobModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedServiceJobList].
extension PaginatedServiceJobListPatterns on PaginatedServiceJobList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedServiceJobList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedServiceJobList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedServiceJobList value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedServiceJobList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedServiceJobList value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedServiceJobList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<ServiceJobModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedServiceJobList() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<ServiceJobModel> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedServiceJobList():
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String? next,  String? previous,  List<ServiceJobModel> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedServiceJobList() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedServiceJobList implements PaginatedServiceJobList {
  const _PaginatedServiceJobList({required this.count, this.next, this.previous, required final  List<ServiceJobModel> results}): _results = results;
  factory _PaginatedServiceJobList.fromJson(Map<String, dynamic> json) => _$PaginatedServiceJobListFromJson(json);

@override final  int count;
@override final  String? next;
@override final  String? previous;
 final  List<ServiceJobModel> _results;
@override List<ServiceJobModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedServiceJobList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedServiceJobListCopyWith<_PaginatedServiceJobList> get copyWith => __$PaginatedServiceJobListCopyWithImpl<_PaginatedServiceJobList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedServiceJobListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedServiceJobList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PaginatedServiceJobList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedServiceJobListCopyWith<$Res> implements $PaginatedServiceJobListCopyWith<$Res> {
  factory _$PaginatedServiceJobListCopyWith(_PaginatedServiceJobList value, $Res Function(_PaginatedServiceJobList) _then) = __$PaginatedServiceJobListCopyWithImpl;
@override @useResult
$Res call({
 int count, String? next, String? previous, List<ServiceJobModel> results
});




}
/// @nodoc
class __$PaginatedServiceJobListCopyWithImpl<$Res>
    implements _$PaginatedServiceJobListCopyWith<$Res> {
  __$PaginatedServiceJobListCopyWithImpl(this._self, this._then);

  final _PaginatedServiceJobList _self;
  final $Res Function(_PaginatedServiceJobList) _then;

/// Create a copy of PaginatedServiceJobList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PaginatedServiceJobList(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<ServiceJobModel>,
  ));
}


}

// dart format on
