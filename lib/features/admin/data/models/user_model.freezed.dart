// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 int get id; String get email; String get name; String get phone; UserRole get role; String? get specialization; UserStatus? get status; bool? get isActive;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.status, status) || other.status == status)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,phone,role,specialization,status,isActive);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, name: $name, phone: $phone, role: $role, specialization: $specialization, status: $status, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 int id, String email, String name, String phone, UserRole role, String? specialization, UserStatus? status, bool? isActive
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? name = null,Object? phone = null,Object? role = null,Object? specialization = freezed,Object? status = freezed,Object? isActive = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserStatus?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String email,  String name,  String phone,  UserRole role,  String? specialization,  UserStatus? status,  bool? isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.phone,_that.role,_that.specialization,_that.status,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String email,  String name,  String phone,  UserRole role,  String? specialization,  UserStatus? status,  bool? isActive)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.email,_that.name,_that.phone,_that.role,_that.specialization,_that.status,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String email,  String name,  String phone,  UserRole role,  String? specialization,  UserStatus? status,  bool? isActive)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.phone,_that.role,_that.specialization,_that.status,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({required this.id, required this.email, required this.name, required this.phone, required this.role, this.specialization, this.status = UserStatus.active, this.isActive = true});
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  int id;
@override final  String email;
@override final  String name;
@override final  String phone;
@override final  UserRole role;
@override final  String? specialization;
@override@JsonKey() final  UserStatus? status;
@override@JsonKey() final  bool? isActive;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.status, status) || other.status == status)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,phone,role,specialization,status,isActive);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, name: $name, phone: $phone, role: $role, specialization: $specialization, status: $status, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String email, String name, String phone, UserRole role, String? specialization, UserStatus? status, bool? isActive
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? name = null,Object? phone = null,Object? role = null,Object? specialization = freezed,Object? status = freezed,Object? isActive = freezed,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserStatus?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$UserCreateRequest {

 String get email; String get name; String get phone; UserRole get role; String? get specialization; String get status; String get password;
/// Create a copy of UserCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCreateRequestCopyWith<UserCreateRequest> get copyWith => _$UserCreateRequestCopyWithImpl<UserCreateRequest>(this as UserCreateRequest, _$identity);

  /// Serializes this UserCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreateRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.status, status) || other.status == status)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,name,phone,role,specialization,status,password);

@override
String toString() {
  return 'UserCreateRequest(email: $email, name: $name, phone: $phone, role: $role, specialization: $specialization, status: $status, password: $password)';
}


}

