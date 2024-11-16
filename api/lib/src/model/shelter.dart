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
/// * [name] - 무더위쉼터 이름
/// * [latitude] - 위도
/// * [longitude] - 경도
@BuiltValue()
abstract class Shelter implements Built<Shelter, ShelterBuilder> {
  /// 무더위쉼터 이름
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// 위도
  @BuiltValueField(wireName: r'latitude')
  double? get latitude;

  /// 경도
  @BuiltValueField(wireName: r'longitude')
  double? get longitude;

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
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
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

