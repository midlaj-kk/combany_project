// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleModel {

 int get id;@JsonKey(name: 'vehicle_number') String get vehicleNumber; String get brand; String get model; int? get year; int get kilometers; VehicleStatus? get status; int? get customer;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleModelCopyWith<VehicleModel> get copyWith => _$VehicleModelCopyWithImpl<VehicleModel>(this as VehicleModel, _$identity);

  /// Serializes this VehicleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.kilometers, kilometers) || other.kilometers == kilometers)&&(identical(other.status, status) || other.status == status)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleNumber,brand,model,year,kilometers,status,customer,createdAt,updatedAt);

@override
String toString() {
  return 'VehicleModel(id: $id, vehicleNumber: $vehicleNumber, brand: $brand, model: $model, year: $year, kilometers: $kilometers, status: $status, customer: $customer, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $VehicleModelCopyWith<$Res>  {
  factory $VehicleModelCopyWith(VehicleModel value, $Res Function(VehicleModel) _then) = _$VehicleModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'vehicle_number') String vehicleNumber, String brand, String model, int? year, int kilometers, VehicleStatus? status, int? customer,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$VehicleModelCopyWithImpl<$Res>
    implements $VehicleModelCopyWith<$Res> {
  _$VehicleModelCopyWithImpl(this._self, this._then);

  final VehicleModel _self;
  final $Res Function(VehicleModel) _then;

/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vehicleNumber = null,Object? brand = null,Object? model = null,Object? year = freezed,Object? kilometers = null,Object? status = freezed,Object? customer = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,vehicleNumber: null == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,kilometers: null == kilometers ? _self.kilometers : kilometers // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VehicleStatus?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleModel].
extension VehicleModelPatterns on VehicleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleModel value)  $default,){
final _that = this;
switch (_that) {
case _VehicleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleModel value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'vehicle_number')  String vehicleNumber,  String brand,  String model,  int? year,  int kilometers,  VehicleStatus? status,  int? customer, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
return $default(_that.id,_that.vehicleNumber,_that.brand,_that.model,_that.year,_that.kilometers,_that.status,_that.customer,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'vehicle_number')  String vehicleNumber,  String brand,  String model,  int? year,  int kilometers,  VehicleStatus? status,  int? customer, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _VehicleModel():
return $default(_that.id,_that.vehicleNumber,_that.brand,_that.model,_that.year,_that.kilometers,_that.status,_that.customer,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'vehicle_number')  String vehicleNumber,  String brand,  String model,  int? year,  int kilometers,  VehicleStatus? status,  int? customer, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
return $default(_that.id,_that.vehicleNumber,_that.brand,_that.model,_that.year,_that.kilometers,_that.status,_that.customer,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleModel implements VehicleModel {
  const _VehicleModel({required this.id, @JsonKey(name: 'vehicle_number') required this.vehicleNumber, required this.brand, required this.model, this.year, this.kilometers = 0, this.status, this.customer, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _VehicleModel.fromJson(Map<String, dynamic> json) => _$VehicleModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'vehicle_number') final  String vehicleNumber;
@override final  String brand;
@override final  String model;
@override final  int? year;
@override@JsonKey() final  int kilometers;
@override final  VehicleStatus? status;
@override final  int? customer;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleModelCopyWith<_VehicleModel> get copyWith => __$VehicleModelCopyWithImpl<_VehicleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.kilometers, kilometers) || other.kilometers == kilometers)&&(identical(other.status, status) || other.status == status)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleNumber,brand,model,year,kilometers,status,customer,createdAt,updatedAt);

@override
String toString() {
  return 'VehicleModel(id: $id, vehicleNumber: $vehicleNumber, brand: $brand, model: $model, year: $year, kilometers: $kilometers, status: $status, customer: $customer, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$VehicleModelCopyWith<$Res> implements $VehicleModelCopyWith<$Res> {
  factory _$VehicleModelCopyWith(_VehicleModel value, $Res Function(_VehicleModel) _then) = __$VehicleModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'vehicle_number') String vehicleNumber, String brand, String model, int? year, int kilometers, VehicleStatus? status, int? customer,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$VehicleModelCopyWithImpl<$Res>
    implements _$VehicleModelCopyWith<$Res> {
  __$VehicleModelCopyWithImpl(this._self, this._then);

  final _VehicleModel _self;
  final $Res Function(_VehicleModel) _then;

/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vehicleNumber = null,Object? brand = null,Object? model = null,Object? year = freezed,Object? kilometers = null,Object? status = freezed,Object? customer = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_VehicleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,vehicleNumber: null == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,kilometers: null == kilometers ? _self.kilometers : kilometers // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VehicleStatus?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VehicleCreateRequest {

@JsonKey(name: 'vehicle_number') String get vehicleNumber; String get brand; String get model; int? get year; int get kilometers; int get customer;
/// Create a copy of VehicleCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleCreateRequestCopyWith<VehicleCreateRequest> get copyWith => _$VehicleCreateRequestCopyWithImpl<VehicleCreateRequest>(this as VehicleCreateRequest, _$identity);

  /// Serializes this VehicleCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleCreateRequest&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.kilometers, kilometers) || other.kilometers == kilometers)&&(identical(other.customer, customer) || other.customer == customer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicleNumber,brand,model,year,kilometers,customer);

@override
String toString() {
  return 'VehicleCreateRequest(vehicleNumber: $vehicleNumber, brand: $brand, model: $model, year: $year, kilometers: $kilometers, customer: $customer)';
}


}

/// @nodoc
abstract mixin class $VehicleCreateRequestCopyWith<$Res>  {
  factory $VehicleCreateRequestCopyWith(VehicleCreateRequest value, $Res Function(VehicleCreateRequest) _then) = _$VehicleCreateRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'vehicle_number') String vehicleNumber, String brand, String model, int? year, int kilometers, int customer
});




}
/// @nodoc
class _$VehicleCreateRequestCopyWithImpl<$Res>
    implements $VehicleCreateRequestCopyWith<$Res> {
  _$VehicleCreateRequestCopyWithImpl(this._self, this._then);

  final VehicleCreateRequest _self;
  final $Res Function(VehicleCreateRequest) _then;

/// Create a copy of VehicleCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicleNumber = null,Object? brand = null,Object? model = null,Object? year = freezed,Object? kilometers = null,Object? customer = null,}) {
  return _then(_self.copyWith(
vehicleNumber: null == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,kilometers: null == kilometers ? _self.kilometers : kilometers // ignore: cast_nullable_to_non_nullable
as int,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleCreateRequest].
extension VehicleCreateRequestPatterns on VehicleCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _VehicleCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'vehicle_number')  String vehicleNumber,  String brand,  String model,  int? year,  int kilometers,  int customer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleCreateRequest() when $default != null:
return $default(_that.vehicleNumber,_that.brand,_that.model,_that.year,_that.kilometers,_that.customer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'vehicle_number')  String vehicleNumber,  String brand,  String model,  int? year,  int kilometers,  int customer)  $default,) {final _that = this;
switch (_that) {
case _VehicleCreateRequest():
return $default(_that.vehicleNumber,_that.brand,_that.model,_that.year,_that.kilometers,_that.customer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'vehicle_number')  String vehicleNumber,  String brand,  String model,  int? year,  int kilometers,  int customer)?  $default,) {final _that = this;
switch (_that) {
case _VehicleCreateRequest() when $default != null:
return $default(_that.vehicleNumber,_that.brand,_that.model,_that.year,_that.kilometers,_that.customer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleCreateRequest implements VehicleCreateRequest {
  const _VehicleCreateRequest({@JsonKey(name: 'vehicle_number') required this.vehicleNumber, required this.brand, required this.model, this.year, this.kilometers = 0, required this.customer});
  factory _VehicleCreateRequest.fromJson(Map<String, dynamic> json) => _$VehicleCreateRequestFromJson(json);

@override@JsonKey(name: 'vehicle_number') final  String vehicleNumber;
@override final  String brand;
@override final  String model;
@override final  int? year;
@override@JsonKey() final  int kilometers;
@override final  int customer;

/// Create a copy of VehicleCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleCreateRequestCopyWith<_VehicleCreateRequest> get copyWith => __$VehicleCreateRequestCopyWithImpl<_VehicleCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleCreateRequest&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.kilometers, kilometers) || other.kilometers == kilometers)&&(identical(other.customer, customer) || other.customer == customer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicleNumber,brand,model,year,kilometers,customer);

@override
String toString() {
  return 'VehicleCreateRequest(vehicleNumber: $vehicleNumber, brand: $brand, model: $model, year: $year, kilometers: $kilometers, customer: $customer)';
}


}

/// @nodoc
abstract mixin class _$VehicleCreateRequestCopyWith<$Res> implements $VehicleCreateRequestCopyWith<$Res> {
  factory _$VehicleCreateRequestCopyWith(_VehicleCreateRequest value, $Res Function(_VehicleCreateRequest) _then) = __$VehicleCreateRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'vehicle_number') String vehicleNumber, String brand, String model, int? year, int kilometers, int customer
});




}
/// @nodoc
class __$VehicleCreateRequestCopyWithImpl<$Res>
    implements _$VehicleCreateRequestCopyWith<$Res> {
  __$VehicleCreateRequestCopyWithImpl(this._self, this._then);

  final _VehicleCreateRequest _self;
  final $Res Function(_VehicleCreateRequest) _then;

/// Create a copy of VehicleCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicleNumber = null,Object? brand = null,Object? model = null,Object? year = freezed,Object? kilometers = null,Object? customer = null,}) {
  return _then(_VehicleCreateRequest(
vehicleNumber: null == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,kilometers: null == kilometers ? _self.kilometers : kilometers // ignore: cast_nullable_to_non_nullable
as int,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PaginatedVehicleList {

 int get count; String? get next; String? get previous; List<VehicleModel> get results;
/// Create a copy of PaginatedVehicleList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedVehicleListCopyWith<PaginatedVehicleList> get copyWith => _$PaginatedVehicleListCopyWithImpl<PaginatedVehicleList>(this as PaginatedVehicleList, _$identity);

  /// Serializes this PaginatedVehicleList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedVehicleList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PaginatedVehicleList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedVehicleListCopyWith<$Res>  {
  factory $PaginatedVehicleListCopyWith(PaginatedVehicleList value, $Res Function(PaginatedVehicleList) _then) = _$PaginatedVehicleListCopyWithImpl;
@useResult
$Res call({
 int count, String? next, String? previous, List<VehicleModel> results
});




}
/// @nodoc
class _$PaginatedVehicleListCopyWithImpl<$Res>
    implements $PaginatedVehicleListCopyWith<$Res> {
  _$PaginatedVehicleListCopyWithImpl(this._self, this._then);

  final PaginatedVehicleList _self;
  final $Res Function(PaginatedVehicleList) _then;

/// Create a copy of PaginatedVehicleList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<VehicleModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedVehicleList].
extension PaginatedVehicleListPatterns on PaginatedVehicleList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedVehicleList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedVehicleList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedVehicleList value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedVehicleList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedVehicleList value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedVehicleList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<VehicleModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedVehicleList() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<VehicleModel> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedVehicleList():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String? next,  String? previous,  List<VehicleModel> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedVehicleList() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedVehicleList implements PaginatedVehicleList {
  const _PaginatedVehicleList({required this.count, this.next, this.previous, required final  List<VehicleModel> results}): _results = results;
  factory _PaginatedVehicleList.fromJson(Map<String, dynamic> json) => _$PaginatedVehicleListFromJson(json);

@override final  int count;
@override final  String? next;
@override final  String? previous;
 final  List<VehicleModel> _results;
@override List<VehicleModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedVehicleList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedVehicleListCopyWith<_PaginatedVehicleList> get copyWith => __$PaginatedVehicleListCopyWithImpl<_PaginatedVehicleList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedVehicleListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedVehicleList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PaginatedVehicleList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedVehicleListCopyWith<$Res> implements $PaginatedVehicleListCopyWith<$Res> {
  factory _$PaginatedVehicleListCopyWith(_PaginatedVehicleList value, $Res Function(_PaginatedVehicleList) _then) = __$PaginatedVehicleListCopyWithImpl;
@override @useResult
$Res call({
 int count, String? next, String? previous, List<VehicleModel> results
});




}
/// @nodoc
class __$PaginatedVehicleListCopyWithImpl<$Res>
    implements _$PaginatedVehicleListCopyWith<$Res> {
  __$PaginatedVehicleListCopyWithImpl(this._self, this._then);

  final _PaginatedVehicleList _self;
  final $Res Function(_PaginatedVehicleList) _then;

/// Create a copy of PaginatedVehicleList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PaginatedVehicleList(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<VehicleModel>,
  ));
}


}

// dart format on
