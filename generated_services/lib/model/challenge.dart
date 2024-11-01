//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of generated_services;

class Challenge {
  /// Returns a new [Challenge] instance.
  Challenge({
    this.challengeType,
    this.nonce,
    this.deviceId,
  });

  String? challengeType;

  String? nonce;

  String? deviceId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Challenge &&
    other.challengeType == challengeType &&
    other.nonce == nonce &&
    other.deviceId == deviceId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (challengeType == null ? 0 : challengeType!.hashCode) +
    (nonce == null ? 0 : nonce!.hashCode) +
    (deviceId == null ? 0 : deviceId!.hashCode);

  @override
  String toString() => 'Challenge[challengeType=$challengeType, nonce=$nonce, deviceId=$deviceId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.challengeType != null) {
      json[r'challengeType'] = this.challengeType;
    } else {
      json[r'challengeType'] = null;
    }
    if (this.nonce != null) {
      json[r'nonce'] = this.nonce;
    } else {
      json[r'nonce'] = null;
    }
    if (this.deviceId != null) {
      json[r'deviceId'] = this.deviceId;
    } else {
      json[r'deviceId'] = null;
    }
    return json;
  }

  /// Returns a new [Challenge] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Challenge? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Challenge[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Challenge[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Challenge(
        challengeType: mapValueOfType<String>(json, r'challengeType'),
        nonce: mapValueOfType<String>(json, r'nonce'),
        deviceId: mapValueOfType<String>(json, r'deviceId'),
      );
    }
    return null;
  }

  static List<Challenge> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Challenge>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Challenge.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Challenge> mapFromJson(dynamic json) {
    final map = <String, Challenge>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Challenge.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Challenge-objects as value to a dart map
  static Map<String, List<Challenge>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Challenge>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Challenge.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

