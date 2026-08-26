// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryModel {

 int get id;@JsonKey(name: 'delivery_date') String? get deliveryDate;@JsonKey(name: 'customer_received') bool? get customerReceived; String? get remarks;@JsonKey(name: 'service_job') int get serviceJob;@JsonKey(name: 'delivered_by') int? get deliveredBy;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryModelCopyWith<DeliveryModel> get copyWith => _$DeliveryModelCopyWithImpl<DeliveryModel>(this as DeliveryModel, _$identity);

  /// Serializes this DeliveryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.deliveryDate, deliveryDate) || other.deliveryDate == deliveryDate)&&(identical(other.customerReceived, customerReceived) || other.customerReceived == customerReceived)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob)&&(identical(other.deliveredBy, deliveredBy) || other.deliveredBy == deliveredBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deliveryDate,customerReceived,remarks,serviceJob,deliveredBy,createdAt);

@override
String toString() {
  return 'DeliveryModel(id: $id, deliveryDate: $deliveryDate, customerReceived: $customerReceived, remarks: $remarks, serviceJob: $serviceJob, deliveredBy: $deliveredBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DeliveryModelCopyWith<$Res>  {
  factory $DeliveryModelCopyWith(DeliveryModel value, $Res Function(DeliveryModel) _then) = _$DeliveryModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'delivery_date') String? deliveryDate,@JsonKey(name: 'customer_received') bool? customerReceived, String? remarks,@JsonKey(name: 'service_job') int serviceJob,@JsonKey(name: 'delivered_by') int? deliveredBy,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$DeliveryModelCopyWithImpl<$Res>
    implements $DeliveryModelCopyWith<$Res> {
  _$DeliveryModelCopyWithImpl(this._self, this._then);

  final DeliveryModel _self;
  final $Res Function(DeliveryModel) _then;

/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? deliveryDate = freezed,Object? customerReceived = freezed,Object? remarks = freezed,Object? serviceJob = null,Object? deliveredBy = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,deliveryDate: freezed == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as String?,customerReceived: freezed == customerReceived ? _self.customerReceived : customerReceived // ignore: cast_nullable_to_non_nullable
as bool?,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,deliveredBy: freezed == deliveredBy ? _self.deliveredBy : deliveredBy // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryModel].
extension DeliveryModelPatterns on DeliveryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryModel value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'delivery_date')  String? deliveryDate, @JsonKey(name: 'customer_received')  bool? customerReceived,  String? remarks, @JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'delivered_by')  int? deliveredBy, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryModel() when $default != null:
return $default(_that.id,_that.deliveryDate,_that.customerReceived,_that.remarks,_that.serviceJob,_that.deliveredBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'delivery_date')  String? deliveryDate, @JsonKey(name: 'customer_received')  bool? customerReceived,  String? remarks, @JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'delivered_by')  int? deliveredBy, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _DeliveryModel():
return $default(_that.id,_that.deliveryDate,_that.customerReceived,_that.remarks,_that.serviceJob,_that.deliveredBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'delivery_date')  String? deliveryDate, @JsonKey(name: 'customer_received')  bool? customerReceived,  String? remarks, @JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'delivered_by')  int? deliveredBy, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryModel() when $default != null:
return $default(_that.id,_that.deliveryDate,_that.customerReceived,_that.remarks,_that.serviceJob,_that.deliveredBy,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryModel implements DeliveryModel {
  const _DeliveryModel({required this.id, @JsonKey(name: 'delivery_date') this.deliveryDate, @JsonKey(name: 'customer_received') this.customerReceived, this.remarks, @JsonKey(name: 'service_job') required this.serviceJob, @JsonKey(name: 'delivered_by') this.deliveredBy, @JsonKey(name: 'created_at') this.createdAt});
  factory _DeliveryModel.fromJson(Map<String, dynamic> json) => _$DeliveryModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'delivery_date') final  String? deliveryDate;
@override@JsonKey(name: 'customer_received') final  bool? customerReceived;
@override final  String? remarks;
@override@JsonKey(name: 'service_job') final  int serviceJob;
@override@JsonKey(name: 'delivered_by') final  int? deliveredBy;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryModelCopyWith<_DeliveryModel> get copyWith => __$DeliveryModelCopyWithImpl<_DeliveryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.deliveryDate, deliveryDate) || other.deliveryDate == deliveryDate)&&(identical(other.customerReceived, customerReceived) || other.customerReceived == customerReceived)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob)&&(identical(other.deliveredBy, deliveredBy) || other.deliveredBy == deliveredBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deliveryDate,customerReceived,remarks,serviceJob,deliveredBy,createdAt);

