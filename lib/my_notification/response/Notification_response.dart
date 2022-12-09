class NotificationModel {
  int? id;
  String? title;
  String? description;
  String? createdDate;
  int? orderId;

  NotificationModel(
      {this.id, this.title, this.description, this.createdDate, this.orderId});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdDate = json['createdDate'];
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['createdDate'] = this.createdDate;
    data['orderId'] = this.orderId;
    return data;
  }
}
