// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_members_profile_get200_response_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiMembersProfileGet200ResponseResult
    extends ApiMembersProfileGet200ResponseResult {
  @override
  final int? id;
  @override
  final String? userName;
  @override
  final String? userType;
  @override
  final String? kakaoId;
  @override
  final String? email;

  factory _$ApiMembersProfileGet200ResponseResult(
          [void Function(ApiMembersProfileGet200ResponseResultBuilder)?
              updates]) =>
      (new ApiMembersProfileGet200ResponseResultBuilder()..update(updates))
          ._build();

  _$ApiMembersProfileGet200ResponseResult._(
      {this.id, this.userName, this.userType, this.kakaoId, this.email})
      : super._();

  @override
  ApiMembersProfileGet200ResponseResult rebuild(
          void Function(ApiMembersProfileGet200ResponseResultBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiMembersProfileGet200ResponseResultBuilder toBuilder() =>
      new ApiMembersProfileGet200ResponseResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiMembersProfileGet200ResponseResult &&
        id == other.id &&
        userName == other.userName &&
        userType == other.userType &&
        kakaoId == other.kakaoId &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, userType.hashCode);
    _$hash = $jc(_$hash, kakaoId.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'ApiMembersProfileGet200ResponseResult')
          ..add('id', id)
          ..add('userName', userName)
          ..add('userType', userType)
          ..add('kakaoId', kakaoId)
          ..add('email', email))
        .toString();
  }
}

class ApiMembersProfileGet200ResponseResultBuilder
    implements
        Builder<ApiMembersProfileGet200ResponseResult,
            ApiMembersProfileGet200ResponseResultBuilder> {
  _$ApiMembersProfileGet200ResponseResult? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _userType;
  String? get userType => _$this._userType;
  set userType(String? userType) => _$this._userType = userType;

  String? _kakaoId;
  String? get kakaoId => _$this._kakaoId;
  set kakaoId(String? kakaoId) => _$this._kakaoId = kakaoId;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  ApiMembersProfileGet200ResponseResultBuilder() {
    ApiMembersProfileGet200ResponseResult._defaults(this);
  }

  ApiMembersProfileGet200ResponseResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userName = $v.userName;
      _userType = $v.userType;
      _kakaoId = $v.kakaoId;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiMembersProfileGet200ResponseResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiMembersProfileGet200ResponseResult;
  }

  @override
  void update(
      void Function(ApiMembersProfileGet200ResponseResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiMembersProfileGet200ResponseResult build() => _build();

  _$ApiMembersProfileGet200ResponseResult _build() {
    final _$result = _$v ??
        new _$ApiMembersProfileGet200ResponseResult._(
            id: id,
            userName: userName,
            userType: userType,
            kakaoId: kakaoId,
            email: email);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
