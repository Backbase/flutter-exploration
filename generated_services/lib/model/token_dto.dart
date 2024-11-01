//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of generated_services;

class TokenDTO {
  /// Returns a new [TokenDTO] instance.
  TokenDTO({
    this.accessToken,
    this.expiresIn,
    this.refreshExpiresIn,
    this.refreshToken,
    this.tokenType,
    this.notBeforePolicy,
    this.sessionState,
    this.scope,
    this.error,
    this.errorDescription,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accessToken;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? expiresIn;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? refreshExpiresIn;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? refreshToken;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tokenType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? notBeforePolicy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? sessionState;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? scope;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? error;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? errorDescription;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TokenDTO &&
    other.accessToken == accessToken &&
    other.expiresIn == expiresIn &&
    other.refreshExpiresIn == refreshExpiresIn &&
    other.refreshToken == refreshToken &&
    other.tokenType == tokenType &&
    other.notBeforePolicy == notBeforePolicy &&
    other.sessionState == sessionState &&
    other.scope == scope &&
    other.error == error &&
    other.errorDescription == errorDescription;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accessToken == null ? 0 : accessToken!.hashCode) +
    (expiresIn == null ? 0 : expiresIn!.hashCode) +
    (refreshExpiresIn == null ? 0 : refreshExpiresIn!.hashCode) +
    (refreshToken == null ? 0 : refreshToken!.hashCode) +
    (tokenType == null ? 0 : tokenType!.hashCode) +
    (notBeforePolicy == null ? 0 : notBeforePolicy!.hashCode) +
    (sessionState == null ? 0 : sessionState!.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (error == null ? 0 : error!.hashCode) +
    (errorDescription == null ? 0 : errorDescription!.hashCode);

  @override
  String toString() => 'TokenDTO[accessToken=$accessToken, expiresIn=$expiresIn, refreshExpiresIn=$refreshExpiresIn, refreshToken=$refreshToken, tokenType=$tokenType, notBeforePolicy=$notBeforePolicy, sessionState=$sessionState, scope=$scope, error=$error, errorDescription=$errorDescription]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accessToken != null) {
      json[r'access_token'] = this.accessToken;
    } else {
      json[r'access_token'] = null;
    }
    if (this.expiresIn != null) {
      json[r'expires_in'] = this.expiresIn;
    } else {
      json[r'expires_in'] = null;
    }
    if (this.refreshExpiresIn != null) {
      json[r'refresh_expires_in'] = this.refreshExpiresIn;
    } else {
      json[r'refresh_expires_in'] = null;
    }
    if (this.refreshToken != null) {
      json[r'refresh_token'] = this.refreshToken;
    } else {
      json[r'refresh_token'] = null;
    }
    if (this.tokenType != null) {
      json[r'token_type'] = this.tokenType;
    } else {
      json[r'token_type'] = null;
    }
    if (this.notBeforePolicy != null) {
      json[r'not-before-policy'] = this.notBeforePolicy;
    } else {
      json[r'not-before-policy'] = null;
    }
    if (this.sessionState != null) {
      json[r'session_state'] = this.sessionState;
    } else {
      json[r'session_state'] = null;
    }
    if (this.scope != null) {
      json[r'scope'] = this.scope;
    } else {
      json[r'scope'] = null;
    }
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    if (this.errorDescription != null) {
      json[r'error_description'] = this.errorDescription;
    } else {
      json[r'error_description'] = null;
    }
    return json;
  }

  /// Returns a new [TokenDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TokenDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TokenDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TokenDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TokenDTO(
        accessToken: mapValueOfType<String>(json, r'access_token'),
        expiresIn: num.parse('${json[r'expires_in']}'),
        refreshExpiresIn: num.parse('${json[r'refresh_expires_in']}'),
        refreshToken: mapValueOfType<String>(json, r'refresh_token'),
        tokenType: mapValueOfType<String>(json, r'token_type'),
        notBeforePolicy: num.parse('${json[r'not-before-policy']}'),
        sessionState: mapValueOfType<String>(json, r'session_state'),
        scope: mapValueOfType<String>(json, r'scope'),
        error: mapValueOfType<String>(json, r'error'),
        errorDescription: mapValueOfType<String>(json, r'error_description'),
      );
    }
    return null;
  }

  static List<TokenDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TokenDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TokenDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TokenDTO> mapFromJson(dynamic json) {
    final map = <String, TokenDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TokenDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TokenDTO-objects as value to a dart map
  static Map<String, List<TokenDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TokenDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TokenDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