/// @nodoc
abstract mixin class $UserCreateRequestCopyWith<$Res>  {
  factory $UserCreateRequestCopyWith(UserCreateRequest value, $Res Function(UserCreateRequest) _then) = _$UserCreateRequestCopyWithImpl;
@useResult
$Res call({
 String email, String name, String phone, UserRole role, String? specialization, String status, String password
});




}
/// @nodoc
class _$UserCreateRequestCopyWithImpl<$Res>
    implements $UserCreateRequestCopyWith<$Res> {
  _$UserCreateRequestCopyWithImpl(this._self, this._then);

  final UserCreateRequest _self;
  final $Res Function(UserCreateRequest) _then;

/// Create a copy of UserCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? name = null,Object? phone = null,Object? role = null,Object? specialization = freezed,Object? status = null,Object? password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserCreateRequest].
extension UserCreateRequestPatterns on UserCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _UserCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UserCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String name,  String phone,  UserRole role,  String? specialization,  String status,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserCreateRequest() when $default != null:
return $default(_that.email,_that.name,_that.phone,_that.role,_that.specialization,_that.status,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String name,  String phone,  UserRole role,  String? specialization,  String status,  String password)  $default,) {final _that = this;
switch (_that) {
case _UserCreateRequest():
return $default(_that.email,_that.name,_that.phone,_that.role,_that.specialization,_that.status,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String name,  String phone,  UserRole role,  String? specialization,  String status,  String password)?  $default,) {final _that = this;
switch (_that) {
case _UserCreateRequest() when $default != null:
return $default(_that.email,_that.name,_that.phone,_that.role,_that.specialization,_that.status,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserCreateRequest implements UserCreateRequest {
  const _UserCreateRequest({required this.email, required this.name, required this.phone, required this.role, this.specialization, this.status = 'active', required this.password});
  factory _UserCreateRequest.fromJson(Map<String, dynamic> json) => _$UserCreateRequestFromJson(json);

@override final  String email;
@override final  String name;
@override final  String phone;
@override final  UserRole role;
@override final  String? specialization;
@override@JsonKey() final  String status;
@override final  String password;

/// Create a copy of UserCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCreateRequestCopyWith<_UserCreateRequest> get copyWith => __$UserCreateRequestCopyWithImpl<_UserCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCreateRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.status, status) || other.status == status)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,name,phone,role,specialization,status,password);

@override
String toString() {
  return 'UserCreateRequest(email: $email, name: $name, phone: $phone, role: $role, specialization: $specialization, status: $status, password: $password)';
}


}

/// @nodoc
abstract mixin class _$UserCreateRequestCopyWith<$Res> implements $UserCreateRequestCopyWith<$Res> {
  factory _$UserCreateRequestCopyWith(_UserCreateRequest value, $Res Function(_UserCreateRequest) _then) = __$UserCreateRequestCopyWithImpl;
@override @useResult
$Res call({
 String email, String name, String phone, UserRole role, String? specialization, String status, String password
});




}
/// @nodoc
class __$UserCreateRequestCopyWithImpl<$Res>
    implements _$UserCreateRequestCopyWith<$Res> {
  __$UserCreateRequestCopyWithImpl(this._self, this._then);

  final _UserCreateRequest _self;
  final $Res Function(_UserCreateRequest) _then;

/// Create a copy of UserCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? name = null,Object? phone = null,Object? role = null,Object? specialization = freezed,Object? status = null,Object? password = null,}) {
  return _then(_UserCreateRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PaginatedUserList {

 int get count; String? get next; String? get previous; List<UserModel> get results;
/// Create a copy of PaginatedUserList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedUserListCopyWith<PaginatedUserList> get copyWith => _$PaginatedUserListCopyWithImpl<PaginatedUserList>(this as PaginatedUserList, _$identity);

  /// Serializes this PaginatedUserList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedUserList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PaginatedUserList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedUserListCopyWith<$Res>  {
  factory $PaginatedUserListCopyWith(PaginatedUserList value, $Res Function(PaginatedUserList) _then) = _$PaginatedUserListCopyWithImpl;
@useResult
$Res call({
 int count, String? next, String? previous, List<UserModel> results
});




}
/// @nodoc
class _$PaginatedUserListCopyWithImpl<$Res>
    implements $PaginatedUserListCopyWith<$Res> {
  _$PaginatedUserListCopyWithImpl(this._self, this._then);

  final PaginatedUserList _self;
  final $Res Function(PaginatedUserList) _then;

/// Create a copy of PaginatedUserList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<UserModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedUserList].
extension PaginatedUserListPatterns on PaginatedUserList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedUserList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedUserList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedUserList value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedUserList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedUserList value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedUserList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<UserModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedUserList() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<UserModel> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedUserList():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String? next,  String? previous,  List<UserModel> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedUserList() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedUserList implements PaginatedUserList {
  const _PaginatedUserList({required this.count, this.next, this.previous, required final  List<UserModel> results}): _results = results;
  factory _PaginatedUserList.fromJson(Map<String, dynamic> json) => _$PaginatedUserListFromJson(json);

@override final  int count;
@override final  String? next;
@override final  String? previous;
 final  List<UserModel> _results;
@override List<UserModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedUserList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedUserListCopyWith<_PaginatedUserList> get copyWith => __$PaginatedUserListCopyWithImpl<_PaginatedUserList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedUserListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedUserList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PaginatedUserList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedUserListCopyWith<$Res> implements $PaginatedUserListCopyWith<$Res> {
  factory _$PaginatedUserListCopyWith(_PaginatedUserList value, $Res Function(_PaginatedUserList) _then) = __$PaginatedUserListCopyWithImpl;
@override @useResult
$Res call({
 int count, String? next, String? previous, List<UserModel> results
});




}
/// @nodoc
class __$PaginatedUserListCopyWithImpl<$Res>
    implements _$PaginatedUserListCopyWith<$Res> {
  __$PaginatedUserListCopyWithImpl(this._self, this._then);

  final _PaginatedUserList _self;
  final $Res Function(_PaginatedUserList) _then;

/// Create a copy of PaginatedUserList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PaginatedUserList(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<UserModel>,
  ));
}


}

// dart format on
