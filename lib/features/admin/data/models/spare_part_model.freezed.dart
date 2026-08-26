// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spare_part_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SparePartModel {

 int get id; String get name;@JsonKey(name: 'part_number') String get partNumber;@JsonKey(name: 'stock_quantity') String? get stockQuantity; String? get unit;@JsonKey(name: 'purchase_price') String? get purchasePrice;@JsonKey(name: 'selling_price') String? get sellingPrice;@JsonKey(name: 'minimum_stock') String? get minimumStock; SparePartStatus? get status;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of SparePartModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SparePartModelCopyWith<SparePartModel> get copyWith => _$SparePartModelCopyWithImpl<SparePartModel>(this as SparePartModel, _$identity);

  /// Serializes this SparePartModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SparePartModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.partNumber, partNumber) || other.partNumber == partNumber)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.minimumStock, minimumStock) || other.minimumStock == minimumStock)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,partNumber,stockQuantity,unit,purchasePrice,sellingPrice,minimumStock,status,createdAt,updatedAt);

@override
String toString() {
  return 'SparePartModel(id: $id, name: $name, partNumber: $partNumber, stockQuantity: $stockQuantity, unit: $unit, purchasePrice: $purchasePrice, sellingPrice: $sellingPrice, minimumStock: $minimumStock, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SparePartModelCopyWith<$Res>  {
  factory $SparePartModelCopyWith(SparePartModel value, $Res Function(SparePartModel) _then) = _$SparePartModelCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'part_number') String partNumber,@JsonKey(name: 'stock_quantity') String? stockQuantity, String? unit,@JsonKey(name: 'purchase_price') String? purchasePrice,@JsonKey(name: 'selling_price') String? sellingPrice,@JsonKey(name: 'minimum_stock') String? minimumStock, SparePartStatus? status,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$SparePartModelCopyWithImpl<$Res>
    implements $SparePartModelCopyWith<$Res> {
  _$SparePartModelCopyWithImpl(this._self, this._then);

  final SparePartModel _self;
  final $Res Function(SparePartModel) _then;

/// Create a copy of SparePartModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? partNumber = null,Object? stockQuantity = freezed,Object? unit = freezed,Object? purchasePrice = freezed,Object? sellingPrice = freezed,Object? minimumStock = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,partNumber: null == partNumber ? _self.partNumber : partNumber // ignore: cast_nullable_to_non_nullable
as String,stockQuantity: freezed == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,purchasePrice: freezed == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as String?,sellingPrice: freezed == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as String?,minimumStock: freezed == minimumStock ? _self.minimumStock : minimumStock // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SparePartStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SparePartModel].
extension SparePartModelPatterns on SparePartModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SparePartModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SparePartModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SparePartModel value)  $default,){
final _that = this;
switch (_that) {
case _SparePartModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SparePartModel value)?  $default,){
final _that = this;
switch (_that) {
case _SparePartModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'part_number')  String partNumber, @JsonKey(name: 'stock_quantity')  String? stockQuantity,  String? unit, @JsonKey(name: 'purchase_price')  String? purchasePrice, @JsonKey(name: 'selling_price')  String? sellingPrice, @JsonKey(name: 'minimum_stock')  String? minimumStock,  SparePartStatus? status, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SparePartModel() when $default != null:
return $default(_that.id,_that.name,_that.partNumber,_that.stockQuantity,_that.unit,_that.purchasePrice,_that.sellingPrice,_that.minimumStock,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'part_number')  String partNumber, @JsonKey(name: 'stock_quantity')  String? stockQuantity,  String? unit, @JsonKey(name: 'purchase_price')  String? purchasePrice, @JsonKey(name: 'selling_price')  String? sellingPrice, @JsonKey(name: 'minimum_stock')  String? minimumStock,  SparePartStatus? status, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SparePartModel():
return $default(_that.id,_that.name,_that.partNumber,_that.stockQuantity,_that.unit,_that.purchasePrice,_that.sellingPrice,_that.minimumStock,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'part_number')  String partNumber, @JsonKey(name: 'stock_quantity')  String? stockQuantity,  String? unit, @JsonKey(name: 'purchase_price')  String? purchasePrice, @JsonKey(name: 'selling_price')  String? sellingPrice, @JsonKey(name: 'minimum_stock')  String? minimumStock,  SparePartStatus? status, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SparePartModel() when $default != null:
return $default(_that.id,_that.name,_that.partNumber,_that.stockQuantity,_that.unit,_that.purchasePrice,_that.sellingPrice,_that.minimumStock,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SparePartModel implements SparePartModel {
  const _SparePartModel({required this.id, required this.name, @JsonKey(name: 'part_number') required this.partNumber, @JsonKey(name: 'stock_quantity') this.stockQuantity, this.unit, @JsonKey(name: 'purchase_price') this.purchasePrice, @JsonKey(name: 'selling_price') this.sellingPrice, @JsonKey(name: 'minimum_stock') this.minimumStock, this.status, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _SparePartModel.fromJson(Map<String, dynamic> json) => _$SparePartModelFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'part_number') final  String partNumber;
@override@JsonKey(name: 'stock_quantity') final  String? stockQuantity;
@override final  String? unit;
@override@JsonKey(name: 'purchase_price') final  String? purchasePrice;
@override@JsonKey(name: 'selling_price') final  String? sellingPrice;
@override@JsonKey(name: 'minimum_stock') final  String? minimumStock;
@override final  SparePartStatus? status;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of SparePartModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SparePartModelCopyWith<_SparePartModel> get copyWith => __$SparePartModelCopyWithImpl<_SparePartModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SparePartModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SparePartModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.partNumber, partNumber) || other.partNumber == partNumber)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.minimumStock, minimumStock) || other.minimumStock == minimumStock)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,partNumber,stockQuantity,unit,purchasePrice,sellingPrice,minimumStock,status,createdAt,updatedAt);

