// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_members_connect_request_post200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiMembersConnectRequestPost200Response
    extends ApiMembersConnectRequestPost200Response {
  @override
  final bool? isSuccess;
  @override
  final String? message;
  @override
  final ApiMembersConnectRequestPost200ResponseResult? result;

  factory _$ApiMembersConnectRequestPost200Response(
          [void Function(ApiMembersConnectRequestPost200ResponseBuilder)?
              updates]) =>
      (new ApiMembersConnectRequestPost200ResponseBuilder()..update(updates))
          ._build();

  _$ApiMembersConnectRequestPost200Response._(
      {this.isSuccess, this.message, this.result})
      : super._();

  @override
  ApiMembersConnectRequestPost200Response rebuild(
          void Function(ApiMembersConnectRequestPost200ResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiMembersConnectRequestPost200ResponseBuilder toBuilder() =>
      new ApiMembersConnectRequestPost200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiMembersConnectRequestPost200Response &&
        isSuccess == other.isSuccess &&
        message == other.message &&
        result == other.result;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'ApiMembersConnectRequestPost200Response')
          ..add('isSuccess', isSuccess)
          ..add('message', message)
          ..add('result', result))
        .toString();
  }
}

class ApiMembersConnectRequestPost200ResponseBuilder
    implements
        Builder<ApiMembersConnectRequestPost200Response,
            ApiMembersConnectRequestPost200ResponseBuilder> {
  _$ApiMembersConnectRequestPost200Response? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ApiMembersConnectRequestPost200ResponseResultBuilder? _result;
  ApiMembersConnectRequestPost200ResponseResultBuilder get result =>
      _$this._result ??=
          new ApiMembersConnectRequestPost200ResponseResultBuilder();
  set result(ApiMembersConnectRequestPost200ResponseResultBuilder? result) =>
      _$this._result = result;

  ApiMembersConnectRequestPost200ResponseBuilder() {
    ApiMembersConnectRequestPost200Response._defaults(this);
  }

  ApiMembersConnectRequestPost200ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _message = $v.message;
      _result = $v.result?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiMembersConnectRequestPost200Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiMembersConnectRequestPost200Response;
  }

  @override
  void update(
      void Function(ApiMembersConnectRequestPost200ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiMembersConnectRequestPost200Response build() => _build();

  _$ApiMembersConnectRequestPost200Response _build() {
    _$ApiMembersConnectRequestPost200Response _$result;
    try {
      _$result = _$v ??
          new _$ApiMembersConnectRequestPost200Response._(
              isSuccess: isSuccess, message: message, result: _result?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'result';
        _result?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiMembersConnectRequestPost200Response',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
