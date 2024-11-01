//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of generated_services;


class TokenApi {
  TokenApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// token apis
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] realm (required):
  ///   Application realm
  ///
  /// * [String] username (required):
  ///
  /// * [String] password (required):
  ///
  /// * [String] grantType (required):
  ///
  /// * [String] clientId (required):
  ///
  /// * [String] deviceKey:
  ///
  /// * [String] deviceKeyAlgorithm:
  ///
  /// * [String] deviceSignature:
  ///
  /// * [String] deviceSignatureAlgorithm:
  ///
  /// * [String] deviceId:
  ///
  /// * [String] nonce:
  ///
  /// * [String] acrValues:
  Future<Response> tokenWithHttpInfo(String realm, String username, String password, String grantType, String clientId, { String? deviceKey, String? deviceKeyAlgorithm, String? deviceSignature, String? deviceSignatureAlgorithm, String? deviceId, String? nonce, String? acrValues, }) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/realms/{realm}/protocol/openid-connect/token'
      .replaceAll('{realm}', realm);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/x-www-form-urlencoded'];

    if (username != null) {
      formParams[r'username'] = parameterToString(username);
    }
    if (password != null) {
      formParams[r'password'] = parameterToString(password);
    }
    if (grantType != null) {
      formParams[r'grant_type'] = parameterToString(grantType);
    }
    if (clientId != null) {
      formParams[r'client_id'] = parameterToString(clientId);
    }
    if (deviceKey != null) {
      formParams[r'device_key'] = parameterToString(deviceKey);
    }
    if (deviceKeyAlgorithm != null) {
      formParams[r'device_key_algorithm'] = parameterToString(deviceKeyAlgorithm);
    }
    if (deviceSignature != null) {
      formParams[r'device_signature'] = parameterToString(deviceSignature);
    }
    if (deviceSignatureAlgorithm != null) {
      formParams[r'device_signature_algorithm'] = parameterToString(deviceSignatureAlgorithm);
    }
    if (deviceId != null) {
      formParams[r'device_id'] = parameterToString(deviceId);
    }
    if (nonce != null) {
      formParams[r'nonce'] = parameterToString(nonce);
    }
    if (acrValues != null) {
      formParams[r'acr_values'] = parameterToString(acrValues);
    }

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

  /// token apis
  ///
  /// Parameters:
  ///
  /// * [String] realm (required):
  ///   Application realm
  ///
  /// * [String] username (required):
  ///
  /// * [String] password (required):
  ///
  /// * [String] grantType (required):
  ///
  /// * [String] clientId (required):
  ///
  /// * [String] deviceKey:
  ///
  /// * [String] deviceKeyAlgorithm:
  ///
  /// * [String] deviceSignature:
  ///
  /// * [String] deviceSignatureAlgorithm:
  ///
  /// * [String] deviceId:
  ///
  /// * [String] nonce:
  ///
  /// * [String] acrValues:
  Future<TokenDTO?> token(String realm, String username, String password, String grantType, String clientId, { String? deviceKey, String? deviceKeyAlgorithm, String? deviceSignature, String? deviceSignatureAlgorithm, String? deviceId, String? nonce, String? acrValues, }) async {
    final response = await tokenWithHttpInfo(realm, username, password, grantType, clientId,  deviceKey: deviceKey, deviceKeyAlgorithm: deviceKeyAlgorithm, deviceSignature: deviceSignature, deviceSignatureAlgorithm: deviceSignatureAlgorithm, deviceId: deviceId, nonce: nonce, acrValues: acrValues, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TokenDTO',) as TokenDTO;
    
    }
    return null;
  }
}
