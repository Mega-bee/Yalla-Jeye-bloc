class HomePageModel {
  Events? events;
  ///remove
  List<ItemTypes>? itemTypes;
  List<DestinationWithPlaces>? destinationsPlaces;




  HomePageModel.fromJson(Map<String, dynamic> json) {
    events =
    json['events'] != null ? Events.fromJson(json['events']) : null;
    if (json['itemTypes'] != null) {
      itemTypes = <ItemTypes>[];
      json['itemTypes'].forEach((v) {
        itemTypes?.add(ItemTypes.fromJson(v));
      });
    }


    if (json['destinationWithPlaces'] != null) {
      destinationsPlaces = <DestinationWithPlaces>[];
      json['destinationWithPlaces'].forEach((v) {
        destinationsPlaces!.add(DestinationWithPlaces.fromJson(v));
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
  bool checked=false;

  ItemTypes(this.title ,this.id ,this.checked , );

  ItemTypes.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    title = json['name']??"";
    checked= false;
  }


}

class Destinations {
  int? id;
  String? image;
  String? title;

  Destinations({this.id, this.image, this.title});

  Destinations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    return data;
  }
}

class DestinationWithPlaces {
  int? id;
  String? title;
  String? description;
  List<Places>? places;

  DestinationWithPlaces({this.id, this.title, this.description, this.places});

  DestinationWithPlaces.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    if (json['places'] != null) {
      places = <Places>[];
      json['places'].forEach((v) {
        places!.add(new Places.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.places != null) {
      data['places'] = this.places!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Places {
  int? id;
  String? image;
  String? title;
  String? description;

  Places({this.id, this.image, this.title, this.description});

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
class DestinationPrice {
  int? id;
  int? price;
  String? name;
  List<DestinationPlace>? destinationPlace;

  DestinationPrice({this.id, this.price, this.name, this.destinationPlace});

  DestinationPrice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    name = json['name'];
    if (json['destinationPlace'] != null) {
      destinationPlace = <DestinationPlace>[];
      json['destinationPlace'].forEach((v) {
        destinationPlace!.add(new DestinationPlace.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['name'] = this.name;
    if (this.destinationPlace != null) {
      data['destinationPlace'] =
          this.destinationPlace!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DestinationPlace {
  int? id;
  String? name;

  DestinationPlace({this.id, this.name});

  DestinationPlace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}




