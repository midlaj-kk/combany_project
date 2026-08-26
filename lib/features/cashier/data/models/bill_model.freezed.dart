// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BillModel {

 int get id;@JsonKey(name: 'job_number') String? get jobNumber;@JsonKey(name: 'invoice_number') String? get invoiceNumber;@JsonKey(name: 'labour_charge') String? get labourCharge;@JsonKey(name: 'parts_charge') String? get partsCharge; String? get tax; String? get discount;@JsonKey(name: 'total_amount') String? get totalAmount;@JsonKey(name: 'amount_paid') String? get amountPaid;@JsonKey(name: 'payment_status') PaymentStatusEnum? get paymentStatus;@JsonKey(name: 'service_job') int get serviceJob;@JsonKey(name: 'customer_name') String? get customerName;@JsonKey(name: 'vehicle_number') String? get vehicleNumber;@JsonKey(name: 'created_by') int? get createdBy;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of BillModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillModelCopyWith<BillModel> get copyWith => _$BillModelCopyWithImpl<BillModel>(this as BillModel, _$identity);

  /// Serializes this BillModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobNumber, jobNumber) || other.jobNumber == jobNumber)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.labourCharge, labourCharge) || other.labourCharge == labourCharge)&&(identical(other.partsCharge, partsCharge) || other.partsCharge == partsCharge)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobNumber,invoiceNumber,labourCharge,partsCharge,tax,discount,totalAmount,amountPaid,paymentStatus,serviceJob,customerName,vehicleNumber,createdBy,createdAt,updatedAt);

