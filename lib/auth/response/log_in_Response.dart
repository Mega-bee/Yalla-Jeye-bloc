class logInModel {

  String? name;
  String? token;
  int? roleId;

  logInModel({ this.name, this.token ,this.roleId});

  logInModel.fromJson(Map<String, dynamic> json) {

    name = json['name'];
    token = json['token'];
    roleId = json['roleId'];
  }

}