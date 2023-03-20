class MessageResponse {
  int? id;
  bool? isFromUser;
  String? createdDate;
  int? messageTypeId;
  int? orderId;
  String? message;

  MessageResponse(
      {this.id,

        this.isFromUser,
        this.createdDate,
        this.messageTypeId,
        this.orderId,
        this.message,
      });

  MessageResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    isFromUser = json['isFromUser'];
    createdDate = json['createdDate'];
    messageTypeId = json['messageTypeId'];
    orderId = json['orderId'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isFromUser'] = this.isFromUser;
    data['createdDate'] = this.createdDate;
    data['messageTypeId'] = this.messageTypeId;
    data['orderId'] = this.orderId;
    data['message'] = this.message;
    return data;
  }
}
