//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of generated_services;

class ChallengesDTO {
  /// Returns a new [ChallengesDTO] instance.
  ChallengesDTO({
    this.challenges = const [],
    this.error,
    this.errorDescription,
  });

  List<Challenge> challenges;

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
  bool operator ==(Object other) => identical(this, other) || other is ChallengesDTO &&
    _deepEquality.equals(other.challenges, challenges) &&
    other.error == error &&
    other.errorDescription == errorDescription;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (challenges.hashCode) +
    (error == null ? 0 : error!.hashCode) +
    (errorDescription == null ? 0 : errorDescription!.hashCode);

  @override
  String toString() => 'ChallengesDTO[challenges=$challenges, error=$error, errorDescription=$errorDescription]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'challenges'] = this.challenges;
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

  /// Returns a new [ChallengesDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChallengesDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ChallengesDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ChallengesDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ChallengesDTO(
        challenges: Challenge.listFromJson(json[r'challenges']),
        error: mapValueOfType<String>(json, r'error'),
        errorDescription: mapValueOfType<String>(json, r'error_description'),
      );
    }
    return null;
  }

  static List<ChallengesDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChallengesDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChallengesDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChallengesDTO> mapFromJson(dynamic json) {
    final map = <String, ChallengesDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChallengesDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChallengesDTO-objects as value to a dart map
  static Map<String, List<ChallengesDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChallengesDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChallengesDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

