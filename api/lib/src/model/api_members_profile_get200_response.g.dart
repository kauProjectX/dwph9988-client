// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_members_profile_get200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiMembersProfileGet200Response
    extends ApiMembersProfileGet200Response {
  @override
  final bool? isSuccess;
  @override
  final String? message;
  @override
  final ApiMembersProfileGet200ResponseResult? result;

  factory _$ApiMembersProfileGet200Response(
          [void Function(ApiMembersProfileGet200ResponseBuilder)? updates]) =>
      (new ApiMembersProfileGet200ResponseBuilder()..update(updates))._build();

  _$ApiMembersProfileGet200Response._(
      {this.isSuccess, this.message, this.result})
      : super._();

  @override
  ApiMembersProfileGet200Response rebuild(
          void Function(ApiMembersProfileGet200ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiMembersProfileGet200ResponseBuilder toBuilder() =>
      new ApiMembersProfileGet200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiMembersProfileGet200Response &&
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
    return (newBuiltValueToStringHelper(r'ApiMembersProfileGet200Response')
          ..add('isSuccess', isSuccess)
          ..add('message', message)
          ..add('result', result))
        .toString();
  }
}

class ApiMembersProfileGet200ResponseBuilder
    implements
        Builder<ApiMembersProfileGet200Response,
            ApiMembersProfileGet200ResponseBuilder> {
  _$ApiMembersProfileGet200Response? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ApiMembersProfileGet200ResponseResultBuilder? _result;
  ApiMembersProfileGet200ResponseResultBuilder get result =>
      _$this._result ??= new ApiMembersProfileGet200ResponseResultBuilder();
  set result(ApiMembersProfileGet200ResponseResultBuilder? result) =>
      _$this._result = result;

  ApiMembersProfileGet200ResponseBuilder() {
    ApiMembersProfileGet200Response._defaults(this);
  }

  ApiMembersProfileGet200ResponseBuilder get _$this {
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
  void replace(ApiMembersProfileGet200Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiMembersProfileGet200Response;
  }

  @override
  void update(void Function(ApiMembersProfileGet200ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiMembersProfileGet200Response build() => _build();

  _$ApiMembersProfileGet200Response _build() {
    _$ApiMembersProfileGet200Response _$result;
    try {
      _$result = _$v ??
          new _$ApiMembersProfileGet200Response._(
              isSuccess: isSuccess, message: message, result: _result?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'result';
        _result?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiMembersProfileGet200Response', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
