//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_members_profile_get200_response_result.g.dart';

/// ApiMembersProfileGet200ResponseResult
///
/// Properties:
/// * [id] 
/// * [userName] 
/// * [userType] 
/// * [kakaoId] 
/// * [email] 
@BuiltValue()
abstract class ApiMembersProfileGet200ResponseResult implements Built<ApiMembersProfileGet200ResponseResult, ApiMembersProfileGet200ResponseResultBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'userName')
  String? get userName;

  @BuiltValueField(wireName: r'userType')
  String? get userType;

  @BuiltValueField(wireName: r'kakaoId')
  String? get kakaoId;

  @BuiltValueField(wireName: r'email')
  String? get email;

  ApiMembersProfileGet200ResponseResult._();

  factory ApiMembersProfileGet200ResponseResult([void updates(ApiMembersProfileGet200ResponseResultBuilder b)]) = _$ApiMembersProfileGet200ResponseResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiMembersProfileGet200ResponseResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiMembersProfileGet200ResponseResult> get serializer => _$ApiMembersProfileGet200ResponseResultSerializer();
}

class _$ApiMembersProfileGet200ResponseResultSerializer implements PrimitiveSerializer<ApiMembersProfileGet200ResponseResult> {
  @override
  final Iterable<Type> types = const [ApiMembersProfileGet200ResponseResult, _$ApiMembersProfileGet200ResponseResult];

  @override
  final String wireName = r'ApiMembersProfileGet200ResponseResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiMembersProfileGet200ResponseResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.userName != null) {
      yield r'userName';
      yield serializers.serialize(
        object.userName,
        specifiedType: const FullType(String),
      );
    }
    if (object.userType != null) {
      yield r'userType';
      yield serializers.serialize(
        object.userType,
        specifiedType: const FullType(String),
      );
    }
    if (object.kakaoId != null) {
      yield r'kakaoId';
      yield serializers.serialize(
        object.kakaoId,
        specifiedType: const FullType(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiMembersProfileGet200ResponseResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApiMembersProfileGet200ResponseResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'userName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userName = valueDes;
          break;
        case r'userType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userType = valueDes;
          break;
        case r'kakaoId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.kakaoId = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApiMembersProfileGet200ResponseResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiMembersProfileGet200ResponseResultBuilder();
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

