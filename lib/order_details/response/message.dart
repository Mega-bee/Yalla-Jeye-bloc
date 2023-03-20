class GetMessagesResponse {
  int? id;
  String? fromUserName;
  bool isFromUser =false;
  DateTime createdDate = DateTime.now();
  String? audioFile;
  int? messageTypeId;
  bool? isFromAdmin;
  int? orderId;
  String? fromUserId;
  String? message;
  List<String>? reactions; // New field to store reactions


  GetMessagesResponse(
      {this.id,
        this.fromUserName,
        // this.toUserName,
        required this.isFromUser,

        required this.createdDate,
        this.audioFile,
        this.messageTypeId,
        this.isFromAdmin,
        this.orderId,
        this.fromUserId,
        // this.toUserId,
        this.message,
        this.reactions,
      });

  GetMessagesResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromUserName = json['fromUserName'];
    // toUserName = json['toUserName'];
    isFromUser = json['isFromUser'];
    createdDate  = DateTime.parse(json['createdDate']);
    audioFile = json['audioFile'];
    messageTypeId = json['messageTypeId'];
    isFromAdmin = json['isFromAdmin'];
    orderId = json['orderId'];
    fromUserId = json['fromUserId'];
    // toUserId = json['toUserId'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fromUserName'] = this.fromUserName;
    // data['toUserName'] = this.toUserName;
    data['isFromUser'] = this.isFromUser;
    data['createdDate'] = this.createdDate;
    data['audioFile'] = this.audioFile;
    data['messageTypeId'] = this.messageTypeId;
    data['isFromAdmin'] = this.isFromAdmin;
    data['orderId'] = this.orderId;
    data['fromUserId'] = this.fromUserId;
    // data['toUserId'] = this.toUserId;
    data['message'] = this.message;
    return data;
  }
}
