//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/shelter.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_shelters_get200_response.g.dart';

/// ApiSheltersGet200Response
///
/// Properties:
/// * [status] 
/// * [data] 
@BuiltValue()
abstract class ApiSheltersGet200Response implements Built<ApiSheltersGet200Response, ApiSheltersGet200ResponseBuilder> {
  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'data')
  BuiltList<Shelter>? get data;

  ApiSheltersGet200Response._();

  factory ApiSheltersGet200Response([void updates(ApiSheltersGet200ResponseBuilder b)]) = _$ApiSheltersGet200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiSheltersGet200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiSheltersGet200Response> get serializer => _$ApiSheltersGet200ResponseSerializer();
}

class _$ApiSheltersGet200ResponseSerializer implements PrimitiveSerializer<ApiSheltersGet200Response> {
  @override
  final Iterable<Type> types = const [ApiSheltersGet200Response, _$ApiSheltersGet200Response];

  @override
  final String wireName = r'ApiSheltersGet200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiSheltersGet200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(String),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, [FullType(Shelter)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiSheltersGet200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApiSheltersGet200ResponseBuilder result,
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
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Shelter)]),
          ) as BuiltList<Shelter>;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApiSheltersGet200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiSheltersGet200ResponseBuilder();
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

