// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_verify.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectionVerify extends ConnectionVerify {
  @override
  final String protectId;

  factory _$ConnectionVerify(
          [void Function(ConnectionVerifyBuilder)? updates]) =>
      (new ConnectionVerifyBuilder()..update(updates))._build();

  _$ConnectionVerify._({required this.protectId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        protectId, r'ConnectionVerify', 'protectId');
  }

  @override
  ConnectionVerify rebuild(void Function(ConnectionVerifyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectionVerifyBuilder toBuilder() =>
      new ConnectionVerifyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectionVerify && protectId == other.protectId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, protectId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectionVerify')
          ..add('protectId', protectId))
        .toString();
  }
}

class ConnectionVerifyBuilder
    implements Builder<ConnectionVerify, ConnectionVerifyBuilder> {
  _$ConnectionVerify? _$v;

  String? _protectId;
  String? get protectId => _$this._protectId;
  set protectId(String? protectId) => _$this._protectId = protectId;

  ConnectionVerifyBuilder() {
    ConnectionVerify._defaults(this);
  }

  ConnectionVerifyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _protectId = $v.protectId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectionVerify other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectionVerify;
  }

  @override
  void update(void Function(ConnectionVerifyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectionVerify build() => _build();

  _$ConnectionVerify _build() {
    final _$result = _$v ??
        new _$ConnectionVerify._(
            protectId: BuiltValueNullFieldError.checkNotNull(
                protectId, r'ConnectionVerify', 'protectId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
