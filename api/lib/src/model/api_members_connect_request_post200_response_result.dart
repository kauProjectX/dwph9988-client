//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_members_connect_request_post200_response_result.g.dart';

/// ApiMembersConnectRequestPost200ResponseResult
///
/// Properties:
/// * [protectId] 
/// * [expiresIn] 
@BuiltValue()
abstract class ApiMembersConnectRequestPost200ResponseResult implements Built<ApiMembersConnectRequestPost200ResponseResult, ApiMembersConnectRequestPost200ResponseResultBuilder> {
  @BuiltValueField(wireName: r'protectId')
  String? get protectId;

  @BuiltValueField(wireName: r'expiresIn')
  String? get expiresIn;

  ApiMembersConnectRequestPost200ResponseResult._();

  factory ApiMembersConnectRequestPost200ResponseResult([void updates(ApiMembersConnectRequestPost200ResponseResultBuilder b)]) = _$ApiMembersConnectRequestPost200ResponseResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiMembersConnectRequestPost200ResponseResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiMembersConnectRequestPost200ResponseResult> get serializer => _$ApiMembersConnectRequestPost200ResponseResultSerializer();
}

class _$ApiMembersConnectRequestPost200ResponseResultSerializer implements PrimitiveSerializer<ApiMembersConnectRequestPost200ResponseResult> {
  @override
  final Iterable<Type> types = const [ApiMembersConnectRequestPost200ResponseResult, _$ApiMembersConnectRequestPost200ResponseResult];

  @override
  final String wireName = r'ApiMembersConnectRequestPost200ResponseResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiMembersConnectRequestPost200ResponseResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.protectId != null) {
      yield r'protectId';
      yield serializers.serialize(
        object.protectId,
        specifiedType: const FullType(String),
      );
    }
    if (object.expiresIn != null) {
      yield r'expiresIn';
      yield serializers.serialize(
        object.expiresIn,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiMembersConnectRequestPost200ResponseResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApiMembersConnectRequestPost200ResponseResultBuilder result,
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
        case r'expiresIn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.expiresIn = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApiMembersConnectRequestPost200ResponseResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiMembersConnectRequestPost200ResponseResultBuilder();
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

