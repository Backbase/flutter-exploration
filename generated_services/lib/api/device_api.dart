//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of generated_services;


class DeviceApi {
  DeviceApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// device
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] realm (required):
  ///   Application realm
  ///
  /// * [String] deviceId (required):
  ///   The device Id fetched from the server.
  ///
  /// * [String] xRegistrationToken (required):
  ///   The device Id fetched from the server.
  ///
  /// * [SetPassCodeRequest] setPassCodeRequest (required):
  Future<Response> setPassCodeWithHttpInfo(String realm, String deviceId, String xRegistrationToken, SetPassCodeRequest setPassCodeRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/realms/{realm}/fido-uaf/users/devices/{deviceId}/credentials/passcode_primary'
      .replaceAll('{realm}', realm)
      .replaceAll('{deviceId}', deviceId);

    // ignore: prefer_final_locals
    Object? postBody = setPassCodeRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'X-Registration-Token'] = parameterToString(xRegistrationToken);

    const contentTypes = <String>['application/json; charset=UTF-8'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// device
  ///
  /// Parameters:
  ///
  /// * [String] realm (required):
  ///   Application realm
  ///
  /// * [String] deviceId (required):
  ///   The device Id fetched from the server.
  ///
  /// * [String] xRegistrationToken (required):
  ///   The device Id fetched from the server.
  ///
  /// * [SetPassCodeRequest] setPassCodeRequest (required):
  Future<void> setPassCode(String realm, String deviceId, String xRegistrationToken, SetPassCodeRequest setPassCodeRequest,) async {
    final response = await setPassCodeWithHttpInfo(realm, deviceId, xRegistrationToken, setPassCodeRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
