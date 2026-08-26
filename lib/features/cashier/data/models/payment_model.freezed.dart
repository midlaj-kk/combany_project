// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentModel {

 int get id;@JsonKey(name: 'payment_method') PaymentMethod? get paymentMethod;@JsonKey(name: 'paid_amount') String? get paidAmount;@JsonKey(name: 'payment_date') String? get paymentDate;@JsonKey(name: 'razorpay_payment_id') String? get razorpayPaymentId;@JsonKey(name: 'created_at') String? get createdAt; int get bill;@JsonKey(name: 'received_by') int? get receivedBy;@JsonKey(name: 'razorpay_order') int? get razorpayOrder;
/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<PaymentModel> get copyWith => _$PaymentModelCopyWithImpl<PaymentModel>(this as PaymentModel, _$identity);

  /// Serializes this PaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.paymentDate, paymentDate) || other.paymentDate == paymentDate)&&(identical(other.razorpayPaymentId, razorpayPaymentId) || other.razorpayPaymentId == razorpayPaymentId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.bill, bill) || other.bill == bill)&&(identical(other.receivedBy, receivedBy) || other.receivedBy == receivedBy)&&(identical(other.razorpayOrder, razorpayOrder) || other.razorpayOrder == razorpayOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,paymentMethod,paidAmount,paymentDate,razorpayPaymentId,createdAt,bill,receivedBy,razorpayOrder);

@override
String toString() {
  return 'PaymentModel(id: $id, paymentMethod: $paymentMethod, paidAmount: $paidAmount, paymentDate: $paymentDate, razorpayPaymentId: $razorpayPaymentId, createdAt: $createdAt, bill: $bill, receivedBy: $receivedBy, razorpayOrder: $razorpayOrder)';
}


}

/// @nodoc
abstract mixin class $PaymentModelCopyWith<$Res>  {
  factory $PaymentModelCopyWith(PaymentModel value, $Res Function(PaymentModel) _then) = _$PaymentModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'payment_method') PaymentMethod? paymentMethod,@JsonKey(name: 'paid_amount') String? paidAmount,@JsonKey(name: 'payment_date') String? paymentDate,@JsonKey(name: 'razorpay_payment_id') String? razorpayPaymentId,@JsonKey(name: 'created_at') String? createdAt, int bill,@JsonKey(name: 'received_by') int? receivedBy,@JsonKey(name: 'razorpay_order') int? razorpayOrder
});




}
/// @nodoc
class _$PaymentModelCopyWithImpl<$Res>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._self, this._then);

  final PaymentModel _self;
  final $Res Function(PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? paymentMethod = freezed,Object? paidAmount = freezed,Object? paymentDate = freezed,Object? razorpayPaymentId = freezed,Object? createdAt = freezed,Object? bill = null,Object? receivedBy = freezed,Object? razorpayOrder = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,paidAmount: freezed == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String?,paymentDate: freezed == paymentDate ? _self.paymentDate : paymentDate // ignore: cast_nullable_to_non_nullable
as String?,razorpayPaymentId: freezed == razorpayPaymentId ? _self.razorpayPaymentId : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,bill: null == bill ? _self.bill : bill // ignore: cast_nullable_to_non_nullable
as int,receivedBy: freezed == receivedBy ? _self.receivedBy : receivedBy // ignore: cast_nullable_to_non_nullable
as int?,razorpayOrder: freezed == razorpayOrder ? _self.razorpayOrder : razorpayOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentModel].
extension PaymentModelPatterns on PaymentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'payment_method')  PaymentMethod? paymentMethod, @JsonKey(name: 'paid_amount')  String? paidAmount, @JsonKey(name: 'payment_date')  String? paymentDate, @JsonKey(name: 'razorpay_payment_id')  String? razorpayPaymentId, @JsonKey(name: 'created_at')  String? createdAt,  int bill, @JsonKey(name: 'received_by')  int? receivedBy, @JsonKey(name: 'razorpay_order')  int? razorpayOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.paymentMethod,_that.paidAmount,_that.paymentDate,_that.razorpayPaymentId,_that.createdAt,_that.bill,_that.receivedBy,_that.razorpayOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'payment_method')  PaymentMethod? paymentMethod, @JsonKey(name: 'paid_amount')  String? paidAmount, @JsonKey(name: 'payment_date')  String? paymentDate, @JsonKey(name: 'razorpay_payment_id')  String? razorpayPaymentId, @JsonKey(name: 'created_at')  String? createdAt,  int bill, @JsonKey(name: 'received_by')  int? receivedBy, @JsonKey(name: 'razorpay_order')  int? razorpayOrder)  $default,) {final _that = this;
switch (_that) {
case _PaymentModel():
return $default(_that.id,_that.paymentMethod,_that.paidAmount,_that.paymentDate,_that.razorpayPaymentId,_that.createdAt,_that.bill,_that.receivedBy,_that.razorpayOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'payment_method')  PaymentMethod? paymentMethod, @JsonKey(name: 'paid_amount')  String? paidAmount, @JsonKey(name: 'payment_date')  String? paymentDate, @JsonKey(name: 'razorpay_payment_id')  String? razorpayPaymentId, @JsonKey(name: 'created_at')  String? createdAt,  int bill, @JsonKey(name: 'received_by')  int? receivedBy, @JsonKey(name: 'razorpay_order')  int? razorpayOrder)?  $default,) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.paymentMethod,_that.paidAmount,_that.paymentDate,_that.razorpayPaymentId,_that.createdAt,_that.bill,_that.receivedBy,_that.razorpayOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentModel implements PaymentModel {
  const _PaymentModel({required this.id, @JsonKey(name: 'payment_method') this.paymentMethod, @JsonKey(name: 'paid_amount') this.paidAmount, @JsonKey(name: 'payment_date') this.paymentDate, @JsonKey(name: 'razorpay_payment_id') this.razorpayPaymentId, @JsonKey(name: 'created_at') this.createdAt, required this.bill, @JsonKey(name: 'received_by') this.receivedBy, @JsonKey(name: 'razorpay_order') this.razorpayOrder});
  factory _PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'payment_method') final  PaymentMethod? paymentMethod;
