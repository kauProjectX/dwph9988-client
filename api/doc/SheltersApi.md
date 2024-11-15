# openapi.api.SheltersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://dwph9988.shop*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiSheltersGet**](SheltersApi.md#apisheltersget) | **GET** /api/shelters | 무더위쉼터 목록 조회


# **apiSheltersGet**
> ApiSheltersGet200Response apiSheltersGet(latitude, longitude, radius)

무더위쉼터 목록 조회

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSheltersApi();
final num latitude = 8.14; // num | 현재 위치 위도
final num longitude = 8.14; // num | 현재 위치 경도
final num radius = 8.14; // num | 검색 반경(km)

try {
    final response = api.apiSheltersGet(latitude, longitude, radius);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SheltersApi->apiSheltersGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **latitude** | **num**| 현재 위치 위도 | [optional] 
 **longitude** | **num**| 현재 위치 경도 | [optional] 
 **radius** | **num**| 검색 반경(km) | [optional] 

### Return type

[**ApiSheltersGet200Response**](ApiSheltersGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

