# generated_services.api.DeviceApi

## Load the API package
```dart
import 'package:generated_services/api.dart';
```

All URIs are relative to *https://identity.dev.sdbxaz.azure.backbaseservices.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**setPassCode**](DeviceApi.md#setpasscode) | **POST** /auth/realms/{realm}/fido-uaf/users/devices/{deviceId}/credentials/passcode_primary | device


# **setPassCode**
> setPassCode(realm, deviceId, xRegistrationToken, setPassCodeRequest)

device

### Example
```dart
import 'package:generated_services/api.dart';

final api_instance = DeviceApi();
final realm = realm_example; // String | Application realm
final deviceId = deviceId_example; // String | The device Id fetched from the server.
final xRegistrationToken = xRegistrationToken_example; // String | The device Id fetched from the server.
final setPassCodeRequest = SetPassCodeRequest(); // SetPassCodeRequest | 

try {
    api_instance.setPassCode(realm, deviceId, xRegistrationToken, setPassCodeRequest);
} catch (e) {
    print('Exception when calling DeviceApi->setPassCode: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **realm** | **String**| Application realm | 
 **deviceId** | **String**| The device Id fetched from the server. | 
 **xRegistrationToken** | **String**| The device Id fetched from the server. | 
 **setPassCodeRequest** | [**SetPassCodeRequest**](SetPassCodeRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=UTF-8
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