@override
String toString() {
  return 'DeliveryModel(id: $id, deliveryDate: $deliveryDate, customerReceived: $customerReceived, remarks: $remarks, serviceJob: $serviceJob, deliveredBy: $deliveredBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DeliveryModelCopyWith<$Res> implements $DeliveryModelCopyWith<$Res> {
  factory _$DeliveryModelCopyWith(_DeliveryModel value, $Res Function(_DeliveryModel) _then) = __$DeliveryModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'delivery_date') String? deliveryDate,@JsonKey(name: 'customer_received') bool? customerReceived, String? remarks,@JsonKey(name: 'service_job') int serviceJob,@JsonKey(name: 'delivered_by') int? deliveredBy,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$DeliveryModelCopyWithImpl<$Res>
    implements _$DeliveryModelCopyWith<$Res> {
  __$DeliveryModelCopyWithImpl(this._self, this._then);

  final _DeliveryModel _self;
  final $Res Function(_DeliveryModel) _then;

/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deliveryDate = freezed,Object? customerReceived = freezed,Object? remarks = freezed,Object? serviceJob = null,Object? deliveredBy = freezed,Object? createdAt = freezed,}) {
  return _then(_DeliveryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,deliveryDate: freezed == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as String?,customerReceived: freezed == customerReceived ? _self.customerReceived : customerReceived // ignore: cast_nullable_to_non_nullable
as bool?,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,deliveredBy: freezed == deliveredBy ? _self.deliveredBy : deliveredBy // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DeliveryCreateRequest {

@JsonKey(name: 'delivery_date') String get deliveryDate;@JsonKey(name: 'customer_received') bool? get customerReceived; String? get remarks;@JsonKey(name: 'service_job') int get serviceJob;
/// Create a copy of DeliveryCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryCreateRequestCopyWith<DeliveryCreateRequest> get copyWith => _$DeliveryCreateRequestCopyWithImpl<DeliveryCreateRequest>(this as DeliveryCreateRequest, _$identity);

  /// Serializes this DeliveryCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryCreateRequest&&(identical(other.deliveryDate, deliveryDate) || other.deliveryDate == deliveryDate)&&(identical(other.customerReceived, customerReceived) || other.customerReceived == customerReceived)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deliveryDate,customerReceived,remarks,serviceJob);

@override
String toString() {
  return 'DeliveryCreateRequest(deliveryDate: $deliveryDate, customerReceived: $customerReceived, remarks: $remarks, serviceJob: $serviceJob)';
}


}

/// @nodoc
abstract mixin class $DeliveryCreateRequestCopyWith<$Res>  {
  factory $DeliveryCreateRequestCopyWith(DeliveryCreateRequest value, $Res Function(DeliveryCreateRequest) _then) = _$DeliveryCreateRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'delivery_date') String deliveryDate,@JsonKey(name: 'customer_received') bool? customerReceived, String? remarks,@JsonKey(name: 'service_job') int serviceJob
});




}
/// @nodoc
class _$DeliveryCreateRequestCopyWithImpl<$Res>
    implements $DeliveryCreateRequestCopyWith<$Res> {
  _$DeliveryCreateRequestCopyWithImpl(this._self, this._then);

  final DeliveryCreateRequest _self;
  final $Res Function(DeliveryCreateRequest) _then;

/// Create a copy of DeliveryCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deliveryDate = null,Object? customerReceived = freezed,Object? remarks = freezed,Object? serviceJob = null,}) {
  return _then(_self.copyWith(
deliveryDate: null == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as String,customerReceived: freezed == customerReceived ? _self.customerReceived : customerReceived // ignore: cast_nullable_to_non_nullable
as bool?,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryCreateRequest].
extension DeliveryCreateRequestPatterns on DeliveryCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'delivery_date')  String deliveryDate, @JsonKey(name: 'customer_received')  bool? customerReceived,  String? remarks, @JsonKey(name: 'service_job')  int serviceJob)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryCreateRequest() when $default != null:
return $default(_that.deliveryDate,_that.customerReceived,_that.remarks,_that.serviceJob);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'delivery_date')  String deliveryDate, @JsonKey(name: 'customer_received')  bool? customerReceived,  String? remarks, @JsonKey(name: 'service_job')  int serviceJob)  $default,) {final _that = this;
switch (_that) {
case _DeliveryCreateRequest():
return $default(_that.deliveryDate,_that.customerReceived,_that.remarks,_that.serviceJob);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'delivery_date')  String deliveryDate, @JsonKey(name: 'customer_received')  bool? customerReceived,  String? remarks, @JsonKey(name: 'service_job')  int serviceJob)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryCreateRequest() when $default != null:
return $default(_that.deliveryDate,_that.customerReceived,_that.remarks,_that.serviceJob);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryCreateRequest implements DeliveryCreateRequest {
  const _DeliveryCreateRequest({@JsonKey(name: 'delivery_date') required this.deliveryDate, @JsonKey(name: 'customer_received') this.customerReceived, this.remarks, @JsonKey(name: 'service_job') required this.serviceJob});
  factory _DeliveryCreateRequest.fromJson(Map<String, dynamic> json) => _$DeliveryCreateRequestFromJson(json);

@override@JsonKey(name: 'delivery_date') final  String deliveryDate;
@override@JsonKey(name: 'customer_received') final  bool? customerReceived;
@override final  String? remarks;
@override@JsonKey(name: 'service_job') final  int serviceJob;

/// Create a copy of DeliveryCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryCreateRequestCopyWith<_DeliveryCreateRequest> get copyWith => __$DeliveryCreateRequestCopyWithImpl<_DeliveryCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryCreateRequest&&(identical(other.deliveryDate, deliveryDate) || other.deliveryDate == deliveryDate)&&(identical(other.customerReceived, customerReceived) || other.customerReceived == customerReceived)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deliveryDate,customerReceived,remarks,serviceJob);

@override
String toString() {
  return 'DeliveryCreateRequest(deliveryDate: $deliveryDate, customerReceived: $customerReceived, remarks: $remarks, serviceJob: $serviceJob)';
}


}