@override
String toString() {
  return 'SparePartModel(id: $id, name: $name, partNumber: $partNumber, stockQuantity: $stockQuantity, unit: $unit, purchasePrice: $purchasePrice, sellingPrice: $sellingPrice, minimumStock: $minimumStock, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SparePartModelCopyWith<$Res> implements $SparePartModelCopyWith<$Res> {
  factory _$SparePartModelCopyWith(_SparePartModel value, $Res Function(_SparePartModel) _then) = __$SparePartModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'part_number') String partNumber,@JsonKey(name: 'stock_quantity') String? stockQuantity, String? unit,@JsonKey(name: 'purchase_price') String? purchasePrice,@JsonKey(name: 'selling_price') String? sellingPrice,@JsonKey(name: 'minimum_stock') String? minimumStock, SparePartStatus? status,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$SparePartModelCopyWithImpl<$Res>
    implements _$SparePartModelCopyWith<$Res> {
  __$SparePartModelCopyWithImpl(this._self, this._then);

  final _SparePartModel _self;
  final $Res Function(_SparePartModel) _then;

/// Create a copy of SparePartModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? partNumber = null,Object? stockQuantity = freezed,Object? unit = freezed,Object? purchasePrice = freezed,Object? sellingPrice = freezed,Object? minimumStock = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_SparePartModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,partNumber: null == partNumber ? _self.partNumber : partNumber // ignore: cast_nullable_to_non_nullable
as String,stockQuantity: freezed == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,purchasePrice: freezed == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as String?,sellingPrice: freezed == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as String?,minimumStock: freezed == minimumStock ? _self.minimumStock : minimumStock // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SparePartStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SparePartCreateRequest {

 String get name;@JsonKey(name: 'part_number') String get partNumber;@JsonKey(name: 'stock_quantity') String? get stockQuantity; String? get unit;@JsonKey(name: 'purchase_price') String get purchasePrice;@JsonKey(name: 'selling_price') String get sellingPrice;@JsonKey(name: 'minimum_stock') String? get minimumStock;
/// Create a copy of SparePartCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SparePartCreateRequestCopyWith<SparePartCreateRequest> get copyWith => _$SparePartCreateRequestCopyWithImpl<SparePartCreateRequest>(this as SparePartCreateRequest, _$identity);

  /// Serializes this SparePartCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SparePartCreateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.partNumber, partNumber) || other.partNumber == partNumber)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.minimumStock, minimumStock) || other.minimumStock == minimumStock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,partNumber,stockQuantity,unit,purchasePrice,sellingPrice,minimumStock);

@override
String toString() {
  return 'SparePartCreateRequest(name: $name, partNumber: $partNumber, stockQuantity: $stockQuantity, unit: $unit, purchasePrice: $purchasePrice, sellingPrice: $sellingPrice, minimumStock: $minimumStock)';
}


}

