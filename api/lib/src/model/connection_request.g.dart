// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectionRequest extends ConnectionRequest {
  @override
  final String phoneNumber;

  factory _$ConnectionRequest(
          [void Function(ConnectionRequestBuilder)? updates]) =>
      (new ConnectionRequestBuilder()..update(updates))._build();

  _$ConnectionRequest._({required this.phoneNumber}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, r'ConnectionRequest', 'phoneNumber');
  }

  @override
  ConnectionRequest rebuild(void Function(ConnectionRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectionRequestBuilder toBuilder() =>
      new ConnectionRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectionRequest && phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectionRequest')
          ..add('phoneNumber', phoneNumber))
        .toString();
  }
}

class ConnectionRequestBuilder
    implements Builder<ConnectionRequest, ConnectionRequestBuilder> {
  _$ConnectionRequest? _$v;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  ConnectionRequestBuilder() {
    ConnectionRequest._defaults(this);
  }

  ConnectionRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phoneNumber = $v.phoneNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectionRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectionRequest;
  }

  @override
  void update(void Function(ConnectionRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectionRequest build() => _build();

  _$ConnectionRequest _build() {
    final _$result = _$v ??
        new _$ConnectionRequest._(
            phoneNumber: BuiltValueNullFieldError.checkNotNull(
                phoneNumber, r'ConnectionRequest', 'phoneNumber'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
