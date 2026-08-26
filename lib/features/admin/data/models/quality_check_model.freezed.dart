// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quality_check_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QualityCheckModel {

 int get id;@JsonKey(name: 'brake_check') TestDriveEnum? get brakeCheck;@JsonKey(name: 'engine_check') TestDriveEnum? get engineCheck;@JsonKey(name: 'oil_leakage_check') OilLeakageCheckEnum? get oilLeakageCheck;@JsonKey(name: 'ac_check') TestDriveEnum? get acCheck;@JsonKey(name: 'tyre_check') TestDriveEnum? get tyreCheck;@JsonKey(name: 'test_drive') TestDriveEnum? get testDrive;@JsonKey(name: 'overall_status') OverallStatusEnum? get overallStatus; String? get remarks;@JsonKey(name: 'service_job') int get serviceJob;@JsonKey(name: 'checked_by') int? get checkedBy;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of QualityCheckModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QualityCheckModelCopyWith<QualityCheckModel> get copyWith => _$QualityCheckModelCopyWithImpl<QualityCheckModel>(this as QualityCheckModel, _$identity);

  /// Serializes this QualityCheckModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QualityCheckModel&&(identical(other.id, id) || other.id == id)&&(identical(other.brakeCheck, brakeCheck) || other.brakeCheck == brakeCheck)&&(identical(other.engineCheck, engineCheck) || other.engineCheck == engineCheck)&&(identical(other.oilLeakageCheck, oilLeakageCheck) || other.oilLeakageCheck == oilLeakageCheck)&&(identical(other.acCheck, acCheck) || other.acCheck == acCheck)&&(identical(other.tyreCheck, tyreCheck) || other.tyreCheck == tyreCheck)&&(identical(other.testDrive, testDrive) || other.testDrive == testDrive)&&(identical(other.overallStatus, overallStatus) || other.overallStatus == overallStatus)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob)&&(identical(other.checkedBy, checkedBy) || other.checkedBy == checkedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brakeCheck,engineCheck,oilLeakageCheck,acCheck,tyreCheck,testDrive,overallStatus,remarks,serviceJob,checkedBy,createdAt,updatedAt);

