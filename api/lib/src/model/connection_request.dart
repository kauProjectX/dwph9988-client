//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connection_request.g.dart';

/// ConnectionRequest
///
/// Properties:
/// * [phoneNumber] - 어르신의 전화번호
@BuiltValue()
abstract class ConnectionRequest implements Built<ConnectionRequest, ConnectionRequestBuilder> {
  /// 어르신의 전화번호
  @BuiltValueField(wireName: r'phoneNumber')
  String get phoneNumber;

  ConnectionRequest._();

  factory ConnectionRequest([void updates(ConnectionRequestBuilder b)]) = _$ConnectionRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectionRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectionRequest> get serializer => _$ConnectionRequestSerializer();
}

class _$ConnectionRequestSerializer implements PrimitiveSerializer<ConnectionRequest> {
  @override
  final Iterable<Type> types = const [ConnectionRequest, _$ConnectionRequest];

  @override
  final String wireName = r'ConnectionRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'phoneNumber';
    yield serializers.serialize(
      object.phoneNumber,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConnectionRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'phoneNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phoneNumber = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectionRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectionRequestBuilder();
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

