// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_work_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceWorkModel {

 int get id;@JsonKey(name: 'work_name') String get workName; String? get description; ServiceWorkStatus? get status;@JsonKey(name: 'labour_charge') String? get labourCharge;@JsonKey(name: 'service_job') int get serviceJob;@JsonKey(name: 'created_by') int? get createdBy;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of ServiceWorkModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceWorkModelCopyWith<ServiceWorkModel> get copyWith => _$ServiceWorkModelCopyWithImpl<ServiceWorkModel>(this as ServiceWorkModel, _$identity);

  /// Serializes this ServiceWorkModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceWorkModel&&(identical(other.id, id) || other.id == id)&&(identical(other.workName, workName) || other.workName == workName)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.labourCharge, labourCharge) || other.labourCharge == labourCharge)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,workName,description,status,labourCharge,serviceJob,createdBy,createdAt,updatedAt);

@override
String toString() {
  return 'ServiceWorkModel(id: $id, workName: $workName, description: $description, status: $status, labourCharge: $labourCharge, serviceJob: $serviceJob, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ServiceWorkModelCopyWith<$Res>  {
  factory $ServiceWorkModelCopyWith(ServiceWorkModel value, $Res Function(ServiceWorkModel) _then) = _$ServiceWorkModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'work_name') String workName, String? description, ServiceWorkStatus? status,@JsonKey(name: 'labour_charge') String? labourCharge,@JsonKey(name: 'service_job') int serviceJob,@JsonKey(name: 'created_by') int? createdBy,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$ServiceWorkModelCopyWithImpl<$Res>
    implements $ServiceWorkModelCopyWith<$Res> {
  _$ServiceWorkModelCopyWithImpl(this._self, this._then);

  final ServiceWorkModel _self;
  final $Res Function(ServiceWorkModel) _then;

/// Create a copy of ServiceWorkModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? workName = null,Object? description = freezed,Object? status = freezed,Object? labourCharge = freezed,Object? serviceJob = null,Object? createdBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,workName: null == workName ? _self.workName : workName // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ServiceWorkStatus?,labourCharge: freezed == labourCharge ? _self.labourCharge : labourCharge // ignore: cast_nullable_to_non_nullable
as String?,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceWorkModel].
extension ServiceWorkModelPatterns on ServiceWorkModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceWorkModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceWorkModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceWorkModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceWorkModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceWorkModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceWorkModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'work_name')  String workName,  String? description,  ServiceWorkStatus? status, @JsonKey(name: 'labour_charge')  String? labourCharge, @JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'created_by')  int? createdBy, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceWorkModel() when $default != null:
return $default(_that.id,_that.workName,_that.description,_that.status,_that.labourCharge,_that.serviceJob,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'work_name')  String workName,  String? description,  ServiceWorkStatus? status, @JsonKey(name: 'labour_charge')  String? labourCharge, @JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'created_by')  int? createdBy, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ServiceWorkModel():
return $default(_that.id,_that.workName,_that.description,_that.status,_that.labourCharge,_that.serviceJob,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'work_name')  String workName,  String? description,  ServiceWorkStatus? status, @JsonKey(name: 'labour_charge')  String? labourCharge, @JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'created_by')  int? createdBy, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ServiceWorkModel() when $default != null:
return $default(_that.id,_that.workName,_that.description,_that.status,_that.labourCharge,_that.serviceJob,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceWorkModel implements ServiceWorkModel {
  const _ServiceWorkModel({required this.id, @JsonKey(name: 'work_name') required this.workName, this.description, this.status, @JsonKey(name: 'labour_charge') this.labourCharge, @JsonKey(name: 'service_job') required this.serviceJob, @JsonKey(name: 'created_by') this.createdBy, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _ServiceWorkModel.fromJson(Map<String, dynamic> json) => _$ServiceWorkModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'work_name') final  String workName;
@override final  String? description;
@override final  ServiceWorkStatus? status;
@override@JsonKey(name: 'labour_charge') final  String? labourCharge;
@override@JsonKey(name: 'service_job') final  int serviceJob;
@override@JsonKey(name: 'created_by') final  int? createdBy;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of ServiceWorkModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceWorkModelCopyWith<_ServiceWorkModel> get copyWith => __$ServiceWorkModelCopyWithImpl<_ServiceWorkModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceWorkModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceWorkModel&&(identical(other.id, id) || other.id == id)&&(identical(other.workName, workName) || other.workName == workName)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.labourCharge, labourCharge) || other.labourCharge == labourCharge)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,workName,description,status,labourCharge,serviceJob,createdBy,createdAt,updatedAt);

