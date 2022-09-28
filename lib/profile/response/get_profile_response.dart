class GetProfileModel {
  int? id;
  String? name;
  String? phoneNumber;
  int? roleId;
  String? role;
  String? token;

  GetProfileModel(
      {this.id,
        this.name,
        this.phoneNumber,
        this.roleId,
        this.role,
        this.token});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    roleId = json['roleId'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['roleId'] = this.roleId;
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }
}
