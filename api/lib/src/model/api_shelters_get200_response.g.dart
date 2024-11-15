// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_shelters_get200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiSheltersGet200Response extends ApiSheltersGet200Response {
  @override
  final String? status;
  @override
  final BuiltList<Shelter>? data;

  factory _$ApiSheltersGet200Response(
          [void Function(ApiSheltersGet200ResponseBuilder)? updates]) =>
      (new ApiSheltersGet200ResponseBuilder()..update(updates))._build();

  _$ApiSheltersGet200Response._({this.status, this.data}) : super._();

  @override
  ApiSheltersGet200Response rebuild(
          void Function(ApiSheltersGet200ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiSheltersGet200ResponseBuilder toBuilder() =>
      new ApiSheltersGet200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiSheltersGet200Response &&
        status == other.status &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiSheltersGet200Response')
          ..add('status', status)
          ..add('data', data))
        .toString();
  }
}

class ApiSheltersGet200ResponseBuilder
    implements
        Builder<ApiSheltersGet200Response, ApiSheltersGet200ResponseBuilder> {
  _$ApiSheltersGet200Response? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  ListBuilder<Shelter>? _data;
  ListBuilder<Shelter> get data => _$this._data ??= new ListBuilder<Shelter>();
  set data(ListBuilder<Shelter>? data) => _$this._data = data;

  ApiSheltersGet200ResponseBuilder() {
    ApiSheltersGet200Response._defaults(this);
  }

  ApiSheltersGet200ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiSheltersGet200Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiSheltersGet200Response;
  }

  @override
  void update(void Function(ApiSheltersGet200ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiSheltersGet200Response build() => _build();

  _$ApiSheltersGet200Response _build() {
    _$ApiSheltersGet200Response _$result;
    try {
      _$result = _$v ??
          new _$ApiSheltersGet200Response._(
              status: status, data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiSheltersGet200Response', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
