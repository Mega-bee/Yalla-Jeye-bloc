class CheckPromoCodeRequest {
  String code;

  CheckPromoCodeRequest(this.code);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    return data;
  }
}