class VeteranRoleModel {
  final String? id;
  final String? sectionTitle;
  final String? lead;
  final List<VeteranRole>? roles;

  VeteranRoleModel({this.id, this.sectionTitle, this.lead, this.roles});

  factory VeteranRoleModel.fromJson(Map<String, dynamic> json) {
    return VeteranRoleModel(
      id: json['_id'] as String?,
      sectionTitle: json['sectionTitle'] as String?,
      lead: json['lead'] as String?,
      roles: (json['roles'] as List?)
          ?.map((e) => VeteranRole.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class VeteranRole {
  final String? id;
  final String? name;

  VeteranRole({this.id, this.name});

  factory VeteranRole.fromJson(Map<String, dynamic> json) {
    return VeteranRole(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name};
  }
}
