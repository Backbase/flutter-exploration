# generated_services.api.TokenApi

## Load the API package
```dart
import 'package:generated_services/api.dart';
```

All URIs are relative to *https://identity.dev.sdbxaz.azure.backbaseservices.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**token**](TokenApi.md#token) | **POST** /auth/realms/{realm}/protocol/openid-connect/token | token apis


# **token**
> TokenDTO token(realm, username, password, grantType, clientId, deviceKey, deviceKeyAlgorithm, deviceSignature, deviceSignatureAlgorithm, deviceId, nonce, acrValues)

token apis

### Example
```dart
import 'package:generated_services/api.dart';

final api_instance = TokenApi();
final realm = realm_example; // String | Application realm
final username = username_example; // String | 
final password = password_example; // String | 
final grantType = grantType_example; // String | 
final clientId = clientId_example; // String | 
final deviceKey = deviceKey_example; // String | 
final deviceKeyAlgorithm = deviceKeyAlgorithm_example; // String | 
final deviceSignature = deviceSignature_example; // String | 
final deviceSignatureAlgorithm = deviceSignatureAlgorithm_example; // String | 
final deviceId = deviceId_example; // String | 
final nonce = nonce_example; // String | 
final acrValues = acrValues_example; // String | 

try {
    final result = api_instance.token(realm, username, password, grantType, clientId, deviceKey, deviceKeyAlgorithm, deviceSignature, deviceSignatureAlgorithm, deviceId, nonce, acrValues);
    print(result);
} catch (e) {
    print('Exception when calling TokenApi->token: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **realm** | **String**| Application realm | 
 **username** | **String**|  | 
 **password** | **String**|  | 
 **grantType** | **String**|  | 
 **clientId** | **String**|  | 
 **deviceKey** | **String**|  | [optional] 
 **deviceKeyAlgorithm** | **String**|  | [optional] 
 **deviceSignature** | **String**|  | [optional] 
 **deviceSignatureAlgorithm** | **String**|  | [optional] 
 **deviceId** | **String**|  | [optional] 
 **nonce** | **String**|  | [optional] 
 **acrValues** | **String**|  | [optional] 

### Return type

[**TokenDTO**](TokenDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

