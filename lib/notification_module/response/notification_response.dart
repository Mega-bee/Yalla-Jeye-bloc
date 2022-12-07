
class NotificationModel {
  String? initiatorId;
  String? initiatorName;
  String? initiatorImage;
  int? eventId;
  int? businessId;
  String? businessName;
  int? reviewId;
  int? postId;
  String? postImage;
  DateTime? createdDate;

  NotificationModel(
      {this.initiatorId,
        this.initiatorName,
        this.initiatorImage,
        this.eventId,
        this.businessId,
        this.businessName,
        this.reviewId,
        this.postId,
        this.postImage,
        this.createdDate}
      );

  NotificationModel.fromJson(Map<String, dynamic> json) {
    initiatorId = json['initiatorId'];
    initiatorName = json['initiatorName'];
    initiatorImage = json['initiatorImage'];
    eventId = json['eventId'];
    businessId = json['businessId'];
    businessName = json['businessName'];
    reviewId = json['reviewId'];
    postId = json['postId'];
    postImage = json['postImage'];
    createdDate = DateTime.parse(json['createdDate']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['initiatorId'] = this.initiatorId;
    data['initiatorName'] = this.initiatorName;
    data['initiatorImage'] = this.initiatorImage;
    data['eventId'] = this.eventId;
    data['businessId'] = this.businessId;
    data['businessName'] = this.businessName;
    data['reviewId'] = this.reviewId;
    data['postId'] = this.postId;
    data['postImage'] = this.postImage;
    data['createdDate'] = this.createdDate;
    return data;
  }
}