@override
String toString() {
  return 'BillModel(id: $id, jobNumber: $jobNumber, invoiceNumber: $invoiceNumber, labourCharge: $labourCharge, partsCharge: $partsCharge, tax: $tax, discount: $discount, totalAmount: $totalAmount, amountPaid: $amountPaid, paymentStatus: $paymentStatus, serviceJob: $serviceJob, customerName: $customerName, vehicleNumber: $vehicleNumber, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BillModelCopyWith<$Res>  {
  factory $BillModelCopyWith(BillModel value, $Res Function(BillModel) _then) = _$BillModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'job_number') String? jobNumber,@JsonKey(name: 'invoice_number') String? invoiceNumber,@JsonKey(name: 'labour_charge') String? labourCharge,@JsonKey(name: 'parts_charge') String? partsCharge, String? tax, String? discount,@JsonKey(name: 'total_amount') String? totalAmount,@JsonKey(name: 'amount_paid') String? amountPaid,@JsonKey(name: 'payment_status') PaymentStatusEnum? paymentStatus,@JsonKey(name: 'service_job') int serviceJob,@JsonKey(name: 'customer_name') String? customerName,@JsonKey(name: 'vehicle_number') String? vehicleNumber,@JsonKey(name: 'created_by') int? createdBy,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$BillModelCopyWithImpl<$Res>
    implements $BillModelCopyWith<$Res> {
  _$BillModelCopyWithImpl(this._self, this._then);

  final BillModel _self;
  final $Res Function(BillModel) _then;

/// Create a copy of BillModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? jobNumber = freezed,Object? invoiceNumber = freezed,Object? labourCharge = freezed,Object? partsCharge = freezed,Object? tax = freezed,Object? discount = freezed,Object? totalAmount = freezed,Object? amountPaid = freezed,Object? paymentStatus = freezed,Object? serviceJob = null,Object? customerName = freezed,Object? vehicleNumber = freezed,Object? createdBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,jobNumber: freezed == jobNumber ? _self.jobNumber : jobNumber // ignore: cast_nullable_to_non_nullable
as String?,invoiceNumber: freezed == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,labourCharge: freezed == labourCharge ? _self.labourCharge : labourCharge // ignore: cast_nullable_to_non_nullable
as String?,partsCharge: freezed == partsCharge ? _self.partsCharge : partsCharge // ignore: cast_nullable_to_non_nullable
as String?,tax: freezed == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as String?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String?,amountPaid: freezed == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatusEnum?,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,vehicleNumber: freezed == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BillModel].
extension BillModelPatterns on BillModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillModel value)  $default,){
final _that = this;
switch (_that) {
case _BillModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillModel value)?  $default,){
final _that = this;
switch (_that) {
case _BillModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'job_number')  String? jobNumber, @JsonKey(name: 'invoice_number')  String? invoiceNumber, @JsonKey(name: 'labour_charge')  String? labourCharge, @JsonKey(name: 'parts_charge')  String? partsCharge,  String? tax,  String? discount, @JsonKey(name: 'total_amount')  String? totalAmount, @JsonKey(name: 'amount_paid')  String? amountPaid, @JsonKey(name: 'payment_status')  PaymentStatusEnum? paymentStatus, @JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'vehicle_number')  String? vehicleNumber, @JsonKey(name: 'created_by')  int? createdBy, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillModel() when $default != null:
return $default(_that.id,_that.jobNumber,_that.invoiceNumber,_that.labourCharge,_that.partsCharge,_that.tax,_that.discount,_that.totalAmount,_that.amountPaid,_that.paymentStatus,_that.serviceJob,_that.customerName,_that.vehicleNumber,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'job_number')  String? jobNumber, @JsonKey(name: 'invoice_number')  String? invoiceNumber, @JsonKey(name: 'labour_charge')  String? labourCharge, @JsonKey(name: 'parts_charge')  String? partsCharge,  String? tax,  String? discount, @JsonKey(name: 'total_amount')  String? totalAmount, @JsonKey(name: 'amount_paid')  String? amountPaid, @JsonKey(name: 'payment_status')  PaymentStatusEnum? paymentStatus, @JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'vehicle_number')  String? vehicleNumber, @JsonKey(name: 'created_by')  int? createdBy, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BillModel():
return $default(_that.id,_that.jobNumber,_that.invoiceNumber,_that.labourCharge,_that.partsCharge,_that.tax,_that.discount,_that.totalAmount,_that.amountPaid,_that.paymentStatus,_that.serviceJob,_that.customerName,_that.vehicleNumber,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'job_number')  String? jobNumber, @JsonKey(name: 'invoice_number')  String? invoiceNumber, @JsonKey(name: 'labour_charge')  String? labourCharge, @JsonKey(name: 'parts_charge')  String? partsCharge,  String? tax,  String? discount, @JsonKey(name: 'total_amount')  String? totalAmount, @JsonKey(name: 'amount_paid')  String? amountPaid, @JsonKey(name: 'payment_status')  PaymentStatusEnum? paymentStatus, @JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'vehicle_number')  String? vehicleNumber, @JsonKey(name: 'created_by')  int? createdBy, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BillModel() when $default != null:
return $default(_that.id,_that.jobNumber,_that.invoiceNumber,_that.labourCharge,_that.partsCharge,_that.tax,_that.discount,_that.totalAmount,_that.amountPaid,_that.paymentStatus,_that.serviceJob,_that.customerName,_that.vehicleNumber,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BillModel implements BillModel {
  const _BillModel({required this.id, @JsonKey(name: 'job_number') this.jobNumber, @JsonKey(name: 'invoice_number') this.invoiceNumber, @JsonKey(name: 'labour_charge') this.labourCharge, @JsonKey(name: 'parts_charge') this.partsCharge, this.tax, this.discount, @JsonKey(name: 'total_amount') this.totalAmount, @JsonKey(name: 'amount_paid') this.amountPaid, @JsonKey(name: 'payment_status') this.paymentStatus, @JsonKey(name: 'service_job') required this.serviceJob, @JsonKey(name: 'customer_name') this.customerName, @JsonKey(name: 'vehicle_number') this.vehicleNumber, @JsonKey(name: 'created_by') this.createdBy, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _BillModel.fromJson(Map<String, dynamic> json) => _$BillModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'job_number') final  String? jobNumber;
@override@JsonKey(name: 'invoice_number') final  String? invoiceNumber;
@override@JsonKey(name: 'labour_charge') final  String? labourCharge;
@override@JsonKey(name: 'parts_charge') final  String? partsCharge;
@override final  String? tax;
@override final  String? discount;
@override@JsonKey(name: 'total_amount') final  String? totalAmount;
@override@JsonKey(name: 'amount_paid') final  String? amountPaid;
@override@JsonKey(name: 'payment_status') final  PaymentStatusEnum? paymentStatus;
@override@JsonKey(name: 'service_job') final  int serviceJob;
@override@JsonKey(name: 'customer_name') final  String? customerName;
@override@JsonKey(name: 'vehicle_number') final  String? vehicleNumber;
@override@JsonKey(name: 'created_by') final  int? createdBy;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of BillModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillModelCopyWith<_BillModel> get copyWith => __$BillModelCopyWithImpl<_BillModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BillModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobNumber, jobNumber) || other.jobNumber == jobNumber)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.labourCharge, labourCharge) || other.labourCharge == labourCharge)&&(identical(other.partsCharge, partsCharge) || other.partsCharge == partsCharge)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobNumber,invoiceNumber,labourCharge,partsCharge,tax,discount,totalAmount,amountPaid,paymentStatus,serviceJob,customerName,vehicleNumber,createdBy,createdAt,updatedAt);