@override@JsonKey(name: 'paid_amount') final  String? paidAmount;
@override@JsonKey(name: 'payment_date') final  String? paymentDate;
@override@JsonKey(name: 'razorpay_payment_id') final  String? razorpayPaymentId;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override final  int bill;
@override@JsonKey(name: 'received_by') final  int? receivedBy;
@override@JsonKey(name: 'razorpay_order') final  int? razorpayOrder;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentModelCopyWith<_PaymentModel> get copyWith => __$PaymentModelCopyWithImpl<_PaymentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.paymentDate, paymentDate) || other.paymentDate == paymentDate)&&(identical(other.razorpayPaymentId, razorpayPaymentId) || other.razorpayPaymentId == razorpayPaymentId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.bill, bill) || other.bill == bill)&&(identical(other.receivedBy, receivedBy) || other.receivedBy == receivedBy)&&(identical(other.razorpayOrder, razorpayOrder) || other.razorpayOrder == razorpayOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,paymentMethod,paidAmount,paymentDate,razorpayPaymentId,createdAt,bill,receivedBy,razorpayOrder);

@override
String toString() {
  return 'PaymentModel(id: $id, paymentMethod: $paymentMethod, paidAmount: $paidAmount, paymentDate: $paymentDate, razorpayPaymentId: $razorpayPaymentId, createdAt: $createdAt, bill: $bill, receivedBy: $receivedBy, razorpayOrder: $razorpayOrder)';
}


}

