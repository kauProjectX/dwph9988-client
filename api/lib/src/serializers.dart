//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/api_members_connect_request_post200_response.dart';
import 'package:openapi/src/model/api_members_connect_request_post200_response_result.dart';
import 'package:openapi/src/model/api_members_profile_get200_response.dart';
import 'package:openapi/src/model/api_members_profile_get200_response_result.dart';
import 'package:openapi/src/model/api_shelters_get200_response.dart';
import 'package:openapi/src/model/connection_request.dart';
import 'package:openapi/src/model/connection_verify.dart';
import 'package:openapi/src/model/shelter.dart';

part 'serializers.g.dart';

@SerializersFor([
  ApiMembersConnectRequestPost200Response,
  ApiMembersConnectRequestPost200ResponseResult,
  ApiMembersProfileGet200Response,
  ApiMembersProfileGet200ResponseResult,
  ApiSheltersGet200Response,
  ConnectionRequest,
  ConnectionVerify,
  Shelter,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
