// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_members_connect_request_post200_response_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiMembersConnectRequestPost200ResponseResult
    extends ApiMembersConnectRequestPost200ResponseResult {
  @override
  final String? protectId;
  @override
  final String? expiresIn;

  factory _$ApiMembersConnectRequestPost200ResponseResult(
          [void Function(ApiMembersConnectRequestPost200ResponseResultBuilder)?
              updates]) =>
      (new ApiMembersConnectRequestPost200ResponseResultBuilder()
            ..update(updates))
          ._build();

  _$ApiMembersConnectRequestPost200ResponseResult._(
      {this.protectId, this.expiresIn})
      : super._();

  @override
  ApiMembersConnectRequestPost200ResponseResult rebuild(
          void Function(ApiMembersConnectRequestPost200ResponseResultBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiMembersConnectRequestPost200ResponseResultBuilder toBuilder() =>
      new ApiMembersConnectRequestPost200ResponseResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiMembersConnectRequestPost200ResponseResult &&
        protectId == other.protectId &&
        expiresIn == other.expiresIn;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, protectId.hashCode);
    _$hash = $jc(_$hash, expiresIn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'ApiMembersConnectRequestPost200ResponseResult')
          ..add('protectId', protectId)
          ..add('expiresIn', expiresIn))
        .toString();
  }
}

class ApiMembersConnectRequestPost200ResponseResultBuilder
    implements
        Builder<ApiMembersConnectRequestPost200ResponseResult,
            ApiMembersConnectRequestPost200ResponseResultBuilder> {
  _$ApiMembersConnectRequestPost200ResponseResult? _$v;

  String? _protectId;
  String? get protectId => _$this._protectId;
  set protectId(String? protectId) => _$this._protectId = protectId;

  String? _expiresIn;
  String? get expiresIn => _$this._expiresIn;
  set expiresIn(String? expiresIn) => _$this._expiresIn = expiresIn;

  ApiMembersConnectRequestPost200ResponseResultBuilder() {
    ApiMembersConnectRequestPost200ResponseResult._defaults(this);
  }

  ApiMembersConnectRequestPost200ResponseResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _protectId = $v.protectId;
      _expiresIn = $v.expiresIn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiMembersConnectRequestPost200ResponseResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiMembersConnectRequestPost200ResponseResult;
  }

  @override
  void update(
      void Function(ApiMembersConnectRequestPost200ResponseResultBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiMembersConnectRequestPost200ResponseResult build() => _build();

  _$ApiMembersConnectRequestPost200ResponseResult _build() {
    final _$result = _$v ??
        new _$ApiMembersConnectRequestPost200ResponseResult._(
            protectId: protectId, expiresIn: expiresIn);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
