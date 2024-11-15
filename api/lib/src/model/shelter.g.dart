// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelter.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Shelter extends Shelter {
  @override
  final String? id;
  @override
  final String? facilityName;
  @override
  final String? address;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? phoneNumber;
  @override
  final String? operatingTime;
  @override
  final String? facilityType;

  factory _$Shelter([void Function(ShelterBuilder)? updates]) =>
      (new ShelterBuilder()..update(updates))._build();

  _$Shelter._(
      {this.id,
      this.facilityName,
      this.address,
      this.latitude,
      this.longitude,
      this.phoneNumber,
      this.operatingTime,
      this.facilityType})
      : super._();

  @override
  Shelter rebuild(void Function(ShelterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShelterBuilder toBuilder() => new ShelterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Shelter &&
        id == other.id &&
        facilityName == other.facilityName &&
        address == other.address &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        phoneNumber == other.phoneNumber &&
        operatingTime == other.operatingTime &&
        facilityType == other.facilityType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, facilityName.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, operatingTime.hashCode);
    _$hash = $jc(_$hash, facilityType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Shelter')
          ..add('id', id)
          ..add('facilityName', facilityName)
          ..add('address', address)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('phoneNumber', phoneNumber)
          ..add('operatingTime', operatingTime)
          ..add('facilityType', facilityType))
        .toString();
  }
}

class ShelterBuilder implements Builder<Shelter, ShelterBuilder> {
  _$Shelter? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _facilityName;
  String? get facilityName => _$this._facilityName;
  set facilityName(String? facilityName) => _$this._facilityName = facilityName;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _operatingTime;
  String? get operatingTime => _$this._operatingTime;
  set operatingTime(String? operatingTime) =>
      _$this._operatingTime = operatingTime;

  String? _facilityType;
  String? get facilityType => _$this._facilityType;
  set facilityType(String? facilityType) => _$this._facilityType = facilityType;

  ShelterBuilder() {
    Shelter._defaults(this);
  }

  ShelterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _facilityName = $v.facilityName;
      _address = $v.address;
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _phoneNumber = $v.phoneNumber;
      _operatingTime = $v.operatingTime;
      _facilityType = $v.facilityType;
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
        new _$Shelter._(
            id: id,
            facilityName: facilityName,
            address: address,
            latitude: latitude,
            longitude: longitude,
            phoneNumber: phoneNumber,
            operatingTime: operatingTime,
            facilityType: facilityType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
