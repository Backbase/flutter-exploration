class Workspace {
  final String? id;
  final String? externalId;
  final String? name;
  final String? description;
  final bool? isMaster;
  final String? validFromDate;
  final String? validFromTime;
  final String? validUntilDate;
  final String? validUntilTime;

  const Workspace(
      {this.id,
      this.name,
      this.externalId,
      this.description,
      this.isMaster,
      this.validFromDate,
      this.validFromTime,
      this.validUntilDate,
      this.validUntilTime});

  factory Workspace.fromJson(Map<String, dynamic> json) {
    return Workspace(
      id: json['id'],
      name: json['name'],
      externalId: json['externalId'],
      description: json['description'],
      isMaster: json['isMaster'],
      validFromDate: json['validFromDate'],
      validFromTime: json['validFromTime'],
      validUntilDate: json['validUntilDate'],
      validUntilTime: json['validUntilTime']
    );
  }
}
