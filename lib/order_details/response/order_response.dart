  class OrderDetailsResponse {
    int? id;
    int? statusId;
    String? statusName;
    bool  isCustom = false;
    List<PlacesDetails>? orderPlaces;
    List<Messages>? chatList;
    num? totalDistance;
    num? totalPrice;
    CustomOrder? customOrder;
    bool  requiresRating = false;
    num? rating;


    OrderDetailsResponse({
      this.id,
      this.statusId,
      this.statusName,
     required this.isCustom,
      this.orderPlaces,
      this.totalPrice,
      this.totalDistance,
      this.customOrder,
      this.rating,
     required this.requiresRating
    });

    OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      rating = json['rating'];
      requiresRating = json['requiresRating'];
      statusId = json['statusId'];
      statusName = json['statusName'];
      isCustom = json['isCustom'];
      totalDistance = json['totalDistance'];
      totalPrice = json['totalPrice'];
      if (json['orderPlaces'] != null) {
        orderPlaces = <PlacesDetails>[];
        json['orderPlaces'].forEach((v) {
          orderPlaces!.add( PlacesDetails.fromJson(v));
        });
      }
      if (json['messages'] != null) {
        chatList = <Messages>[];
        json['messages'].forEach((v) {
          chatList!.add( Messages.fromJson(v));
        });
      }
      if(json['customOrder'] != null){
        customOrder = CustomOrder.fromJson(json['customOrder']);
      }



    }
  }

  class CustomOrder {
    FromAddress? toAddress;
    FromAddress? fromAddress;
    String? description;

    CustomOrder({this.toAddress, this.fromAddress});

    CustomOrder.fromJson(Map<String, dynamic> json) {
      toAddress = json['toAddress'] != null
          ?   FromAddress.fromJson(json['toAddress'])
          : null;
      fromAddress = json['fromAddress'] != null
          ?   FromAddress.fromJson(json['fromAddress'])
          : null;
      description = json['description'];
    }
  }

  class FromAddress {
    int? id;
    String? city;
    int? cityId;
    String? street;
    String? buildingName;
    int? floorNumber;
    String? title;
    String? description;
    String? longitude;
    String? latitude;

    FromAddress(
        {this.id,
        this.city,
        this.cityId,
        this.street,
        this.buildingName,
        this.floorNumber,
        this.title,
        this.description,
        this.longitude,
        this.latitude});

    FromAddress.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      city = json['city'];
      cityId = json['cityId'];
      street = json['street'];
      buildingName = json['buildingName'];
      floorNumber = json['floorNumber'];
      title = json['title'];
      description = json['description'];
      longitude = json['longitude'];
      latitude = json['latitude'];
    }
  }

  class PlacesDetails {
    int? id;
    String? placeName;
    String? description;
    bool? makeOrder;
    bool? payOrder;

    PlacesDetails(
        this.id, this.placeName, this.description, this.makeOrder, this.payOrder);

    PlacesDetails.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      placeName = json['placeName'];
      description = json['description'];
      makeOrder = json['makeOrder'];
      payOrder = json['payOrder'];
    }
  }

  class Messages {
    int? id;
    String? fromUserName;
    // Null? toUserName;
    bool isFromUser =false;
    DateTime createdDate = DateTime.now();
    String? audioFile;
    int? messageTypeId;
    bool? isFromAdmin;
    int? orderId;
    String? fromUserId;
    // Null? toUserId;
    String? message;

    Messages(
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
          this.message});

    Messages.fromJson(Map<String, dynamic> json) {
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