@override
String toString() {
  return 'QualityCheckModel(id: $id, brakeCheck: $brakeCheck, engineCheck: $engineCheck, oilLeakageCheck: $oilLeakageCheck, acCheck: $acCheck, tyreCheck: $tyreCheck, testDrive: $testDrive, overallStatus: $overallStatus, remarks: $remarks, serviceJob: $serviceJob, checkedBy: $checkedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $QualityCheckModelCopyWith<$Res>  {
  factory $QualityCheckModelCopyWith(QualityCheckModel value, $Res Function(QualityCheckModel) _then) = _$QualityCheckModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'brake_check') TestDriveEnum? brakeCheck,@JsonKey(name: 'engine_check') TestDriveEnum? engineCheck,@JsonKey(name: 'oil_leakage_check') OilLeakageCheckEnum? oilLeakageCheck,@JsonKey(name: 'ac_check') TestDriveEnum? acCheck,@JsonKey(name: 'tyre_check') TestDriveEnum? tyreCheck,@JsonKey(name: 'test_drive') TestDriveEnum? testDrive,@JsonKey(name: 'overall_status') OverallStatusEnum? overallStatus, String? remarks,@JsonKey(name: 'service_job') int serviceJob,@JsonKey(name: 'checked_by') int? checkedBy,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$QualityCheckModelCopyWithImpl<$Res>
    implements $QualityCheckModelCopyWith<$Res> {
  _$QualityCheckModelCopyWithImpl(this._self, this._then);

  final QualityCheckModel _self;
  final $Res Function(QualityCheckModel) _then;

/// Create a copy of QualityCheckModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? brakeCheck = freezed,Object? engineCheck = freezed,Object? oilLeakageCheck = freezed,Object? acCheck = freezed,Object? tyreCheck = freezed,Object? testDrive = freezed,Object? overallStatus = freezed,Object? remarks = freezed,Object? serviceJob = null,Object? checkedBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brakeCheck: freezed == brakeCheck ? _self.brakeCheck : brakeCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum?,engineCheck: freezed == engineCheck ? _self.engineCheck : engineCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum?,oilLeakageCheck: freezed == oilLeakageCheck ? _self.oilLeakageCheck : oilLeakageCheck // ignore: cast_nullable_to_non_nullable
as OilLeakageCheckEnum?,acCheck: freezed == acCheck ? _self.acCheck : acCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum?,tyreCheck: freezed == tyreCheck ? _self.tyreCheck : tyreCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum?,testDrive: freezed == testDrive ? _self.testDrive : testDrive // ignore: cast_nullable_to_non_nullable
as TestDriveEnum?,overallStatus: freezed == overallStatus ? _self.overallStatus : overallStatus // ignore: cast_nullable_to_non_nullable
as OverallStatusEnum?,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,checkedBy: freezed == checkedBy ? _self.checkedBy : checkedBy // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [QualityCheckModel].
extension QualityCheckModelPatterns on QualityCheckModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QualityCheckModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QualityCheckModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QualityCheckModel value)  $default,){
final _that = this;
switch (_that) {
case _QualityCheckModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QualityCheckModel value)?  $default,){
final _that = this;
switch (_that) {
case _QualityCheckModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'brake_check')  TestDriveEnum? brakeCheck, @JsonKey(name: 'engine_check')  TestDriveEnum? engineCheck, @JsonKey(name: 'oil_leakage_check')  OilLeakageCheckEnum? oilLeakageCheck, @JsonKey(name: 'ac_check')  TestDriveEnum? acCheck, @JsonKey(name: 'tyre_check')  TestDriveEnum? tyreCheck, @JsonKey(name: 'test_drive')  TestDriveEnum? testDrive, @JsonKey(name: 'overall_status')  OverallStatusEnum? overallStatus,  String? remarks, @JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'checked_by')  int? checkedBy, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QualityCheckModel() when $default != null:
return $default(_that.id,_that.brakeCheck,_that.engineCheck,_that.oilLeakageCheck,_that.acCheck,_that.tyreCheck,_that.testDrive,_that.overallStatus,_that.remarks,_that.serviceJob,_that.checkedBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'brake_check')  TestDriveEnum? brakeCheck, @JsonKey(name: 'engine_check')  TestDriveEnum? engineCheck, @JsonKey(name: 'oil_leakage_check')  OilLeakageCheckEnum? oilLeakageCheck, @JsonKey(name: 'ac_check')  TestDriveEnum? acCheck, @JsonKey(name: 'tyre_check')  TestDriveEnum? tyreCheck, @JsonKey(name: 'test_drive')  TestDriveEnum? testDrive, @JsonKey(name: 'overall_status')  OverallStatusEnum? overallStatus,  String? remarks, @JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'checked_by')  int? checkedBy, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _QualityCheckModel():
return $default(_that.id,_that.brakeCheck,_that.engineCheck,_that.oilLeakageCheck,_that.acCheck,_that.tyreCheck,_that.testDrive,_that.overallStatus,_that.remarks,_that.serviceJob,_that.checkedBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'brake_check')  TestDriveEnum? brakeCheck, @JsonKey(name: 'engine_check')  TestDriveEnum? engineCheck, @JsonKey(name: 'oil_leakage_check')  OilLeakageCheckEnum? oilLeakageCheck, @JsonKey(name: 'ac_check')  TestDriveEnum? acCheck, @JsonKey(name: 'tyre_check')  TestDriveEnum? tyreCheck, @JsonKey(name: 'test_drive')  TestDriveEnum? testDrive, @JsonKey(name: 'overall_status')  OverallStatusEnum? overallStatus,  String? remarks, @JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'checked_by')  int? checkedBy, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _QualityCheckModel() when $default != null:
return $default(_that.id,_that.brakeCheck,_that.engineCheck,_that.oilLeakageCheck,_that.acCheck,_that.tyreCheck,_that.testDrive,_that.overallStatus,_that.remarks,_that.serviceJob,_that.checkedBy,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QualityCheckModel implements QualityCheckModel {
  const _QualityCheckModel({required this.id, @JsonKey(name: 'brake_check') this.brakeCheck, @JsonKey(name: 'engine_check') this.engineCheck, @JsonKey(name: 'oil_leakage_check') this.oilLeakageCheck, @JsonKey(name: 'ac_check') this.acCheck, @JsonKey(name: 'tyre_check') this.tyreCheck, @JsonKey(name: 'test_drive') this.testDrive, @JsonKey(name: 'overall_status') this.overallStatus, this.remarks, @JsonKey(name: 'service_job') required this.serviceJob, @JsonKey(name: 'checked_by') this.checkedBy, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _QualityCheckModel.fromJson(Map<String, dynamic> json) => _$QualityCheckModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'brake_check') final  TestDriveEnum? brakeCheck;
@override@JsonKey(name: 'engine_check') final  TestDriveEnum? engineCheck;
@override@JsonKey(name: 'oil_leakage_check') final  OilLeakageCheckEnum? oilLeakageCheck;
@override@JsonKey(name: 'ac_check') final  TestDriveEnum? acCheck;
@override@JsonKey(name: 'tyre_check') final  TestDriveEnum? tyreCheck;
@override@JsonKey(name: 'test_drive') final  TestDriveEnum? testDrive;
@override@JsonKey(name: 'overall_status') final  OverallStatusEnum? overallStatus;
@override final  String? remarks;
@override@JsonKey(name: 'service_job') final  int serviceJob;
@override@JsonKey(name: 'checked_by') final  int? checkedBy;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of QualityCheckModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QualityCheckModelCopyWith<_QualityCheckModel> get copyWith => __$QualityCheckModelCopyWithImpl<_QualityCheckModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QualityCheckModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QualityCheckModel&&(identical(other.id, id) || other.id == id)&&(identical(other.brakeCheck, brakeCheck) || other.brakeCheck == brakeCheck)&&(identical(other.engineCheck, engineCheck) || other.engineCheck == engineCheck)&&(identical(other.oilLeakageCheck, oilLeakageCheck) || other.oilLeakageCheck == oilLeakageCheck)&&(identical(other.acCheck, acCheck) || other.acCheck == acCheck)&&(identical(other.tyreCheck, tyreCheck) || other.tyreCheck == tyreCheck)&&(identical(other.testDrive, testDrive) || other.testDrive == testDrive)&&(identical(other.overallStatus, overallStatus) || other.overallStatus == overallStatus)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob)&&(identical(other.checkedBy, checkedBy) || other.checkedBy == checkedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brakeCheck,engineCheck,oilLeakageCheck,acCheck,tyreCheck,testDrive,overallStatus,remarks,serviceJob,checkedBy,createdAt,updatedAt);

@override
String toString() {
  return 'QualityCheckModel(id: $id, brakeCheck: $brakeCheck, engineCheck: $engineCheck, oilLeakageCheck: $oilLeakageCheck, acCheck: $acCheck, tyreCheck: $tyreCheck, testDrive: $testDrive, overallStatus: $overallStatus, remarks: $remarks, serviceJob: $serviceJob, checkedBy: $checkedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$QualityCheckModelCopyWith<$Res> implements $QualityCheckModelCopyWith<$Res> {
  factory _$QualityCheckModelCopyWith(_QualityCheckModel value, $Res Function(_QualityCheckModel) _then) = __$QualityCheckModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'brake_check') TestDriveEnum? brakeCheck,@JsonKey(name: 'engine_check') TestDriveEnum? engineCheck,@JsonKey(name: 'oil_leakage_check') OilLeakageCheckEnum? oilLeakageCheck,@JsonKey(name: 'ac_check') TestDriveEnum? acCheck,@JsonKey(name: 'tyre_check') TestDriveEnum? tyreCheck,@JsonKey(name: 'test_drive') TestDriveEnum? testDrive,@JsonKey(name: 'overall_status') OverallStatusEnum? overallStatus, String? remarks,@JsonKey(name: 'service_job') int serviceJob,@JsonKey(name: 'checked_by') int? checkedBy,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$QualityCheckModelCopyWithImpl<$Res>
    implements _$QualityCheckModelCopyWith<$Res> {
  __$QualityCheckModelCopyWithImpl(this._self, this._then);

  final _QualityCheckModel _self;
  final $Res Function(_QualityCheckModel) _then;

/// Create a copy of QualityCheckModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? brakeCheck = freezed,Object? engineCheck = freezed,Object? oilLeakageCheck = freezed,Object? acCheck = freezed,Object? tyreCheck = freezed,Object? testDrive = freezed,Object? overallStatus = freezed,Object? remarks = freezed,Object? serviceJob = null,Object? checkedBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_QualityCheckModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brakeCheck: freezed == brakeCheck ? _self.brakeCheck : brakeCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum?,engineCheck: freezed == engineCheck ? _self.engineCheck : engineCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum?,oilLeakageCheck: freezed == oilLeakageCheck ? _self.oilLeakageCheck : oilLeakageCheck // ignore: cast_nullable_to_non_nullable
as OilLeakageCheckEnum?,acCheck: freezed == acCheck ? _self.acCheck : acCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum?,tyreCheck: freezed == tyreCheck ? _self.tyreCheck : tyreCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum?,testDrive: freezed == testDrive ? _self.testDrive : testDrive // ignore: cast_nullable_to_non_nullable
as TestDriveEnum?,overallStatus: freezed == overallStatus ? _self.overallStatus : overallStatus // ignore: cast_nullable_to_non_nullable
as OverallStatusEnum?,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,checkedBy: freezed == checkedBy ? _self.checkedBy : checkedBy // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$QualityCheckCreateRequest {

@JsonKey(name: 'brake_check') TestDriveEnum get brakeCheck;@JsonKey(name: 'engine_check') TestDriveEnum get engineCheck;@JsonKey(name: 'oil_leakage_check') OilLeakageCheckEnum get oilLeakageCheck;@JsonKey(name: 'ac_check') TestDriveEnum get acCheck;@JsonKey(name: 'tyre_check') TestDriveEnum get tyreCheck;@JsonKey(name: 'test_drive') TestDriveEnum get testDrive;@JsonKey(name: 'overall_status') OverallStatusEnum get overallStatus; String? get remarks;@JsonKey(name: 'service_job') int get serviceJob;
/// Create a copy of QualityCheckCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QualityCheckCreateRequestCopyWith<QualityCheckCreateRequest> get copyWith => _$QualityCheckCreateRequestCopyWithImpl<QualityCheckCreateRequest>(this as QualityCheckCreateRequest, _$identity);

  /// Serializes this QualityCheckCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QualityCheckCreateRequest&&(identical(other.brakeCheck, brakeCheck) || other.brakeCheck == brakeCheck)&&(identical(other.engineCheck, engineCheck) || other.engineCheck == engineCheck)&&(identical(other.oilLeakageCheck, oilLeakageCheck) || other.oilLeakageCheck == oilLeakageCheck)&&(identical(other.acCheck, acCheck) || other.acCheck == acCheck)&&(identical(other.tyreCheck, tyreCheck) || other.tyreCheck == tyreCheck)&&(identical(other.testDrive, testDrive) || other.testDrive == testDrive)&&(identical(other.overallStatus, overallStatus) || other.overallStatus == overallStatus)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brakeCheck,engineCheck,oilLeakageCheck,acCheck,tyreCheck,testDrive,overallStatus,remarks,serviceJob);

@override
String toString() {
  return 'QualityCheckCreateRequest(brakeCheck: $brakeCheck, engineCheck: $engineCheck, oilLeakageCheck: $oilLeakageCheck, acCheck: $acCheck, tyreCheck: $tyreCheck, testDrive: $testDrive, overallStatus: $overallStatus, remarks: $remarks, serviceJob: $serviceJob)';
}


}

/// @nodoc
abstract mixin class $QualityCheckCreateRequestCopyWith<$Res>  {
  factory $QualityCheckCreateRequestCopyWith(QualityCheckCreateRequest value, $Res Function(QualityCheckCreateRequest) _then) = _$QualityCheckCreateRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'brake_check') TestDriveEnum brakeCheck,@JsonKey(name: 'engine_check') TestDriveEnum engineCheck,@JsonKey(name: 'oil_leakage_check') OilLeakageCheckEnum oilLeakageCheck,@JsonKey(name: 'ac_check') TestDriveEnum acCheck,@JsonKey(name: 'tyre_check') TestDriveEnum tyreCheck,@JsonKey(name: 'test_drive') TestDriveEnum testDrive,@JsonKey(name: 'overall_status') OverallStatusEnum overallStatus, String? remarks,@JsonKey(name: 'service_job') int serviceJob
});




}
/// @nodoc
class _$QualityCheckCreateRequestCopyWithImpl<$Res>
    implements $QualityCheckCreateRequestCopyWith<$Res> {
  _$QualityCheckCreateRequestCopyWithImpl(this._self, this._then);

  final QualityCheckCreateRequest _self;
  final $Res Function(QualityCheckCreateRequest) _then;

/// Create a copy of QualityCheckCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? brakeCheck = null,Object? engineCheck = null,Object? oilLeakageCheck = null,Object? acCheck = null,Object? tyreCheck = null,Object? testDrive = null,Object? overallStatus = null,Object? remarks = freezed,Object? serviceJob = null,}) {
  return _then(_self.copyWith(
brakeCheck: null == brakeCheck ? _self.brakeCheck : brakeCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum,engineCheck: null == engineCheck ? _self.engineCheck : engineCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum,oilLeakageCheck: null == oilLeakageCheck ? _self.oilLeakageCheck : oilLeakageCheck // ignore: cast_nullable_to_non_nullable
as OilLeakageCheckEnum,acCheck: null == acCheck ? _self.acCheck : acCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum,tyreCheck: null == tyreCheck ? _self.tyreCheck : tyreCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum,testDrive: null == testDrive ? _self.testDrive : testDrive // ignore: cast_nullable_to_non_nullable
as TestDriveEnum,overallStatus: null == overallStatus ? _self.overallStatus : overallStatus // ignore: cast_nullable_to_non_nullable
as OverallStatusEnum,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QualityCheckCreateRequest].
extension QualityCheckCreateRequestPatterns on QualityCheckCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QualityCheckCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QualityCheckCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QualityCheckCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _QualityCheckCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QualityCheckCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _QualityCheckCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'brake_check')  TestDriveEnum brakeCheck, @JsonKey(name: 'engine_check')  TestDriveEnum engineCheck, @JsonKey(name: 'oil_leakage_check')  OilLeakageCheckEnum oilLeakageCheck, @JsonKey(name: 'ac_check')  TestDriveEnum acCheck, @JsonKey(name: 'tyre_check')  TestDriveEnum tyreCheck, @JsonKey(name: 'test_drive')  TestDriveEnum testDrive, @JsonKey(name: 'overall_status')  OverallStatusEnum overallStatus,  String? remarks, @JsonKey(name: 'service_job')  int serviceJob)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QualityCheckCreateRequest() when $default != null:
return $default(_that.brakeCheck,_that.engineCheck,_that.oilLeakageCheck,_that.acCheck,_that.tyreCheck,_that.testDrive,_that.overallStatus,_that.remarks,_that.serviceJob);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'brake_check')  TestDriveEnum brakeCheck, @JsonKey(name: 'engine_check')  TestDriveEnum engineCheck, @JsonKey(name: 'oil_leakage_check')  OilLeakageCheckEnum oilLeakageCheck, @JsonKey(name: 'ac_check')  TestDriveEnum acCheck, @JsonKey(name: 'tyre_check')  TestDriveEnum tyreCheck, @JsonKey(name: 'test_drive')  TestDriveEnum testDrive, @JsonKey(name: 'overall_status')  OverallStatusEnum overallStatus,  String? remarks, @JsonKey(name: 'service_job')  int serviceJob)  $default,) {final _that = this;
switch (_that) {
case _QualityCheckCreateRequest():
return $default(_that.brakeCheck,_that.engineCheck,_that.oilLeakageCheck,_that.acCheck,_that.tyreCheck,_that.testDrive,_that.overallStatus,_that.remarks,_that.serviceJob);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'brake_check')  TestDriveEnum brakeCheck, @JsonKey(name: 'engine_check')  TestDriveEnum engineCheck, @JsonKey(name: 'oil_leakage_check')  OilLeakageCheckEnum oilLeakageCheck, @JsonKey(name: 'ac_check')  TestDriveEnum acCheck, @JsonKey(name: 'tyre_check')  TestDriveEnum tyreCheck, @JsonKey(name: 'test_drive')  TestDriveEnum testDrive, @JsonKey(name: 'overall_status')  OverallStatusEnum overallStatus,  String? remarks, @JsonKey(name: 'service_job')  int serviceJob)?  $default,) {final _that = this;
switch (_that) {
case _QualityCheckCreateRequest() when $default != null:
return $default(_that.brakeCheck,_that.engineCheck,_that.oilLeakageCheck,_that.acCheck,_that.tyreCheck,_that.testDrive,_that.overallStatus,_that.remarks,_that.serviceJob);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QualityCheckCreateRequest implements QualityCheckCreateRequest {
  const _QualityCheckCreateRequest({@JsonKey(name: 'brake_check') required this.brakeCheck, @JsonKey(name: 'engine_check') required this.engineCheck, @JsonKey(name: 'oil_leakage_check') required this.oilLeakageCheck, @JsonKey(name: 'ac_check') required this.acCheck, @JsonKey(name: 'tyre_check') required this.tyreCheck, @JsonKey(name: 'test_drive') required this.testDrive, @JsonKey(name: 'overall_status') required this.overallStatus, this.remarks, @JsonKey(name: 'service_job') required this.serviceJob});
  factory _QualityCheckCreateRequest.fromJson(Map<String, dynamic> json) => _$QualityCheckCreateRequestFromJson(json);

@override@JsonKey(name: 'brake_check') final  TestDriveEnum brakeCheck;
@override@JsonKey(name: 'engine_check') final  TestDriveEnum engineCheck;
@override@JsonKey(name: 'oil_leakage_check') final  OilLeakageCheckEnum oilLeakageCheck;
@override@JsonKey(name: 'ac_check') final  TestDriveEnum acCheck;
@override@JsonKey(name: 'tyre_check') final  TestDriveEnum tyreCheck;
@override@JsonKey(name: 'test_drive') final  TestDriveEnum testDrive;
@override@JsonKey(name: 'overall_status') final  OverallStatusEnum overallStatus;
@override final  String? remarks;
@override@JsonKey(name: 'service_job') final  int serviceJob;

/// Create a copy of QualityCheckCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QualityCheckCreateRequestCopyWith<_QualityCheckCreateRequest> get copyWith => __$QualityCheckCreateRequestCopyWithImpl<_QualityCheckCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QualityCheckCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QualityCheckCreateRequest&&(identical(other.brakeCheck, brakeCheck) || other.brakeCheck == brakeCheck)&&(identical(other.engineCheck, engineCheck) || other.engineCheck == engineCheck)&&(identical(other.oilLeakageCheck, oilLeakageCheck) || other.oilLeakageCheck == oilLeakageCheck)&&(identical(other.acCheck, acCheck) || other.acCheck == acCheck)&&(identical(other.tyreCheck, tyreCheck) || other.tyreCheck == tyreCheck)&&(identical(other.testDrive, testDrive) || other.testDrive == testDrive)&&(identical(other.overallStatus, overallStatus) || other.overallStatus == overallStatus)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brakeCheck,engineCheck,oilLeakageCheck,acCheck,tyreCheck,testDrive,overallStatus,remarks,serviceJob);

@override
String toString() {
  return 'QualityCheckCreateRequest(brakeCheck: $brakeCheck, engineCheck: $engineCheck, oilLeakageCheck: $oilLeakageCheck, acCheck: $acCheck, tyreCheck: $tyreCheck, testDrive: $testDrive, overallStatus: $overallStatus, remarks: $remarks, serviceJob: $serviceJob)';
}


}

/// @nodoc
abstract mixin class _$QualityCheckCreateRequestCopyWith<$Res> implements $QualityCheckCreateRequestCopyWith<$Res> {
  factory _$QualityCheckCreateRequestCopyWith(_QualityCheckCreateRequest value, $Res Function(_QualityCheckCreateRequest) _then) = __$QualityCheckCreateRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'brake_check') TestDriveEnum brakeCheck,@JsonKey(name: 'engine_check') TestDriveEnum engineCheck,@JsonKey(name: 'oil_leakage_check') OilLeakageCheckEnum oilLeakageCheck,@JsonKey(name: 'ac_check') TestDriveEnum acCheck,@JsonKey(name: 'tyre_check') TestDriveEnum tyreCheck,@JsonKey(name: 'test_drive') TestDriveEnum testDrive,@JsonKey(name: 'overall_status') OverallStatusEnum overallStatus, String? remarks,@JsonKey(name: 'service_job') int serviceJob
});




}
/// @nodoc
class __$QualityCheckCreateRequestCopyWithImpl<$Res>
    implements _$QualityCheckCreateRequestCopyWith<$Res> {
  __$QualityCheckCreateRequestCopyWithImpl(this._self, this._then);

  final _QualityCheckCreateRequest _self;
  final $Res Function(_QualityCheckCreateRequest) _then;

/// Create a copy of QualityCheckCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? brakeCheck = null,Object? engineCheck = null,Object? oilLeakageCheck = null,Object? acCheck = null,Object? tyreCheck = null,Object? testDrive = null,Object? overallStatus = null,Object? remarks = freezed,Object? serviceJob = null,}) {
  return _then(_QualityCheckCreateRequest(
brakeCheck: null == brakeCheck ? _self.brakeCheck : brakeCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum,engineCheck: null == engineCheck ? _self.engineCheck : engineCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum,oilLeakageCheck: null == oilLeakageCheck ? _self.oilLeakageCheck : oilLeakageCheck // ignore: cast_nullable_to_non_nullable
as OilLeakageCheckEnum,acCheck: null == acCheck ? _self.acCheck : acCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum,tyreCheck: null == tyreCheck ? _self.tyreCheck : tyreCheck // ignore: cast_nullable_to_non_nullable
as TestDriveEnum,testDrive: null == testDrive ? _self.testDrive : testDrive // ignore: cast_nullable_to_non_nullable
as TestDriveEnum,overallStatus: null == overallStatus ? _self.overallStatus : overallStatus // ignore: cast_nullable_to_non_nullable
as OverallStatusEnum,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PaginatedQualityCheckList {

 int get count; String? get next; String? get previous; List<QualityCheckModel> get results;
/// Create a copy of PaginatedQualityCheckList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedQualityCheckListCopyWith<PaginatedQualityCheckList> get copyWith => _$PaginatedQualityCheckListCopyWithImpl<PaginatedQualityCheckList>(this as PaginatedQualityCheckList, _$identity);

  /// Serializes this PaginatedQualityCheckList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedQualityCheckList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PaginatedQualityCheckList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedQualityCheckListCopyWith<$Res>  {
  factory $PaginatedQualityCheckListCopyWith(PaginatedQualityCheckList value, $Res Function(PaginatedQualityCheckList) _then) = _$PaginatedQualityCheckListCopyWithImpl;
@useResult
$Res call({
 int count, String? next, String? previous, List<QualityCheckModel> results
});




}
/// @nodoc
class _$PaginatedQualityCheckListCopyWithImpl<$Res>
    implements $PaginatedQualityCheckListCopyWith<$Res> {
  _$PaginatedQualityCheckListCopyWithImpl(this._self, this._then);

  final PaginatedQualityCheckList _self;
  final $Res Function(PaginatedQualityCheckList) _then;

/// Create a copy of PaginatedQualityCheckList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<QualityCheckModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedQualityCheckList].
extension PaginatedQualityCheckListPatterns on PaginatedQualityCheckList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedQualityCheckList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedQualityCheckList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedQualityCheckList value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedQualityCheckList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedQualityCheckList value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedQualityCheckList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<QualityCheckModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedQualityCheckList() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<QualityCheckModel> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedQualityCheckList():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String? next,  String? previous,  List<QualityCheckModel> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedQualityCheckList() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedQualityCheckList implements PaginatedQualityCheckList {
  const _PaginatedQualityCheckList({required this.count, this.next, this.previous, required final  List<QualityCheckModel> results}): _results = results;
  factory _PaginatedQualityCheckList.fromJson(Map<String, dynamic> json) => _$PaginatedQualityCheckListFromJson(json);

@override final  int count;
@override final  String? next;
@override final  String? previous;
 final  List<QualityCheckModel> _results;
@override List<QualityCheckModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedQualityCheckList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedQualityCheckListCopyWith<_PaginatedQualityCheckList> get copyWith => __$PaginatedQualityCheckListCopyWithImpl<_PaginatedQualityCheckList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedQualityCheckListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedQualityCheckList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PaginatedQualityCheckList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedQualityCheckListCopyWith<$Res> implements $PaginatedQualityCheckListCopyWith<$Res> {
  factory _$PaginatedQualityCheckListCopyWith(_PaginatedQualityCheckList value, $Res Function(_PaginatedQualityCheckList) _then) = __$PaginatedQualityCheckListCopyWithImpl;
@override @useResult
$Res call({
 int count, String? next, String? previous, List<QualityCheckModel> results
});




}
/// @nodoc
class __$PaginatedQualityCheckListCopyWithImpl<$Res>
    implements _$PaginatedQualityCheckListCopyWith<$Res> {
  __$PaginatedQualityCheckListCopyWithImpl(this._self, this._then);

  final _PaginatedQualityCheckList _self;
  final $Res Function(_PaginatedQualityCheckList) _then;

/// Create a copy of PaginatedQualityCheckList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PaginatedQualityCheckList(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<QualityCheckModel>,
  ));
}


}

// dart format on
