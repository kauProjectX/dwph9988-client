//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_shelters_get400_response.g.dart';

/// ApiSheltersGet400Response
///
/// Properties:
/// * [status] 
/// * [message] 
@BuiltValue()
abstract class ApiSheltersGet400Response implements Built<ApiSheltersGet400Response, ApiSheltersGet400ResponseBuilder> {
  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'message')
  String? get message;

  ApiSheltersGet400Response._();

  factory ApiSheltersGet400Response([void updates(ApiSheltersGet400ResponseBuilder b)]) = _$ApiSheltersGet400Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiSheltersGet400ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiSheltersGet400Response> get serializer => _$ApiSheltersGet400ResponseSerializer();
}

class _$ApiSheltersGet400ResponseSerializer implements PrimitiveSerializer<ApiSheltersGet400Response> {
  @override
  final Iterable<Type> types = const [ApiSheltersGet400Response, _$ApiSheltersGet400Response];

  @override
  final String wireName = r'ApiSheltersGet400Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiSheltersGet400Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(String),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiSheltersGet400Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApiSheltersGet400ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApiSheltersGet400Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiSheltersGet400ResponseBuilder();
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