/// @nodoc
abstract mixin class $SparePartCreateRequestCopyWith<$Res>  {
  factory $SparePartCreateRequestCopyWith(SparePartCreateRequest value, $Res Function(SparePartCreateRequest) _then) = _$SparePartCreateRequestCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'part_number') String partNumber,@JsonKey(name: 'stock_quantity') String? stockQuantity, String? unit,@JsonKey(name: 'purchase_price') String purchasePrice,@JsonKey(name: 'selling_price') String sellingPrice,@JsonKey(name: 'minimum_stock') String? minimumStock
});




}
/// @nodoc
class _$SparePartCreateRequestCopyWithImpl<$Res>
    implements $SparePartCreateRequestCopyWith<$Res> {
  _$SparePartCreateRequestCopyWithImpl(this._self, this._then);

  final SparePartCreateRequest _self;
  final $Res Function(SparePartCreateRequest) _then;

/// Create a copy of SparePartCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? partNumber = null,Object? stockQuantity = freezed,Object? unit = freezed,Object? purchasePrice = null,Object? sellingPrice = null,Object? minimumStock = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,partNumber: null == partNumber ? _self.partNumber : partNumber // ignore: cast_nullable_to_non_nullable
as String,stockQuantity: freezed == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,purchasePrice: null == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as String,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as String,minimumStock: freezed == minimumStock ? _self.minimumStock : minimumStock // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SparePartCreateRequest].
extension SparePartCreateRequestPatterns on SparePartCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SparePartCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SparePartCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SparePartCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _SparePartCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SparePartCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SparePartCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'part_number')  String partNumber, @JsonKey(name: 'stock_quantity')  String? stockQuantity,  String? unit, @JsonKey(name: 'purchase_price')  String purchasePrice, @JsonKey(name: 'selling_price')  String sellingPrice, @JsonKey(name: 'minimum_stock')  String? minimumStock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SparePartCreateRequest() when $default != null:
return $default(_that.name,_that.partNumber,_that.stockQuantity,_that.unit,_that.purchasePrice,_that.sellingPrice,_that.minimumStock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'part_number')  String partNumber, @JsonKey(name: 'stock_quantity')  String? stockQuantity,  String? unit, @JsonKey(name: 'purchase_price')  String purchasePrice, @JsonKey(name: 'selling_price')  String sellingPrice, @JsonKey(name: 'minimum_stock')  String? minimumStock)  $default,) {final _that = this;
switch (_that) {
case _SparePartCreateRequest():
return $default(_that.name,_that.partNumber,_that.stockQuantity,_that.unit,_that.purchasePrice,_that.sellingPrice,_that.minimumStock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'part_number')  String partNumber, @JsonKey(name: 'stock_quantity')  String? stockQuantity,  String? unit, @JsonKey(name: 'purchase_price')  String purchasePrice, @JsonKey(name: 'selling_price')  String sellingPrice, @JsonKey(name: 'minimum_stock')  String? minimumStock)?  $default,) {final _that = this;
switch (_that) {
case _SparePartCreateRequest() when $default != null:
return $default(_that.name,_that.partNumber,_that.stockQuantity,_that.unit,_that.purchasePrice,_that.sellingPrice,_that.minimumStock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SparePartCreateRequest implements SparePartCreateRequest {
  const _SparePartCreateRequest({required this.name, @JsonKey(name: 'part_number') required this.partNumber, @JsonKey(name: 'stock_quantity') this.stockQuantity, this.unit, @JsonKey(name: 'purchase_price') required this.purchasePrice, @JsonKey(name: 'selling_price') required this.sellingPrice, @JsonKey(name: 'minimum_stock') this.minimumStock});
  factory _SparePartCreateRequest.fromJson(Map<String, dynamic> json) => _$SparePartCreateRequestFromJson(json);

@override final  String name;
@override@JsonKey(name: 'part_number') final  String partNumber;
@override@JsonKey(name: 'stock_quantity') final  String? stockQuantity;
@override final  String? unit;
@override@JsonKey(name: 'purchase_price') final  String purchasePrice;
@override@JsonKey(name: 'selling_price') final  String sellingPrice;
@override@JsonKey(name: 'minimum_stock') final  String? minimumStock;

/// Create a copy of SparePartCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SparePartCreateRequestCopyWith<_SparePartCreateRequest> get copyWith => __$SparePartCreateRequestCopyWithImpl<_SparePartCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SparePartCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SparePartCreateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.partNumber, partNumber) || other.partNumber == partNumber)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.minimumStock, minimumStock) || other.minimumStock == minimumStock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,partNumber,stockQuantity,unit,purchasePrice,sellingPrice,minimumStock);

@override
String toString() {
  return 'SparePartCreateRequest(name: $name, partNumber: $partNumber, stockQuantity: $stockQuantity, unit: $unit, purchasePrice: $purchasePrice, sellingPrice: $sellingPrice, minimumStock: $minimumStock)';
}


}

/// @nodoc
abstract mixin class _$SparePartCreateRequestCopyWith<$Res> implements $SparePartCreateRequestCopyWith<$Res> {
  factory _$SparePartCreateRequestCopyWith(_SparePartCreateRequest value, $Res Function(_SparePartCreateRequest) _then) = __$SparePartCreateRequestCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'part_number') String partNumber,@JsonKey(name: 'stock_quantity') String? stockQuantity, String? unit,@JsonKey(name: 'purchase_price') String purchasePrice,@JsonKey(name: 'selling_price') String sellingPrice,@JsonKey(name: 'minimum_stock') String? minimumStock
});




}
/// @nodoc
class __$SparePartCreateRequestCopyWithImpl<$Res>
    implements _$SparePartCreateRequestCopyWith<$Res> {
  __$SparePartCreateRequestCopyWithImpl(this._self, this._then);

  final _SparePartCreateRequest _self;
  final $Res Function(_SparePartCreateRequest) _then;

/// Create a copy of SparePartCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? partNumber = null,Object? stockQuantity = freezed,Object? unit = freezed,Object? purchasePrice = null,Object? sellingPrice = null,Object? minimumStock = freezed,}) {
  return _then(_SparePartCreateRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,partNumber: null == partNumber ? _self.partNumber : partNumber // ignore: cast_nullable_to_non_nullable
as String,stockQuantity: freezed == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,purchasePrice: null == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as String,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as String,minimumStock: freezed == minimumStock ? _self.minimumStock : minimumStock // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaginatedSparePartList {

 int get count; String? get next; String? get previous; List<SparePartModel> get results;
/// Create a copy of PaginatedSparePartList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedSparePartListCopyWith<PaginatedSparePartList> get copyWith => _$PaginatedSparePartListCopyWithImpl<PaginatedSparePartList>(this as PaginatedSparePartList, _$identity);

  /// Serializes this PaginatedSparePartList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedSparePartList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PaginatedSparePartList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedSparePartListCopyWith<$Res>  {
  factory $PaginatedSparePartListCopyWith(PaginatedSparePartList value, $Res Function(PaginatedSparePartList) _then) = _$PaginatedSparePartListCopyWithImpl;
@useResult
$Res call({
 int count, String? next, String? previous, List<SparePartModel> results
});




}
/// @nodoc
class _$PaginatedSparePartListCopyWithImpl<$Res>
    implements $PaginatedSparePartListCopyWith<$Res> {
  _$PaginatedSparePartListCopyWithImpl(this._self, this._then);

  final PaginatedSparePartList _self;
  final $Res Function(PaginatedSparePartList) _then;

/// Create a copy of PaginatedSparePartList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<SparePartModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedSparePartList].
extension PaginatedSparePartListPatterns on PaginatedSparePartList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedSparePartList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedSparePartList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedSparePartList value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedSparePartList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedSparePartList value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedSparePartList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<SparePartModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedSparePartList() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<SparePartModel> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedSparePartList():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String? next,  String? previous,  List<SparePartModel> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedSparePartList() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedSparePartList implements PaginatedSparePartList {
  const _PaginatedSparePartList({required this.count, this.next, this.previous, required final  List<SparePartModel> results}): _results = results;
  factory _PaginatedSparePartList.fromJson(Map<String, dynamic> json) => _$PaginatedSparePartListFromJson(json);

@override final  int count;
@override final  String? next;
@override final  String? previous;
 final  List<SparePartModel> _results;
@override List<SparePartModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedSparePartList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedSparePartListCopyWith<_PaginatedSparePartList> get copyWith => __$PaginatedSparePartListCopyWithImpl<_PaginatedSparePartList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedSparePartListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedSparePartList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PaginatedSparePartList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedSparePartListCopyWith<$Res> implements $PaginatedSparePartListCopyWith<$Res> {
  factory _$PaginatedSparePartListCopyWith(_PaginatedSparePartList value, $Res Function(_PaginatedSparePartList) _then) = __$PaginatedSparePartListCopyWithImpl;
@override @useResult
$Res call({
 int count, String? next, String? previous, List<SparePartModel> results
});




}
/// @nodoc
class __$PaginatedSparePartListCopyWithImpl<$Res>
    implements _$PaginatedSparePartListCopyWith<$Res> {
  __$PaginatedSparePartListCopyWithImpl(this._self, this._then);

  final _PaginatedSparePartList _self;
  final $Res Function(_PaginatedSparePartList) _then;

/// Create a copy of PaginatedSparePartList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PaginatedSparePartList(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<SparePartModel>,
  ));
}


}


