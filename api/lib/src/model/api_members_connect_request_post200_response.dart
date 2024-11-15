//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/api_members_connect_request_post200_response_result.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_members_connect_request_post200_response.g.dart';

/// ApiMembersConnectRequestPost200Response
///
/// Properties:
/// * [isSuccess] 
/// * [message] 
/// * [result] 
@BuiltValue()
abstract class ApiMembersConnectRequestPost200Response implements Built<ApiMembersConnectRequestPost200Response, ApiMembersConnectRequestPost200ResponseBuilder> {
  @BuiltValueField(wireName: r'isSuccess')
  bool? get isSuccess;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'result')
  ApiMembersConnectRequestPost200ResponseResult? get result;

  ApiMembersConnectRequestPost200Response._();

  factory ApiMembersConnectRequestPost200Response([void updates(ApiMembersConnectRequestPost200ResponseBuilder b)]) = _$ApiMembersConnectRequestPost200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiMembersConnectRequestPost200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiMembersConnectRequestPost200Response> get serializer => _$ApiMembersConnectRequestPost200ResponseSerializer();
}

class _$ApiMembersConnectRequestPost200ResponseSerializer implements PrimitiveSerializer<ApiMembersConnectRequestPost200Response> {
  @override
  final Iterable<Type> types = const [ApiMembersConnectRequestPost200Response, _$ApiMembersConnectRequestPost200Response];

  @override
  final String wireName = r'ApiMembersConnectRequestPost200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiMembersConnectRequestPost200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.isSuccess != null) {
      yield r'isSuccess';
      yield serializers.serialize(
        object.isSuccess,
        specifiedType: const FullType(bool),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
    if (object.result != null) {
      yield r'result';
      yield serializers.serialize(
        object.result,
        specifiedType: const FullType(ApiMembersConnectRequestPost200ResponseResult),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiMembersConnectRequestPost200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApiMembersConnectRequestPost200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'isSuccess':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isSuccess = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'result':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ApiMembersConnectRequestPost200ResponseResult),
          ) as ApiMembersConnectRequestPost200ResponseResult;
          result.result.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApiMembersConnectRequestPost200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiMembersConnectRequestPost200ResponseBuilder();
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

