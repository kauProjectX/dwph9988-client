# openapi.api.SheltersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://dwph9988.shop*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiSheltersGet**](SheltersApi.md#apisheltersget) | **GET** /api/shelters | GPS 위치 기준으로 무더위쉼터 조회


# **apiSheltersGet**
> ApiSheltersGet200Response apiSheltersGet(latitude, longitude)

GPS 위치 기준으로 무더위쉼터 조회

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSheltersApi();
final num latitude = 37.5666805; // num | GPS 위도
final num longitude = 126.9784147; // num | GPS 경도

try {
    final response = api.apiSheltersGet(latitude, longitude);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SheltersApi->apiSheltersGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **latitude** | **num**| GPS 위도 | 
 **longitude** | **num**| GPS 경도 | 

### Return type

[**ApiSheltersGet200Response**](ApiSheltersGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

