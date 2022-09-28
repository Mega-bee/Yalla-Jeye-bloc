
class UpdateProfileRequest {
  String? Name;
  // String? PhoneNumber;


  UpdateProfileRequest(
      {required this.Name,});

  Map<String, dynamic> toJson() {
    return {
      'Name':Name,
      // 'PhoneNumber':PhoneNumber,
    };
  }
}
