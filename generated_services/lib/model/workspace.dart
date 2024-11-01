//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of generated_services;

class Workspace {
  /// Returns a new [Workspace] instance.
  Workspace({
    this.id,
    this.externalId,
    this.name,
    this.description,
    this.isMaster,
    this.validFromDate,
    this.validFromTime,
    this.validUntilDate,
    this.validUntilTime,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? externalId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isMaster;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? validFromDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? validFromTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? validUntilDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? validUntilTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Workspace &&
    other.id == id &&
    other.externalId == externalId &&
    other.name == name &&
    other.description == description &&
    other.isMaster == isMaster &&
    other.validFromDate == validFromDate &&
    other.validFromTime == validFromTime &&
    other.validUntilDate == validUntilDate &&
    other.validUntilTime == validUntilTime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (externalId == null ? 0 : externalId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (isMaster == null ? 0 : isMaster!.hashCode) +
    (validFromDate == null ? 0 : validFromDate!.hashCode) +
    (validFromTime == null ? 0 : validFromTime!.hashCode) +
    (validUntilDate == null ? 0 : validUntilDate!.hashCode) +
    (validUntilTime == null ? 0 : validUntilTime!.hashCode);

  @override
  String toString() => 'Workspace[id=$id, externalId=$externalId, name=$name, description=$description, isMaster=$isMaster, validFromDate=$validFromDate, validFromTime=$validFromTime, validUntilDate=$validUntilDate, validUntilTime=$validUntilTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.externalId != null) {
      json[r'externalId'] = this.externalId;
    } else {
      json[r'externalId'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.isMaster != null) {
      json[r'isMaster'] = this.isMaster;
    } else {
      json[r'isMaster'] = null;
    }
    if (this.validFromDate != null) {
      json[r'validFromDate'] = this.validFromDate;
    } else {
      json[r'validFromDate'] = null;
    }
    if (this.validFromTime != null) {
      json[r'validFromTime'] = this.validFromTime;
    } else {
      json[r'validFromTime'] = null;
    }
    if (this.validUntilDate != null) {
      json[r'validUntilDate'] = this.validUntilDate;
    } else {
      json[r'validUntilDate'] = null;
    }
    if (this.validUntilTime != null) {
      json[r'validUntilTime'] = this.validUntilTime;
    } else {
      json[r'validUntilTime'] = null;
    }
    return json;
  }

  /// Returns a new [Workspace] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Workspace? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Workspace[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Workspace[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Workspace(
        id: mapValueOfType<String>(json, r'id'),
        externalId: mapValueOfType<String>(json, r'externalId'),
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
        isMaster: mapValueOfType<bool>(json, r'isMaster'),
        validFromDate: mapValueOfType<String>(json, r'validFromDate'),
        validFromTime: mapValueOfType<String>(json, r'validFromTime'),
        validUntilDate: mapValueOfType<String>(json, r'validUntilDate'),
        validUntilTime: mapValueOfType<String>(json, r'validUntilTime'),
      );
    }
    return null;
  }

  static List<Workspace> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Workspace>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Workspace.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Workspace> mapFromJson(dynamic json) {
    final map = <String, Workspace>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Workspace.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Workspace-objects as value to a dart map
  static Map<String, List<Workspace>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Workspace>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Workspace.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