/// @nodoc
abstract mixin class _$DeliveryCreateRequestCopyWith<$Res> implements $DeliveryCreateRequestCopyWith<$Res> {
  factory _$DeliveryCreateRequestCopyWith(_DeliveryCreateRequest value, $Res Function(_DeliveryCreateRequest) _then) = __$DeliveryCreateRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'delivery_date') String deliveryDate,@JsonKey(name: 'customer_received') bool? customerReceived, String? remarks,@JsonKey(name: 'service_job') int serviceJob
});




}
/// @nodoc
class __$DeliveryCreateRequestCopyWithImpl<$Res>
    implements _$DeliveryCreateRequestCopyWith<$Res> {
  __$DeliveryCreateRequestCopyWithImpl(this._self, this._then);

  final _DeliveryCreateRequest _self;
  final $Res Function(_DeliveryCreateRequest) _then;

/// Create a copy of DeliveryCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deliveryDate = null,Object? customerReceived = freezed,Object? remarks = freezed,Object? serviceJob = null,}) {
  return _then(_DeliveryCreateRequest(
deliveryDate: null == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as String,customerReceived: freezed == customerReceived ? _self.customerReceived : customerReceived // ignore: cast_nullable_to_non_nullable
as bool?,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PaginatedDeliveryList {

 int get count; String? get next; String? get previous; List<DeliveryModel> get results;
/// Create a copy of PaginatedDeliveryList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedDeliveryListCopyWith<PaginatedDeliveryList> get copyWith => _$PaginatedDeliveryListCopyWithImpl<PaginatedDeliveryList>(this as PaginatedDeliveryList, _$identity);

  /// Serializes this PaginatedDeliveryList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedDeliveryList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PaginatedDeliveryList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedDeliveryListCopyWith<$Res>  {
  factory $PaginatedDeliveryListCopyWith(PaginatedDeliveryList value, $Res Function(PaginatedDeliveryList) _then) = _$PaginatedDeliveryListCopyWithImpl;
@useResult
$Res call({
 int count, String? next, String? previous, List<DeliveryModel> results
});




}
/// @nodoc
class _$PaginatedDeliveryListCopyWithImpl<$Res>
    implements $PaginatedDeliveryListCopyWith<$Res> {
  _$PaginatedDeliveryListCopyWithImpl(this._self, this._then);

  final PaginatedDeliveryList _self;
  final $Res Function(PaginatedDeliveryList) _then;

/// Create a copy of PaginatedDeliveryList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<DeliveryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedDeliveryList].
extension PaginatedDeliveryListPatterns on PaginatedDeliveryList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedDeliveryList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedDeliveryList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedDeliveryList value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedDeliveryList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedDeliveryList value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedDeliveryList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<DeliveryModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedDeliveryList() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<DeliveryModel> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedDeliveryList():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String? next,  String? previous,  List<DeliveryModel> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedDeliveryList() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedDeliveryList implements PaginatedDeliveryList {
  const _PaginatedDeliveryList({required this.count, this.next, this.previous, required final  List<DeliveryModel> results}): _results = results;
  factory _PaginatedDeliveryList.fromJson(Map<String, dynamic> json) => _$PaginatedDeliveryListFromJson(json);

@override final  int count;
@override final  String? next;
@override final  String? previous;
 final  List<DeliveryModel> _results;
@override List<DeliveryModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedDeliveryList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedDeliveryListCopyWith<_PaginatedDeliveryList> get copyWith => __$PaginatedDeliveryListCopyWithImpl<_PaginatedDeliveryList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedDeliveryListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedDeliveryList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PaginatedDeliveryList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedDeliveryListCopyWith<$Res> implements $PaginatedDeliveryListCopyWith<$Res> {
  factory _$PaginatedDeliveryListCopyWith(_PaginatedDeliveryList value, $Res Function(_PaginatedDeliveryList) _then) = __$PaginatedDeliveryListCopyWithImpl;
@override @useResult
$Res call({
 int count, String? next, String? previous, List<DeliveryModel> results
});




}
/// @nodoc
class __$PaginatedDeliveryListCopyWithImpl<$Res>
    implements _$PaginatedDeliveryListCopyWith<$Res> {
  __$PaginatedDeliveryListCopyWithImpl(this._self, this._then);

  final _PaginatedDeliveryList _self;
  final $Res Function(_PaginatedDeliveryList) _then;

/// Create a copy of PaginatedDeliveryList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PaginatedDeliveryList(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<DeliveryModel>,
  ));
}


}

// dart format on
