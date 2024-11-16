// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelter.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Shelter extends Shelter {
  @override
  final String? name;
  @override
  final double? latitude;
  @override
  final double? longitude;

  factory _$Shelter([void Function(ShelterBuilder)? updates]) =>
      (new ShelterBuilder()..update(updates))._build();

  _$Shelter._({this.name, this.latitude, this.longitude}) : super._();

  @override
  Shelter rebuild(void Function(ShelterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShelterBuilder toBuilder() => new ShelterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Shelter &&
        name == other.name &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Shelter')
          ..add('name', name)
          ..add('latitude', latitude)
          ..add('longitude', longitude))
        .toString();
  }
}

class ShelterBuilder implements Builder<Shelter, ShelterBuilder> {
  _$Shelter? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  ShelterBuilder() {
    Shelter._defaults(this);
  }

  ShelterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Shelter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Shelter;
  }

  @override
  void update(void Function(ShelterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Shelter build() => _build();

  _$Shelter _build() {
    final _$result = _$v ??
        new _$Shelter._(name: name, latitude: latitude, longitude: longitude);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
