# openapi.api.MembersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://dwph9988.shop*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiMembersConnectRequestPost**](MembersApi.md#apimembersconnectrequestpost) | **POST** /api/members/connect/request | 어르신 연동 요청
[**apiMembersConnectVerifyPost**](MembersApi.md#apimembersconnectverifypost) | **POST** /api/members/connect/verify | 어르신 연동 인증
[**apiMembersLogoutPost**](MembersApi.md#apimemberslogoutpost) | **POST** /api/members/logout | 로그아웃
[**apiMembersProfileGet**](MembersApi.md#apimembersprofileget) | **GET** /api/members/profile | 프로필 조회
[**apiMembersSocialKakaoGet**](MembersApi.md#apimemberssocialkakaoget) | **GET** /api/members/social/kakao | 카카오 로그인/회원가입
[**apiMembersWithdrawDelete**](MembersApi.md#apimemberswithdrawdelete) | **DELETE** /api/members/withdraw | 회원 탈퇴


# **apiMembersConnectRequestPost**
> ApiMembersConnectRequestPost200Response apiMembersConnectRequestPost(connectionRequest)

어르신 연동 요청

어르신의 전화번호로 인증번호를 발송합니다. * SMS 또는 카카오톡으로 발송 가능 * 인증번호는 30분간 유효 

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMembersApi();
final ConnectionRequest connectionRequest = ; // ConnectionRequest | 

try {
    final response = api.apiMembersConnectRequestPost(connectionRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MembersApi->apiMembersConnectRequestPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connectionRequest** | [**ConnectionRequest**](ConnectionRequest.md)|  | 

### Return type

[**ApiMembersConnectRequestPost200Response**](ApiMembersConnectRequestPost200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMembersConnectVerifyPost**
> apiMembersConnectVerifyPost(connectionVerify)

어르신 연동 인증

발송된 인증번호를 확인하여 연동을 완료합니다. 

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMembersApi();
final ConnectionVerify connectionVerify = ; // ConnectionVerify | 

try {
    api.apiMembersConnectVerifyPost(connectionVerify);
} catch on DioException (e) {
    print('Exception when calling MembersApi->apiMembersConnectVerifyPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connectionVerify** | [**ConnectionVerify**](ConnectionVerify.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMembersLogoutPost**
> apiMembersLogoutPost()

로그아웃

카카오 로그아웃을 수행합니다. 

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMembersApi();

try {
    api.apiMembersLogoutPost();
} catch on DioException (e) {
    print('Exception when calling MembersApi->apiMembersLogoutPost: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMembersProfileGet**
> ApiMembersProfileGet200Response apiMembersProfileGet()

프로필 조회

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMembersApi();

try {
    final response = api.apiMembersProfileGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling MembersApi->apiMembersProfileGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ApiMembersProfileGet200Response**](ApiMembersProfileGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMembersSocialKakaoGet**
> apiMembersSocialKakaoGet()

카카오 로그인/회원가입

# 카카오 로그인 방법  ## 웹 브라우저 사용자 ### 개발 환경 - http://localhost:3000/api/members/social/kakao  ### 운영 환경 - https://dwph9988.shop/api/members/social/kakao  현재 서버: ${process.env.NODE_ENV === 'production' ? '운영' : '개발'} 접속 URL: ${process.env.SERVICE_URL}/api/members/social/kakao 

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMembersApi();

try {
    api.apiMembersSocialKakaoGet();
} catch on DioException (e) {
    print('Exception when calling MembersApi->apiMembersSocialKakaoGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMembersWithdrawDelete**
> apiMembersWithdrawDelete()

회원 탈퇴

회원 탈퇴를 수행합니다. - 카카오 연동 해제 - DB에서 회원 정보 삭제 

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMembersApi();

try {
    api.apiMembersWithdrawDelete();
} catch on DioException (e) {
    print('Exception when calling MembersApi->apiMembersWithdrawDelete: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

