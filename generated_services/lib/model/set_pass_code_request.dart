//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of generated_services;

class SetPassCodeRequest {
  /// Returns a new [SetPassCodeRequest] instance.
  SetPassCodeRequest({
    this.encryptedPrivateKey,
    this.passcode,
    this.username,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? encryptedPrivateKey;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? passcode;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? username;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SetPassCodeRequest &&
    other.encryptedPrivateKey == encryptedPrivateKey &&
    other.passcode == passcode &&
    other.username == username;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (encryptedPrivateKey == null ? 0 : encryptedPrivateKey!.hashCode) +
    (passcode == null ? 0 : passcode!.hashCode) +
    (username == null ? 0 : username!.hashCode);

  @override
  String toString() => 'SetPassCodeRequest[encryptedPrivateKey=$encryptedPrivateKey, passcode=$passcode, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.encryptedPrivateKey != null) {
      json[r'encryptedPrivateKey'] = this.encryptedPrivateKey;
    } else {
      json[r'encryptedPrivateKey'] = null;
    }
    if (this.passcode != null) {
      json[r'passcode'] = this.passcode;
    } else {
      json[r'passcode'] = null;
    }
    if (this.username != null) {
      json[r'username'] = this.username;
    } else {
      json[r'username'] = null;
    }
    return json;
  }

  /// Returns a new [SetPassCodeRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SetPassCodeRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SetPassCodeRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SetPassCodeRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SetPassCodeRequest(
        encryptedPrivateKey: mapValueOfType<String>(json, r'encryptedPrivateKey'),
        passcode: mapValueOfType<String>(json, r'passcode'),
        username: mapValueOfType<String>(json, r'username'),
      );
    }
    return null;
  }

  static List<SetPassCodeRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SetPassCodeRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SetPassCodeRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SetPassCodeRequest> mapFromJson(dynamic json) {
    final map = <String, SetPassCodeRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SetPassCodeRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SetPassCodeRequest-objects as value to a dart map
  static Map<String, List<SetPassCodeRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SetPassCodeRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SetPassCodeRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

