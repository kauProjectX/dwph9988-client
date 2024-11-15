// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_shelters_get400_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiSheltersGet400Response extends ApiSheltersGet400Response {
  @override
  final String? status;
  @override
  final String? message;

  factory _$ApiSheltersGet400Response(
          [void Function(ApiSheltersGet400ResponseBuilder)? updates]) =>
      (new ApiSheltersGet400ResponseBuilder()..update(updates))._build();

  _$ApiSheltersGet400Response._({this.status, this.message}) : super._();

  @override
  ApiSheltersGet400Response rebuild(
          void Function(ApiSheltersGet400ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiSheltersGet400ResponseBuilder toBuilder() =>
      new ApiSheltersGet400ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiSheltersGet400Response &&
        status == other.status &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiSheltersGet400Response')
          ..add('status', status)
          ..add('message', message))
        .toString();
  }
}

class ApiSheltersGet400ResponseBuilder
    implements
        Builder<ApiSheltersGet400Response, ApiSheltersGet400ResponseBuilder> {
  _$ApiSheltersGet400Response? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ApiSheltersGet400ResponseBuilder() {
    ApiSheltersGet400Response._defaults(this);
  }

  ApiSheltersGet400ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiSheltersGet400Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiSheltersGet400Response;
  }

  @override
  void update(void Function(ApiSheltersGet400ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiSheltersGet400Response build() => _build();

  _$ApiSheltersGet400Response _build() {
    final _$result = _$v ??
        new _$ApiSheltersGet400Response._(status: status, message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