/// @nodoc
mixin _$StockMovementModel {

 int get id;@JsonKey(name: 'spare_part') int? get sparePart; String get quantity; String get movementType; String? get reference;@JsonKey(name: 'created_by') int? get createdBy;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of StockMovementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockMovementModelCopyWith<StockMovementModel> get copyWith => _$StockMovementModelCopyWithImpl<StockMovementModel>(this as StockMovementModel, _$identity);

  /// Serializes this StockMovementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockMovementModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sparePart, sparePart) || other.sparePart == sparePart)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.movementType, movementType) || other.movementType == movementType)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sparePart,quantity,movementType,reference,createdBy,createdAt);

@override
String toString() {
  return 'StockMovementModel(id: $id, sparePart: $sparePart, quantity: $quantity, movementType: $movementType, reference: $reference, createdBy: $createdBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $StockMovementModelCopyWith<$Res>  {
  factory $StockMovementModelCopyWith(StockMovementModel value, $Res Function(StockMovementModel) _then) = _$StockMovementModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'spare_part') int? sparePart, String quantity, String movementType, String? reference,@JsonKey(name: 'created_by') int? createdBy,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$StockMovementModelCopyWithImpl<$Res>
    implements $StockMovementModelCopyWith<$Res> {
  _$StockMovementModelCopyWithImpl(this._self, this._then);

  final StockMovementModel _self;
  final $Res Function(StockMovementModel) _then;

/// Create a copy of StockMovementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sparePart = freezed,Object? quantity = null,Object? movementType = null,Object? reference = freezed,Object? createdBy = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sparePart: freezed == sparePart ? _self.sparePart : sparePart // ignore: cast_nullable_to_non_nullable
as int?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,movementType: null == movementType ? _self.movementType : movementType // ignore: cast_nullable_to_non_nullable
as String,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StockMovementModel].
extension StockMovementModelPatterns on StockMovementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockMovementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockMovementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockMovementModel value)  $default,){
final _that = this;
switch (_that) {
case _StockMovementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockMovementModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockMovementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'spare_part')  int? sparePart,  String quantity,  String movementType,  String? reference, @JsonKey(name: 'created_by')  int? createdBy, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockMovementModel() when $default != null:
return $default(_that.id,_that.sparePart,_that.quantity,_that.movementType,_that.reference,_that.createdBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'spare_part')  int? sparePart,  String quantity,  String movementType,  String? reference, @JsonKey(name: 'created_by')  int? createdBy, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _StockMovementModel():
return $default(_that.id,_that.sparePart,_that.quantity,_that.movementType,_that.reference,_that.createdBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'spare_part')  int? sparePart,  String quantity,  String movementType,  String? reference, @JsonKey(name: 'created_by')  int? createdBy, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StockMovementModel() when $default != null:
return $default(_that.id,_that.sparePart,_that.quantity,_that.movementType,_that.reference,_that.createdBy,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockMovementModel implements StockMovementModel {
  const _StockMovementModel({required this.id, @JsonKey(name: 'spare_part') this.sparePart, required this.quantity, required this.movementType, this.reference, @JsonKey(name: 'created_by') this.createdBy, @JsonKey(name: 'created_at') this.createdAt});
  factory _StockMovementModel.fromJson(Map<String, dynamic> json) => _$StockMovementModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'spare_part') final  int? sparePart;
@override final  String quantity;
@override final  String movementType;
@override final  String? reference;
@override@JsonKey(name: 'created_by') final  int? createdBy;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of StockMovementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockMovementModelCopyWith<_StockMovementModel> get copyWith => __$StockMovementModelCopyWithImpl<_StockMovementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockMovementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockMovementModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sparePart, sparePart) || other.sparePart == sparePart)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.movementType, movementType) || other.movementType == movementType)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sparePart,quantity,movementType,reference,createdBy,createdAt);

