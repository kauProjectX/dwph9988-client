//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connection_verify.g.dart';

/// ConnectionVerify
///
/// Properties:
/// * [protectId] - 연동 요청 ID
@BuiltValue()
abstract class ConnectionVerify implements Built<ConnectionVerify, ConnectionVerifyBuilder> {
  /// 연동 요청 ID
  @BuiltValueField(wireName: r'protectId')
  String get protectId;

  ConnectionVerify._();

  factory ConnectionVerify([void updates(ConnectionVerifyBuilder b)]) = _$ConnectionVerify;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectionVerifyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectionVerify> get serializer => _$ConnectionVerifySerializer();
}

class _$ConnectionVerifySerializer implements PrimitiveSerializer<ConnectionVerify> {
  @override
  final Iterable<Type> types = const [ConnectionVerify, _$ConnectionVerify];

  @override
  final String wireName = r'ConnectionVerify';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectionVerify object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'protectId';
    yield serializers.serialize(
      object.protectId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectionVerify object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConnectionVerifyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'protectId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.protectId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectionVerify deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectionVerifyBuilder();
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

