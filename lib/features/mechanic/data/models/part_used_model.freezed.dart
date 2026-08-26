// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_used_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartUsedModel {

 int get id;@JsonKey(name: 'service_job') int get serviceJob; int get part;@JsonKey(name: 'part_name') String? get partName;@JsonKey(name: 'part_number') String? get partNumber; String get quantity; String? get price;@JsonKey(name: 'added_by') int? get addedBy;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of PartUsedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartUsedModelCopyWith<PartUsedModel> get copyWith => _$PartUsedModelCopyWithImpl<PartUsedModel>(this as PartUsedModel, _$identity);

  /// Serializes this PartUsedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartUsedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob)&&(identical(other.part, part) || other.part == part)&&(identical(other.partName, partName) || other.partName == partName)&&(identical(other.partNumber, partNumber) || other.partNumber == partNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.addedBy, addedBy) || other.addedBy == addedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceJob,part,partName,partNumber,quantity,price,addedBy,createdAt,updatedAt);

@override
String toString() {
  return 'PartUsedModel(id: $id, serviceJob: $serviceJob, part: $part, partName: $partName, partNumber: $partNumber, quantity: $quantity, price: $price, addedBy: $addedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PartUsedModelCopyWith<$Res>  {
  factory $PartUsedModelCopyWith(PartUsedModel value, $Res Function(PartUsedModel) _then) = _$PartUsedModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'service_job') int serviceJob, int part,@JsonKey(name: 'part_name') String? partName,@JsonKey(name: 'part_number') String? partNumber, String quantity, String? price,@JsonKey(name: 'added_by') int? addedBy,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$PartUsedModelCopyWithImpl<$Res>
    implements $PartUsedModelCopyWith<$Res> {
  _$PartUsedModelCopyWithImpl(this._self, this._then);

  final PartUsedModel _self;
  final $Res Function(PartUsedModel) _then;

/// Create a copy of PartUsedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? serviceJob = null,Object? part = null,Object? partName = freezed,Object? partNumber = freezed,Object? quantity = null,Object? price = freezed,Object? addedBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,part: null == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as int,partName: freezed == partName ? _self.partName : partName // ignore: cast_nullable_to_non_nullable
as String?,partNumber: freezed == partNumber ? _self.partNumber : partNumber // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,addedBy: freezed == addedBy ? _self.addedBy : addedBy // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PartUsedModel].
extension PartUsedModelPatterns on PartUsedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartUsedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartUsedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartUsedModel value)  $default,){
final _that = this;
switch (_that) {
case _PartUsedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartUsedModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartUsedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'service_job')  int serviceJob,  int part, @JsonKey(name: 'part_name')  String? partName, @JsonKey(name: 'part_number')  String? partNumber,  String quantity,  String? price, @JsonKey(name: 'added_by')  int? addedBy, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartUsedModel() when $default != null:
return $default(_that.id,_that.serviceJob,_that.part,_that.partName,_that.partNumber,_that.quantity,_that.price,_that.addedBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'service_job')  int serviceJob,  int part, @JsonKey(name: 'part_name')  String? partName, @JsonKey(name: 'part_number')  String? partNumber,  String quantity,  String? price, @JsonKey(name: 'added_by')  int? addedBy, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PartUsedModel():
return $default(_that.id,_that.serviceJob,_that.part,_that.partName,_that.partNumber,_that.quantity,_that.price,_that.addedBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'service_job')  int serviceJob,  int part, @JsonKey(name: 'part_name')  String? partName, @JsonKey(name: 'part_number')  String? partNumber,  String quantity,  String? price, @JsonKey(name: 'added_by')  int? addedBy, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PartUsedModel() when $default != null:
return $default(_that.id,_that.serviceJob,_that.part,_that.partName,_that.partNumber,_that.quantity,_that.price,_that.addedBy,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartUsedModel implements PartUsedModel {
  const _PartUsedModel({required this.id, @JsonKey(name: 'service_job') required this.serviceJob, required this.part, @JsonKey(name: 'part_name') this.partName, @JsonKey(name: 'part_number') this.partNumber, required this.quantity, this.price, @JsonKey(name: 'added_by') this.addedBy, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _PartUsedModel.fromJson(Map<String, dynamic> json) => _$PartUsedModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'service_job') final  int serviceJob;
@override final  int part;
@override@JsonKey(name: 'part_name') final  String? partName;
@override@JsonKey(name: 'part_number') final  String? partNumber;
@override final  String quantity;
@override final  String? price;
@override@JsonKey(name: 'added_by') final  int? addedBy;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of PartUsedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartUsedModelCopyWith<_PartUsedModel> get copyWith => __$PartUsedModelCopyWithImpl<_PartUsedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartUsedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartUsedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob)&&(identical(other.part, part) || other.part == part)&&(identical(other.partName, partName) || other.partName == partName)&&(identical(other.partNumber, partNumber) || other.partNumber == partNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.addedBy, addedBy) || other.addedBy == addedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceJob,part,partName,partNumber,quantity,price,addedBy,createdAt,updatedAt);

@override
String toString() {
  return 'PartUsedModel(id: $id, serviceJob: $serviceJob, part: $part, partName: $partName, partNumber: $partNumber, quantity: $quantity, price: $price, addedBy: $addedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PartUsedModelCopyWith<$Res> implements $PartUsedModelCopyWith<$Res> {
  factory _$PartUsedModelCopyWith(_PartUsedModel value, $Res Function(_PartUsedModel) _then) = __$PartUsedModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'service_job') int serviceJob, int part,@JsonKey(name: 'part_name') String? partName,@JsonKey(name: 'part_number') String? partNumber, String quantity, String? price,@JsonKey(name: 'added_by') int? addedBy,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$PartUsedModelCopyWithImpl<$Res>
    implements _$PartUsedModelCopyWith<$Res> {
  __$PartUsedModelCopyWithImpl(this._self, this._then);

  final _PartUsedModel _self;
  final $Res Function(_PartUsedModel) _then;

/// Create a copy of PartUsedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serviceJob = null,Object? part = null,Object? partName = freezed,Object? partNumber = freezed,Object? quantity = null,Object? price = freezed,Object? addedBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_PartUsedModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,part: null == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as int,partName: freezed == partName ? _self.partName : partName // ignore: cast_nullable_to_non_nullable
as String?,partNumber: freezed == partNumber ? _self.partNumber : partNumber // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,addedBy: freezed == addedBy ? _self.addedBy : addedBy // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PartUsedCreateRequest {

@JsonKey(name: 'service_job') int get serviceJob; int get part; String get quantity;
/// Create a copy of PartUsedCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartUsedCreateRequestCopyWith<PartUsedCreateRequest> get copyWith => _$PartUsedCreateRequestCopyWithImpl<PartUsedCreateRequest>(this as PartUsedCreateRequest, _$identity);

  /// Serializes this PartUsedCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartUsedCreateRequest&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob)&&(identical(other.part, part) || other.part == part)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceJob,part,quantity);

@override
String toString() {
  return 'PartUsedCreateRequest(serviceJob: $serviceJob, part: $part, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $PartUsedCreateRequestCopyWith<$Res>  {
  factory $PartUsedCreateRequestCopyWith(PartUsedCreateRequest value, $Res Function(PartUsedCreateRequest) _then) = _$PartUsedCreateRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'service_job') int serviceJob, int part, String quantity
});




}
/// @nodoc
class _$PartUsedCreateRequestCopyWithImpl<$Res>
    implements $PartUsedCreateRequestCopyWith<$Res> {
  _$PartUsedCreateRequestCopyWithImpl(this._self, this._then);

  final PartUsedCreateRequest _self;
  final $Res Function(PartUsedCreateRequest) _then;

/// Create a copy of PartUsedCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceJob = null,Object? part = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,part: null == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PartUsedCreateRequest].
extension PartUsedCreateRequestPatterns on PartUsedCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartUsedCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartUsedCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartUsedCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _PartUsedCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartUsedCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PartUsedCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'service_job')  int serviceJob,  int part,  String quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartUsedCreateRequest() when $default != null:
return $default(_that.serviceJob,_that.part,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'service_job')  int serviceJob,  int part,  String quantity)  $default,) {final _that = this;
switch (_that) {
case _PartUsedCreateRequest():
return $default(_that.serviceJob,_that.part,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'service_job')  int serviceJob,  int part,  String quantity)?  $default,) {final _that = this;
switch (_that) {
case _PartUsedCreateRequest() when $default != null:
return $default(_that.serviceJob,_that.part,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartUsedCreateRequest implements PartUsedCreateRequest {
  const _PartUsedCreateRequest({@JsonKey(name: 'service_job') required this.serviceJob, required this.part, required this.quantity});
  factory _PartUsedCreateRequest.fromJson(Map<String, dynamic> json) => _$PartUsedCreateRequestFromJson(json);

@override@JsonKey(name: 'service_job') final  int serviceJob;
@override final  int part;
@override final  String quantity;

/// Create a copy of PartUsedCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartUsedCreateRequestCopyWith<_PartUsedCreateRequest> get copyWith => __$PartUsedCreateRequestCopyWithImpl<_PartUsedCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartUsedCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartUsedCreateRequest&&(identical(other.serviceJob, serviceJob) || other.serviceJob == serviceJob)&&(identical(other.part, part) || other.part == part)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceJob,part,quantity);

@override
String toString() {
  return 'PartUsedCreateRequest(serviceJob: $serviceJob, part: $part, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$PartUsedCreateRequestCopyWith<$Res> implements $PartUsedCreateRequestCopyWith<$Res> {
  factory _$PartUsedCreateRequestCopyWith(_PartUsedCreateRequest value, $Res Function(_PartUsedCreateRequest) _then) = __$PartUsedCreateRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'service_job') int serviceJob, int part, String quantity
});




}
/// @nodoc
class __$PartUsedCreateRequestCopyWithImpl<$Res>
    implements _$PartUsedCreateRequestCopyWith<$Res> {
  __$PartUsedCreateRequestCopyWithImpl(this._self, this._then);

  final _PartUsedCreateRequest _self;
  final $Res Function(_PartUsedCreateRequest) _then;

/// Create a copy of PartUsedCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceJob = null,Object? part = null,Object? quantity = null,}) {
  return _then(_PartUsedCreateRequest(
serviceJob: null == serviceJob ? _self.serviceJob : serviceJob // ignore: cast_nullable_to_non_nullable
as int,part: null == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PaginatedPartUsedList {

 int get count; String? get next; String? get previous; List<PartUsedModel> get results;
/// Create a copy of PaginatedPartUsedList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedPartUsedListCopyWith<PaginatedPartUsedList> get copyWith => _$PaginatedPartUsedListCopyWithImpl<PaginatedPartUsedList>(this as PaginatedPartUsedList, _$identity);

  /// Serializes this PaginatedPartUsedList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedPartUsedList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PaginatedPartUsedList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedPartUsedListCopyWith<$Res>  {
  factory $PaginatedPartUsedListCopyWith(PaginatedPartUsedList value, $Res Function(PaginatedPartUsedList) _then) = _$PaginatedPartUsedListCopyWithImpl;
@useResult
$Res call({
 int count, String? next, String? previous, List<PartUsedModel> results
});




}
/// @nodoc
class _$PaginatedPartUsedListCopyWithImpl<$Res>
    implements $PaginatedPartUsedListCopyWith<$Res> {
  _$PaginatedPartUsedListCopyWithImpl(this._self, this._then);

  final PaginatedPartUsedList _self;
  final $Res Function(PaginatedPartUsedList) _then;

/// Create a copy of PaginatedPartUsedList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<PartUsedModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedPartUsedList].
extension PaginatedPartUsedListPatterns on PaginatedPartUsedList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedPartUsedList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedPartUsedList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedPartUsedList value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedPartUsedList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedPartUsedList value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedPartUsedList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<PartUsedModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedPartUsedList() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<PartUsedModel> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedPartUsedList():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String? next,  String? previous,  List<PartUsedModel> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedPartUsedList() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedPartUsedList implements PaginatedPartUsedList {
  const _PaginatedPartUsedList({required this.count, this.next, this.previous, required final  List<PartUsedModel> results}): _results = results;
  factory _PaginatedPartUsedList.fromJson(Map<String, dynamic> json) => _$PaginatedPartUsedListFromJson(json);

@override final  int count;
@override final  String? next;
@override final  String? previous;
 final  List<PartUsedModel> _results;
@override List<PartUsedModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedPartUsedList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedPartUsedListCopyWith<_PaginatedPartUsedList> get copyWith => __$PaginatedPartUsedListCopyWithImpl<_PaginatedPartUsedList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedPartUsedListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedPartUsedList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PaginatedPartUsedList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedPartUsedListCopyWith<$Res> implements $PaginatedPartUsedListCopyWith<$Res> {
  factory _$PaginatedPartUsedListCopyWith(_PaginatedPartUsedList value, $Res Function(_PaginatedPartUsedList) _then) = __$PaginatedPartUsedListCopyWithImpl;
@override @useResult
$Res call({
 int count, String? next, String? previous, List<PartUsedModel> results
});




}
/// @nodoc
class __$PaginatedPartUsedListCopyWithImpl<$Res>
    implements _$PaginatedPartUsedListCopyWith<$Res> {
  __$PaginatedPartUsedListCopyWithImpl(this._self, this._then);

  final _PaginatedPartUsedList _self;
  final $Res Function(_PaginatedPartUsedList) _then;

/// Create a copy of PaginatedPartUsedList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PaginatedPartUsedList(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<PartUsedModel>,
  ));
}


}

// dart format on