@override
String toString() {
  return 'StockMovementModel(id: $id, sparePart: $sparePart, quantity: $quantity, movementType: $movementType, reference: $reference, createdBy: $createdBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StockMovementModelCopyWith<$Res> implements $StockMovementModelCopyWith<$Res> {
  factory _$StockMovementModelCopyWith(_StockMovementModel value, $Res Function(_StockMovementModel) _then) = __$StockMovementModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'spare_part') int? sparePart, String quantity, String movementType, String? reference,@JsonKey(name: 'created_by') int? createdBy,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$StockMovementModelCopyWithImpl<$Res>
    implements _$StockMovementModelCopyWith<$Res> {
  __$StockMovementModelCopyWithImpl(this._self, this._then);

  final _StockMovementModel _self;
  final $Res Function(_StockMovementModel) _then;

/// Create a copy of StockMovementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sparePart = freezed,Object? quantity = null,Object? movementType = null,Object? reference = freezed,Object? createdBy = freezed,Object? createdAt = freezed,}) {
  return _then(_StockMovementModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sparePart: freezed == sparePart ? _self.sparePart : sparePart // ignore: cast_nullable_to_non_nullable
as int?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,movementType: null == movementType ? _self.movementType : movementType // ignore: cast_nullable_to_non_nullable
as String,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