/// @nodoc
abstract mixin class _$PaymentModelCopyWith<$Res> implements $PaymentModelCopyWith<$Res> {
  factory _$PaymentModelCopyWith(_PaymentModel value, $Res Function(_PaymentModel) _then) = __$PaymentModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'payment_method') PaymentMethod? paymentMethod,@JsonKey(name: 'paid_amount') String? paidAmount,@JsonKey(name: 'payment_date') String? paymentDate,@JsonKey(name: 'razorpay_payment_id') String? razorpayPaymentId,@JsonKey(name: 'created_at') String? createdAt, int bill,@JsonKey(name: 'received_by') int? receivedBy,@JsonKey(name: 'razorpay_order') int? razorpayOrder
});




}
/// @nodoc
class __$PaymentModelCopyWithImpl<$Res>
    implements _$PaymentModelCopyWith<$Res> {
  __$PaymentModelCopyWithImpl(this._self, this._then);

  final _PaymentModel _self;
  final $Res Function(_PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? paymentMethod = freezed,Object? paidAmount = freezed,Object? paymentDate = freezed,Object? razorpayPaymentId = freezed,Object? createdAt = freezed,Object? bill = null,Object? receivedBy = freezed,Object? razorpayOrder = freezed,}) {
  return _then(_PaymentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,paidAmount: freezed == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String?,paymentDate: freezed == paymentDate ? _self.paymentDate : paymentDate // ignore: cast_nullable_to_non_nullable
as String?,razorpayPaymentId: freezed == razorpayPaymentId ? _self.razorpayPaymentId : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,bill: null == bill ? _self.bill : bill // ignore: cast_nullable_to_non_nullable
as int,receivedBy: freezed == receivedBy ? _self.receivedBy : receivedBy // ignore: cast_nullable_to_non_nullable
as int?,razorpayOrder: freezed == razorpayOrder ? _self.razorpayOrder : razorpayOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PaymentCreateRequest {

@JsonKey(name: 'payment_method') PaymentMethod get paymentMethod;@JsonKey(name: 'paid_amount') String get paidAmount;@JsonKey(name: 'payment_date') String get paymentDate;@JsonKey(name: 'razorpay_payment_id') String? get razorpayPaymentId; int get bill;@JsonKey(name: 'razorpay_order') int? get razorpayOrder;
/// Create a copy of PaymentCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCreateRequestCopyWith<PaymentCreateRequest> get copyWith => _$PaymentCreateRequestCopyWithImpl<PaymentCreateRequest>(this as PaymentCreateRequest, _$identity);

  /// Serializes this PaymentCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentCreateRequest&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.paymentDate, paymentDate) || other.paymentDate == paymentDate)&&(identical(other.razorpayPaymentId, razorpayPaymentId) || other.razorpayPaymentId == razorpayPaymentId)&&(identical(other.bill, bill) || other.bill == bill)&&(identical(other.razorpayOrder, razorpayOrder) || other.razorpayOrder == razorpayOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentMethod,paidAmount,paymentDate,razorpayPaymentId,bill,razorpayOrder);

@override
String toString() {
  return 'PaymentCreateRequest(paymentMethod: $paymentMethod, paidAmount: $paidAmount, paymentDate: $paymentDate, razorpayPaymentId: $razorpayPaymentId, bill: $bill, razorpayOrder: $razorpayOrder)';
}


}

/// @nodoc
abstract mixin class $PaymentCreateRequestCopyWith<$Res>  {
  factory $PaymentCreateRequestCopyWith(PaymentCreateRequest value, $Res Function(PaymentCreateRequest) _then) = _$PaymentCreateRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'payment_method') PaymentMethod paymentMethod,@JsonKey(name: 'paid_amount') String paidAmount,@JsonKey(name: 'payment_date') String paymentDate,@JsonKey(name: 'razorpay_payment_id') String? razorpayPaymentId, int bill,@JsonKey(name: 'razorpay_order') int? razorpayOrder
});




}
/// @nodoc
class _$PaymentCreateRequestCopyWithImpl<$Res>
    implements $PaymentCreateRequestCopyWith<$Res> {
  _$PaymentCreateRequestCopyWithImpl(this._self, this._then);

  final PaymentCreateRequest _self;
  final $Res Function(PaymentCreateRequest) _then;

/// Create a copy of PaymentCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentMethod = null,Object? paidAmount = null,Object? paymentDate = null,Object? razorpayPaymentId = freezed,Object? bill = null,Object? razorpayOrder = freezed,}) {
  return _then(_self.copyWith(
paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,paymentDate: null == paymentDate ? _self.paymentDate : paymentDate // ignore: cast_nullable_to_non_nullable
as String,razorpayPaymentId: freezed == razorpayPaymentId ? _self.razorpayPaymentId : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
as String?,bill: null == bill ? _self.bill : bill // ignore: cast_nullable_to_non_nullable
as int,razorpayOrder: freezed == razorpayOrder ? _self.razorpayOrder : razorpayOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentCreateRequest].
extension PaymentCreateRequestPatterns on PaymentCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _PaymentCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'payment_method')  PaymentMethod paymentMethod, @JsonKey(name: 'paid_amount')  String paidAmount, @JsonKey(name: 'payment_date')  String paymentDate, @JsonKey(name: 'razorpay_payment_id')  String? razorpayPaymentId,  int bill, @JsonKey(name: 'razorpay_order')  int? razorpayOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentCreateRequest() when $default != null:
return $default(_that.paymentMethod,_that.paidAmount,_that.paymentDate,_that.razorpayPaymentId,_that.bill,_that.razorpayOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'payment_method')  PaymentMethod paymentMethod, @JsonKey(name: 'paid_amount')  String paidAmount, @JsonKey(name: 'payment_date')  String paymentDate, @JsonKey(name: 'razorpay_payment_id')  String? razorpayPaymentId,  int bill, @JsonKey(name: 'razorpay_order')  int? razorpayOrder)  $default,) {final _that = this;
switch (_that) {
case _PaymentCreateRequest():
return $default(_that.paymentMethod,_that.paidAmount,_that.paymentDate,_that.razorpayPaymentId,_that.bill,_that.razorpayOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'payment_method')  PaymentMethod paymentMethod, @JsonKey(name: 'paid_amount')  String paidAmount, @JsonKey(name: 'payment_date')  String paymentDate, @JsonKey(name: 'razorpay_payment_id')  String? razorpayPaymentId,  int bill, @JsonKey(name: 'razorpay_order')  int? razorpayOrder)?  $default,) {final _that = this;
switch (_that) {
case _PaymentCreateRequest() when $default != null:
return $default(_that.paymentMethod,_that.paidAmount,_that.paymentDate,_that.razorpayPaymentId,_that.bill,_that.razorpayOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentCreateRequest implements PaymentCreateRequest {
  const _PaymentCreateRequest({@JsonKey(name: 'payment_method') required this.paymentMethod, @JsonKey(name: 'paid_amount') required this.paidAmount, @JsonKey(name: 'payment_date') required this.paymentDate, @JsonKey(name: 'razorpay_payment_id') this.razorpayPaymentId, required this.bill, @JsonKey(name: 'razorpay_order') this.razorpayOrder});
  factory _PaymentCreateRequest.fromJson(Map<String, dynamic> json) => _$PaymentCreateRequestFromJson(json);

@override@JsonKey(name: 'payment_method') final  PaymentMethod paymentMethod;
@override@JsonKey(name: 'paid_amount') final  String paidAmount;
@override@JsonKey(name: 'payment_date') final  String paymentDate;
@override@JsonKey(name: 'razorpay_payment_id') final  String? razorpayPaymentId;
@override final  int bill;
@override@JsonKey(name: 'razorpay_order') final  int? razorpayOrder;

/// Create a copy of PaymentCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCreateRequestCopyWith<_PaymentCreateRequest> get copyWith => __$PaymentCreateRequestCopyWithImpl<_PaymentCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentCreateRequest&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.paymentDate, paymentDate) || other.paymentDate == paymentDate)&&(identical(other.razorpayPaymentId, razorpayPaymentId) || other.razorpayPaymentId == razorpayPaymentId)&&(identical(other.bill, bill) || other.bill == bill)&&(identical(other.razorpayOrder, razorpayOrder) || other.razorpayOrder == razorpayOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentMethod,paidAmount,paymentDate,razorpayPaymentId,bill,razorpayOrder);

@override
String toString() {
  return 'PaymentCreateRequest(paymentMethod: $paymentMethod, paidAmount: $paidAmount, paymentDate: $paymentDate, razorpayPaymentId: $razorpayPaymentId, bill: $bill, razorpayOrder: $razorpayOrder)';
}


}

/// @nodoc
abstract mixin class _$PaymentCreateRequestCopyWith<$Res> implements $PaymentCreateRequestCopyWith<$Res> {
  factory _$PaymentCreateRequestCopyWith(_PaymentCreateRequest value, $Res Function(_PaymentCreateRequest) _then) = __$PaymentCreateRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'payment_method') PaymentMethod paymentMethod,@JsonKey(name: 'paid_amount') String paidAmount,@JsonKey(name: 'payment_date') String paymentDate,@JsonKey(name: 'razorpay_payment_id') String? razorpayPaymentId, int bill,@JsonKey(name: 'razorpay_order') int? razorpayOrder
});




}
/// @nodoc
class __$PaymentCreateRequestCopyWithImpl<$Res>
    implements _$PaymentCreateRequestCopyWith<$Res> {
  __$PaymentCreateRequestCopyWithImpl(this._self, this._then);

  final _PaymentCreateRequest _self;
  final $Res Function(_PaymentCreateRequest) _then;

/// Create a copy of PaymentCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentMethod = null,Object? paidAmount = null,Object? paymentDate = null,Object? razorpayPaymentId = freezed,Object? bill = null,Object? razorpayOrder = freezed,}) {
  return _then(_PaymentCreateRequest(
paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,paymentDate: null == paymentDate ? _self.paymentDate : paymentDate // ignore: cast_nullable_to_non_nullable
as String,razorpayPaymentId: freezed == razorpayPaymentId ? _self.razorpayPaymentId : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
as String?,bill: null == bill ? _self.bill : bill // ignore: cast_nullable_to_non_nullable
as int,razorpayOrder: freezed == razorpayOrder ? _self.razorpayOrder : razorpayOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PaginatedPaymentList {

 int get count; String? get next; String? get previous; List<PaymentModel> get results;
/// Create a copy of PaginatedPaymentList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedPaymentListCopyWith<PaginatedPaymentList> get copyWith => _$PaginatedPaymentListCopyWithImpl<PaginatedPaymentList>(this as PaginatedPaymentList, _$identity);

  /// Serializes this PaginatedPaymentList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedPaymentList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PaginatedPaymentList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedPaymentListCopyWith<$Res>  {
  factory $PaginatedPaymentListCopyWith(PaginatedPaymentList value, $Res Function(PaginatedPaymentList) _then) = _$PaginatedPaymentListCopyWithImpl;
@useResult
$Res call({
 int count, String? next, String? previous, List<PaymentModel> results
});




}
/// @nodoc
class _$PaginatedPaymentListCopyWithImpl<$Res>
    implements $PaginatedPaymentListCopyWith<$Res> {
  _$PaginatedPaymentListCopyWithImpl(this._self, this._then);

  final PaginatedPaymentList _self;
  final $Res Function(PaginatedPaymentList) _then;

/// Create a copy of PaginatedPaymentList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<PaymentModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedPaymentList].
extension PaginatedPaymentListPatterns on PaginatedPaymentList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedPaymentList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedPaymentList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedPaymentList value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedPaymentList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedPaymentList value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedPaymentList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<PaymentModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedPaymentList() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<PaymentModel> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedPaymentList():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String? next,  String? previous,  List<PaymentModel> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedPaymentList() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedPaymentList implements PaginatedPaymentList {
  const _PaginatedPaymentList({required this.count, this.next, this.previous, required final  List<PaymentModel> results}): _results = results;
  factory _PaginatedPaymentList.fromJson(Map<String, dynamic> json) => _$PaginatedPaymentListFromJson(json);

@override final  int count;
@override final  String? next;
@override final  String? previous;
 final  List<PaymentModel> _results;
@override List<PaymentModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedPaymentList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedPaymentListCopyWith<_PaginatedPaymentList> get copyWith => __$PaginatedPaymentListCopyWithImpl<_PaginatedPaymentList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedPaymentListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedPaymentList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PaginatedPaymentList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedPaymentListCopyWith<$Res> implements $PaginatedPaymentListCopyWith<$Res> {
  factory _$PaginatedPaymentListCopyWith(_PaginatedPaymentList value, $Res Function(_PaginatedPaymentList) _then) = __$PaginatedPaymentListCopyWithImpl;
@override @useResult
$Res call({
 int count, String? next, String? previous, List<PaymentModel> results
});




}
/// @nodoc
class __$PaginatedPaymentListCopyWithImpl<$Res>
    implements _$PaginatedPaymentListCopyWith<$Res> {
  __$PaginatedPaymentListCopyWithImpl(this._self, this._then);

  final _PaginatedPaymentList _self;
  final $Res Function(_PaginatedPaymentList) _then;

/// Create a copy of PaginatedPaymentList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PaginatedPaymentList(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<PaymentModel>,
  ));
}


}

// dart format on