@override
String toString() {
  return 'BillModel(id: $id, jobNumber: $jobNumber, invoiceNumber: $invoiceNumber, labourCharge: $labourCharge, partsCharge: $partsCharge, tax: $tax, discount: $discount, totalAmount: $totalAmount, amountPaid: $amountPaid, paymentStatus: $paymentStatus, serviceJob: $serviceJob, customerName: $customerName, vehicleNumber: $vehicleNumber, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BillModelCopyWith<$Res> implements $BillModelCopyWith<$Res> {
  factory _$BillModelCopyWith(_BillModel value, $Res Function(_BillModel) _then) = __$BillModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'job_number') String? jobNumber,@JsonKey(name: 'invoice_number') String? invoiceNumber,@JsonKey(name: 'labour_charge') String? labourCharge,@JsonKey(name: 'parts_charge') String? partsCharge, String? tax, String? discount,@JsonKey(name: 'total_amount') String? totalAmount,@JsonKey(name: 'amount_paid') String? amountPaid,@JsonKey(name: 'payment_status') PaymentStatusEnum? paymentStatus,@JsonKey(name: 'service_job') int serviceJob,@JsonKey(name: 'customer_name') String? customerName,@JsonKey(name: 'vehicle_number') String? vehicleNumber,@JsonKey(name: 'created_by') int? createdBy,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$BillModelCopyWithImpl<$Res>
    implements _$BillModelCopyWith<$Res> {
  __$BillModelCopyWithImpl(this._self, this._then);

  final _BillModel _self;
  final $Res Function(_BillModel) _then;

/// Create a copy of BillModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? jobNumber = freezed,Object? invoiceNumber = freezed,Object? labourCharge = freezed,Object? partsCharge = freezed,Object? tax = freezed,Object? discount = freezed,Object? totalAmount = freezed,Object? amountPaid = freezed,Object? paymentStatus = freezed,Object? serviceJob = null,Object? customerName = freezed,Object? vehicleNumber = freezed,Object? createdBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_BillModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,jobNumber: freezed == jobNumber ? _self.jobNumber : jobNumber // ignore: cast_nullable_to_non_nullable
as String?,invoiceNumber: freezed == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,labourCharge: freezed == labourCharge ? _self.labourCharge : labourCharge // ignore: cast_nullable_to_non_nullable
as String?,partsCharge: freezed == partsCharge ? _self.partsCharge : partsCharge // ignore: cast_nullable_to_non_nullable
as String?,tax: freezed == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as String?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String?,amountPaid: freezed == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatusEnum?,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,vehicleNumber: freezed == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BillCreateRequest {

@JsonKey(name: 'service_job') int get serviceJob;@JsonKey(name: 'labour_charge') String get labourCharge;@JsonKey(name: 'parts_charge') String get partsCharge; String? get tax; String? get discount;
/// Create a copy of BillCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillCreateRequestCopyWith<BillCreateRequest> get copyWith => _$BillCreateRequestCopyWithImpl<BillCreateRequest>(this as BillCreateRequest, _$identity);

  /// Serializes this BillCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillCreateRequest&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob)&&(identical(other.labourCharge, labourCharge) || other.labourCharge == labourCharge)&&(identical(other.partsCharge, partsCharge) || other.partsCharge == partsCharge)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceJob,labourCharge,partsCharge,tax,discount);

@override
String toString() {
  return 'BillCreateRequest(serviceJob: $serviceJob, labourCharge: $labourCharge, partsCharge: $partsCharge, tax: $tax, discount: $discount)';
}


}

/// @nodoc
abstract mixin class $BillCreateRequestCopyWith<$Res>  {
  factory $BillCreateRequestCopyWith(BillCreateRequest value, $Res Function(BillCreateRequest) _then) = _$BillCreateRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'service_job') int serviceJob,@JsonKey(name: 'labour_charge') String labourCharge,@JsonKey(name: 'parts_charge') String partsCharge, String? tax, String? discount
});




}
/// @nodoc
class _$BillCreateRequestCopyWithImpl<$Res>
    implements $BillCreateRequestCopyWith<$Res> {
  _$BillCreateRequestCopyWithImpl(this._self, this._then);

  final BillCreateRequest _self;
  final $Res Function(BillCreateRequest) _then;

/// Create a copy of BillCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceJob = null,Object? labourCharge = null,Object? partsCharge = null,Object? tax = freezed,Object? discount = freezed,}) {
  return _then(_self.copyWith(
serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,labourCharge: null == labourCharge ? _self.labourCharge : labourCharge // ignore: cast_nullable_to_non_nullable
as String,partsCharge: null == partsCharge ? _self.partsCharge : partsCharge // ignore: cast_nullable_to_non_nullable
as String,tax: freezed == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as String?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BillCreateRequest].
extension BillCreateRequestPatterns on BillCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _BillCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BillCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'labour_charge')  String labourCharge, @JsonKey(name: 'parts_charge')  String partsCharge,  String? tax,  String? discount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillCreateRequest() when $default != null:
return $default(_that.serviceJob,_that.labourCharge,_that.partsCharge,_that.tax,_that.discount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'labour_charge')  String labourCharge, @JsonKey(name: 'parts_charge')  String partsCharge,  String? tax,  String? discount)  $default,) {final _that = this;
switch (_that) {
case _BillCreateRequest():
return $default(_that.serviceJob,_that.labourCharge,_that.partsCharge,_that.tax,_that.discount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'service_job')  int serviceJob, @JsonKey(name: 'labour_charge')  String labourCharge, @JsonKey(name: 'parts_charge')  String partsCharge,  String? tax,  String? discount)?  $default,) {final _that = this;
switch (_that) {
case _BillCreateRequest() when $default != null:
return $default(_that.serviceJob,_that.labourCharge,_that.partsCharge,_that.tax,_that.discount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BillCreateRequest implements BillCreateRequest {
  const _BillCreateRequest({@JsonKey(name: 'service_job') required this.serviceJob, @JsonKey(name: 'labour_charge') required this.labourCharge, @JsonKey(name: 'parts_charge') required this.partsCharge, this.tax, this.discount});
  factory _BillCreateRequest.fromJson(Map<String, dynamic> json) => _$BillCreateRequestFromJson(json);

@override@JsonKey(name: 'service_job') final  int serviceJob;
@override@JsonKey(name: 'labour_charge') final  String labourCharge;
@override@JsonKey(name: 'parts_charge') final  String partsCharge;
@override final  String? tax;
@override final  String? discount;

/// Create a copy of BillCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillCreateRequestCopyWith<_BillCreateRequest> get copyWith => __$BillCreateRequestCopyWithImpl<_BillCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BillCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillCreateRequest&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob)&&(identical(other.labourCharge, labourCharge) || other.labourCharge == labourCharge)&&(identical(other.partsCharge, partsCharge) || other.partsCharge == partsCharge)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceJob,labourCharge,partsCharge,tax,discount);

@override
String toString() {
  return 'BillCreateRequest(serviceJob: $serviceJob, labourCharge: $labourCharge, partsCharge: $partsCharge, tax: $tax, discount: $discount)';
}


}

/// @nodoc
abstract mixin class _$BillCreateRequestCopyWith<$Res> implements $BillCreateRequestCopyWith<$Res> {
  factory _$BillCreateRequestCopyWith(_BillCreateRequest value, $Res Function(_BillCreateRequest) _then) = __$BillCreateRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'service_job') int serviceJob,@JsonKey(name: 'labour_charge') String labourCharge,@JsonKey(name: 'parts_charge') String partsCharge, String? tax, String? discount
});




}
/// @nodoc
class __$BillCreateRequestCopyWithImpl<$Res>
    implements _$BillCreateRequestCopyWith<$Res> {
  __$BillCreateRequestCopyWithImpl(this._self, this._then);

  final _BillCreateRequest _self;
  final $Res Function(_BillCreateRequest) _then;

/// Create a copy of BillCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceJob = null,Object? labourCharge = null,Object? partsCharge = null,Object? tax = freezed,Object? discount = freezed,}) {
  return _then(_BillCreateRequest(
serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,labourCharge: null == labourCharge ? _self.labourCharge : labourCharge // ignore: cast_nullable_to_non_nullable
as String,partsCharge: null == partsCharge ? _self.partsCharge : partsCharge // ignore: cast_nullable_to_non_nullable
as String,tax: freezed == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as String?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaginatedBillList {

 int get count; String? get next; String? get previous; List<BillModel> get results;
/// Create a copy of PaginatedBillList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedBillListCopyWith<PaginatedBillList> get copyWith => _$PaginatedBillListCopyWithImpl<PaginatedBillList>(this as PaginatedBillList, _$identity);

  /// Serializes this PaginatedBillList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedBillList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PaginatedBillList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedBillListCopyWith<$Res>  {
  factory $PaginatedBillListCopyWith(PaginatedBillList value, $Res Function(PaginatedBillList) _then) = _$PaginatedBillListCopyWithImpl;
@useResult
$Res call({
 int count, String? next, String? previous, List<BillModel> results
});




}
/// @nodoc
class _$PaginatedBillListCopyWithImpl<$Res>
    implements $PaginatedBillListCopyWith<$Res> {
  _$PaginatedBillListCopyWithImpl(this._self, this._then);

  final PaginatedBillList _self;
  final $Res Function(PaginatedBillList) _then;

/// Create a copy of PaginatedBillList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<BillModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedBillList].
extension PaginatedBillListPatterns on PaginatedBillList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedBillList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedBillList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedBillList value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedBillList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedBillList value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedBillList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<BillModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedBillList() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<BillModel> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedBillList():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String? next,  String? previous,  List<BillModel> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedBillList() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedBillList implements PaginatedBillList {
  const _PaginatedBillList({required this.count, this.next, this.previous, required final  List<BillModel> results}): _results = results;
  factory _PaginatedBillList.fromJson(Map<String, dynamic> json) => _$PaginatedBillListFromJson(json);

@override final  int count;
@override final  String? next;
@override final  String? previous;
 final  List<BillModel> _results;
@override List<BillModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedBillList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedBillListCopyWith<_PaginatedBillList> get copyWith => __$PaginatedBillListCopyWithImpl<_PaginatedBillList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedBillListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedBillList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PaginatedBillList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedBillListCopyWith<$Res> implements $PaginatedBillListCopyWith<$Res> {
  factory _$PaginatedBillListCopyWith(_PaginatedBillList value, $Res Function(_PaginatedBillList) _then) = __$PaginatedBillListCopyWithImpl;
@override @useResult
$Res call({
 int count, String? next, String? previous, List<BillModel> results
});




}
/// @nodoc
class __$PaginatedBillListCopyWithImpl<$Res>
    implements _$PaginatedBillListCopyWith<$Res> {
  __$PaginatedBillListCopyWithImpl(this._self, this._then);

  final _PaginatedBillList _self;
  final $Res Function(_PaginatedBillList) _then;

/// Create a copy of PaginatedBillList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PaginatedBillList(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<BillModel>,
  ));
}


}

// dart format on
