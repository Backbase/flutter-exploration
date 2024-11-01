//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of generated_services;


class WorkspaceApi {
  WorkspaceApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// workspaces apis
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] X_SDBXAZ_API_KEY (required):
  ///   The device Id fetched from the server.
  ///
  /// * [String] authorization (required):
  ///   Authorization Bearer Token
  Future<Response> getWorkspacesWithHttpInfo(String X_SDBXAZ_API_KEY, String authorization,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/access-control/client-api/v3/accessgroups/user-context/service-agreements';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'X-SDBXAZ-API-KEY'] = parameterToString(X_SDBXAZ_API_KEY);
    headerParams[r'Authorization'] = parameterToString(authorization);

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// workspaces apis
  ///
  /// Parameters:
  ///
  /// * [String] X_SDBXAZ_API_KEY (required):
  ///   The device Id fetched from the server.
  ///
  /// * [String] authorization (required):
  ///   Authorization Bearer Token
  Future<List<Workspace>?> getWorkspaces(String X_SDBXAZ_API_KEY, String authorization,) async {
    final response = await getWorkspacesWithHttpInfo(X_SDBXAZ_API_KEY, authorization,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Workspace>') as List)
        .cast<Workspace>()
        .toList(growable: false);

    }
    return null;
  }
}
