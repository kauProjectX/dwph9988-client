//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shelter.g.dart';

/// Shelter
///
/// Properties:
/// * [id] - 쉼터 고유 ID
/// * [facilityName] - 시설명
/// * [address] - 주소
/// * [latitude] - 위도
/// * [longitude] - 경도
/// * [phoneNumber] - 연락처
/// * [operatingTime] - 운영시간
/// * [facilityType] - 시설유형
@BuiltValue()
abstract class Shelter implements Built<Shelter, ShelterBuilder> {
  /// 쉼터 고유 ID
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// 시설명
  @BuiltValueField(wireName: r'facilityName')
  String? get facilityName;

  /// 주소
  @BuiltValueField(wireName: r'address')
  String? get address;

  /// 위도
  @BuiltValueField(wireName: r'latitude')
  double? get latitude;

  /// 경도
  @BuiltValueField(wireName: r'longitude')
  double? get longitude;

  /// 연락처
  @BuiltValueField(wireName: r'phoneNumber')
  String? get phoneNumber;

  /// 운영시간
  @BuiltValueField(wireName: r'operatingTime')
  String? get operatingTime;

  /// 시설유형
  @BuiltValueField(wireName: r'facilityType')
  String? get facilityType;

  Shelter._();

  factory Shelter([void updates(ShelterBuilder b)]) = _$Shelter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShelterBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Shelter> get serializer => _$ShelterSerializer();
}

class _$ShelterSerializer implements PrimitiveSerializer<Shelter> {
  @override
  final Iterable<Type> types = const [Shelter, _$Shelter];

  @override
  final String wireName = r'Shelter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Shelter object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.facilityName != null) {
      yield r'facilityName';
      yield serializers.serialize(
        object.facilityName,
        specifiedType: const FullType(String),
      );
    }
    if (object.address != null) {
      yield r'address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType(String),
      );
    }
    if (object.latitude != null) {
      yield r'latitude';
      yield serializers.serialize(
        object.latitude,
        specifiedType: const FullType(double),
      );
    }
    if (object.longitude != null) {
      yield r'longitude';
      yield serializers.serialize(
        object.longitude,
        specifiedType: const FullType(double),
      );
    }
    if (object.phoneNumber != null) {
      yield r'phoneNumber';
      yield serializers.serialize(
        object.phoneNumber,
        specifiedType: const FullType(String),
      );
    }
    if (object.operatingTime != null) {
      yield r'operatingTime';
      yield serializers.serialize(
        object.operatingTime,
        specifiedType: const FullType(String),
      );
    }
    if (object.facilityType != null) {
      yield r'facilityType';
      yield serializers.serialize(
        object.facilityType,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Shelter object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ShelterBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'facilityName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.facilityName = valueDes;
          break;
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.address = valueDes;
          break;
        case r'latitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.latitude = valueDes;
          break;
        case r'longitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.longitude = valueDes;
          break;
        case r'phoneNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phoneNumber = valueDes;
          break;
        case r'operatingTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.operatingTime = valueDes;
          break;
        case r'facilityType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.facilityType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Shelter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShelterBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