@override
String toString() {
  return 'ServiceWorkModel(id: $id, workName: $workName, description: $description, status: $status, labourCharge: $labourCharge, serviceJob: $serviceJob, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ServiceWorkModelCopyWith<$Res> implements $ServiceWorkModelCopyWith<$Res> {
  factory _$ServiceWorkModelCopyWith(_ServiceWorkModel value, $Res Function(_ServiceWorkModel) _then) = __$ServiceWorkModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'work_name') String workName, String? description, ServiceWorkStatus? status,@JsonKey(name: 'labour_charge') String? labourCharge,@JsonKey(name: 'service_job') int serviceJob,@JsonKey(name: 'created_by') int? createdBy,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$ServiceWorkModelCopyWithImpl<$Res>
    implements _$ServiceWorkModelCopyWith<$Res> {
  __$ServiceWorkModelCopyWithImpl(this._self, this._then);

  final _ServiceWorkModel _self;
  final $Res Function(_ServiceWorkModel) _then;

/// Create a copy of ServiceWorkModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? workName = null,Object? description = freezed,Object? status = freezed,Object? labourCharge = freezed,Object? serviceJob = null,Object? createdBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ServiceWorkModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,workName: null == workName ? _self.workName : workName // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ServiceWorkStatus?,labourCharge: freezed == labourCharge ? _self.labourCharge : labourCharge // ignore: cast_nullable_to_non_nullable
as String?,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ServiceWorkCreateRequest {

@JsonKey(name: 'work_name') String get workName; String? get description;@JsonKey(name: 'labour_charge') String? get labourCharge;@JsonKey(name: 'service_job') int get serviceJob;
/// Create a copy of ServiceWorkCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceWorkCreateRequestCopyWith<ServiceWorkCreateRequest> get copyWith => _$ServiceWorkCreateRequestCopyWithImpl<ServiceWorkCreateRequest>(this as ServiceWorkCreateRequest, _$identity);

  /// Serializes this ServiceWorkCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceWorkCreateRequest&&(identical(other.workName, workName) || other.workName == workName)&&(identical(other.description, description) || other.description == description)&&(identical(other.labourCharge, labourCharge) || other.labourCharge == labourCharge)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workName,description,labourCharge,serviceJob);

@override
String toString() {
  return 'ServiceWorkCreateRequest(workName: $workName, description: $description, labourCharge: $labourCharge, serviceJob: $serviceJob)';
}


}

/// @nodoc
abstract mixin class $ServiceWorkCreateRequestCopyWith<$Res>  {
  factory $ServiceWorkCreateRequestCopyWith(ServiceWorkCreateRequest value, $Res Function(ServiceWorkCreateRequest) _then) = _$ServiceWorkCreateRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'work_name') String workName, String? description,@JsonKey(name: 'labour_charge') String? labourCharge,@JsonKey(name: 'service_job') int serviceJob
});




}
/// @nodoc
class _$ServiceWorkCreateRequestCopyWithImpl<$Res>
    implements $ServiceWorkCreateRequestCopyWith<$Res> {
  _$ServiceWorkCreateRequestCopyWithImpl(this._self, this._then);

  final ServiceWorkCreateRequest _self;
  final $Res Function(ServiceWorkCreateRequest) _then;

/// Create a copy of ServiceWorkCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workName = null,Object? description = freezed,Object? labourCharge = freezed,Object? serviceJob = null,}) {
  return _then(_self.copyWith(
workName: null == workName ? _self.workName : workName // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,labourCharge: freezed == labourCharge ? _self.labourCharge : labourCharge // ignore: cast_nullable_to_non_nullable
as String?,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceWorkCreateRequest].
extension ServiceWorkCreateRequestPatterns on ServiceWorkCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceWorkCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceWorkCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceWorkCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _ServiceWorkCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceWorkCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceWorkCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'work_name')  String workName,  String? description, @JsonKey(name: 'labour_charge')  String? labourCharge, @JsonKey(name: 'service_job')  int serviceJob)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceWorkCreateRequest() when $default != null:
return $default(_that.workName,_that.description,_that.labourCharge,_that.serviceJob);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'work_name')  String workName,  String? description, @JsonKey(name: 'labour_charge')  String? labourCharge, @JsonKey(name: 'service_job')  int serviceJob)  $default,) {final _that = this;
switch (_that) {
case _ServiceWorkCreateRequest():
return $default(_that.workName,_that.description,_that.labourCharge,_that.serviceJob);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'work_name')  String workName,  String? description, @JsonKey(name: 'labour_charge')  String? labourCharge, @JsonKey(name: 'service_job')  int serviceJob)?  $default,) {final _that = this;
switch (_that) {
case _ServiceWorkCreateRequest() when $default != null:
return $default(_that.workName,_that.description,_that.labourCharge,_that.serviceJob);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceWorkCreateRequest implements ServiceWorkCreateRequest {
  const _ServiceWorkCreateRequest({@JsonKey(name: 'work_name') required this.workName, this.description, @JsonKey(name: 'labour_charge') this.labourCharge, @JsonKey(name: 'service_job') required this.serviceJob});
  factory _ServiceWorkCreateRequest.fromJson(Map<String, dynamic> json) => _$ServiceWorkCreateRequestFromJson(json);

@override@JsonKey(name: 'work_name') final  String workName;
@override final  String? description;
@override@JsonKey(name: 'labour_charge') final  String? labourCharge;
@override@JsonKey(name: 'service_job') final  int serviceJob;

/// Create a copy of ServiceWorkCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceWorkCreateRequestCopyWith<_ServiceWorkCreateRequest> get copyWith => __$ServiceWorkCreateRequestCopyWithImpl<_ServiceWorkCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceWorkCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceWorkCreateRequest&&(identical(other.workName, workName) || other.workName == workName)&&(identical(other.description, description) || other.description == description)&&(identical(other.labourCharge, labourCharge) || other.labourCharge == labourCharge)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workName,description,labourCharge,serviceJob);

@override
String toString() {
  return 'ServiceWorkCreateRequest(workName: $workName, description: $description, labourCharge: $labourCharge, serviceJob: $serviceJob)';
}


}

/// @nodoc
abstract mixin class _$ServiceWorkCreateRequestCopyWith<$Res> implements $ServiceWorkCreateRequestCopyWith<$Res> {
  factory _$ServiceWorkCreateRequestCopyWith(_ServiceWorkCreateRequest value, $Res Function(_ServiceWorkCreateRequest) _then) = __$ServiceWorkCreateRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'work_name') String workName, String? description,@JsonKey(name: 'labour_charge') String? labourCharge,@JsonKey(name: 'service_job') int serviceJob
});




}
/// @nodoc
class __$ServiceWorkCreateRequestCopyWithImpl<$Res>
    implements _$ServiceWorkCreateRequestCopyWith<$Res> {
  __$ServiceWorkCreateRequestCopyWithImpl(this._self, this._then);

  final _ServiceWorkCreateRequest _self;
  final $Res Function(_ServiceWorkCreateRequest) _then;

/// Create a copy of ServiceWorkCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workName = null,Object? description = freezed,Object? labourCharge = freezed,Object? serviceJob = null,}) {
  return _then(_ServiceWorkCreateRequest(
workName: null == workName ? _self.workName : workName // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,labourCharge: freezed == labourCharge ? _self.labourCharge : labourCharge // ignore: cast_nullable_to_non_nullable
as String?,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PaginatedServiceWorkList {

 int get count; String? get next; String? get previous; List<ServiceWorkModel> get results;
/// Create a copy of PaginatedServiceWorkList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedServiceWorkListCopyWith<PaginatedServiceWorkList> get copyWith => _$PaginatedServiceWorkListCopyWithImpl<PaginatedServiceWorkList>(this as PaginatedServiceWorkList, _$identity);

  /// Serializes this PaginatedServiceWorkList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedServiceWorkList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PaginatedServiceWorkList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedServiceWorkListCopyWith<$Res>  {
  factory $PaginatedServiceWorkListCopyWith(PaginatedServiceWorkList value, $Res Function(PaginatedServiceWorkList) _then) = _$PaginatedServiceWorkListCopyWithImpl;
@useResult
$Res call({
 int count, String? next, String? previous, List<ServiceWorkModel> results
});




}
/// @nodoc
class _$PaginatedServiceWorkListCopyWithImpl<$Res>
    implements $PaginatedServiceWorkListCopyWith<$Res> {
  _$PaginatedServiceWorkListCopyWithImpl(this._self, this._then);

  final PaginatedServiceWorkList _self;
  final $Res Function(PaginatedServiceWorkList) _then;

/// Create a copy of PaginatedServiceWorkList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<ServiceWorkModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedServiceWorkList].
extension PaginatedServiceWorkListPatterns on PaginatedServiceWorkList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedServiceWorkList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedServiceWorkList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedServiceWorkList value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedServiceWorkList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedServiceWorkList value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedServiceWorkList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<ServiceWorkModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedServiceWorkList() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<ServiceWorkModel> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedServiceWorkList():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String? next,  String? previous,  List<ServiceWorkModel> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedServiceWorkList() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedServiceWorkList implements PaginatedServiceWorkList {
  const _PaginatedServiceWorkList({required this.count, this.next, this.previous, required final  List<ServiceWorkModel> results}): _results = results;
  factory _PaginatedServiceWorkList.fromJson(Map<String, dynamic> json) => _$PaginatedServiceWorkListFromJson(json);

@override final  int count;
@override final  String? next;
@override final  String? previous;
 final  List<ServiceWorkModel> _results;
@override List<ServiceWorkModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedServiceWorkList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedServiceWorkListCopyWith<_PaginatedServiceWorkList> get copyWith => __$PaginatedServiceWorkListCopyWithImpl<_PaginatedServiceWorkList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedServiceWorkListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedServiceWorkList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PaginatedServiceWorkList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedServiceWorkListCopyWith<$Res> implements $PaginatedServiceWorkListCopyWith<$Res> {
  factory _$PaginatedServiceWorkListCopyWith(_PaginatedServiceWorkList value, $Res Function(_PaginatedServiceWorkList) _then) = __$PaginatedServiceWorkListCopyWithImpl;
@override @useResult
$Res call({
 int count, String? next, String? previous, List<ServiceWorkModel> results
});




}
/// @nodoc
class __$PaginatedServiceWorkListCopyWithImpl<$Res>
    implements _$PaginatedServiceWorkListCopyWith<$Res> {
  __$PaginatedServiceWorkListCopyWithImpl(this._self, this._then);

  final _PaginatedServiceWorkList _self;
  final $Res Function(_PaginatedServiceWorkList) _then;

/// Create a copy of PaginatedServiceWorkList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PaginatedServiceWorkList(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<ServiceWorkModel>,
  ));
}


}

// dart format on
