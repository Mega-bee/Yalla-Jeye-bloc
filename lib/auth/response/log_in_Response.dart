class logInModel {

  String? name;
  String? token;

  logInModel({ this.name, this.token});

  logInModel.fromJson(Map<String, dynamic> json) {

    name = json['name'];
    token = json['token'];
  }

}