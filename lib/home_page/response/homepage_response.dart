class HomePageModel {
  Events? events;
  ///remove
  List<ItemTypes>? itemTypes;
  List<Restaurants>? resturnats;


  HomePageModel.fromJson(Map<String, dynamic> json) {
    events =
    json['events'] != null ? Events.fromJson(json['events']) : null;
    if (json['itemTypes'] != null) {
      itemTypes = <ItemTypes>[];
      json['destinationPrice'].forEach((v) {
        itemTypes?.add(ItemTypes.fromJson(v));
      });
    }
    if (json['restaurants'] != null) {
      resturnats = <Restaurants>[];
      json['restaurants'].forEach((v) {
        resturnats?.add(Restaurants.fromJson(v));
      });
    }
  }


}

class Events {
  List<Ads>? services;
  List<Ads>? other;


  Events.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = <Ads>[];
      json['services'].forEach((v) {
        services?.add(Ads.fromJson(v));
      });
    }
    if (json['other'] != null) {
      other = <Ads>[];
      json['other'].forEach((v) {
        other?.add(Ads.fromJson(v));
      });
    }
  }


}

class Ads {
  int id=0;
  String title="";
  String description="";
  String imageUrl="";

  Ads();

  Ads.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    title = json['title']??"";
    description = json['description']??"";
    imageUrl = json['imageUrl']??"";
  }


}

class ItemTypes {
  int id=0;
  String title="";
  num price=0;
  bool checked=false;

  ItemTypes(this.title ,this.id ,this.checked ,this.price );

  ItemTypes.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    title = json['name']??"";
    price = json['price']??"";
    checked= false;
  }


}

class Restaurants {
  int? id=0;
  String? restaurantName;
  String? location;
  String? speciality;
  String? opensAt;
  String? closesAt;
  int? rating=0;
  String? imageName;
  String? imageUrl;
  int? cityId=0;
  String? pdfName;
  String? pdfUrl;


  Restaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantName = json['restaurantName'];
    location = json['location'];
    speciality = json['speciality'];
    opensAt = json['opensAt'];
    closesAt = json['closesAt'];
    rating = json['rating'];
    imageName = json['imageName'];
    imageUrl = json['imageUrl'];
    cityId = json['cityId'];
    pdfName = json['pdfName'];
    pdfUrl = json['pdfUrl'];
  }


}