class HomePageModel {
  Events? events;
  List<ItemTypes>? itemTypes;
  List<Destinations>? destinations;
  List<DestinationWithPlaces>? destinationWithPlaces;
  int? notificationCount;

  HomePageModel({
    this.events,
    this.itemTypes,
    this.destinations,
    this.destinationWithPlaces,
    this.notificationCount,

  });

  HomePageModel.fromJson(Map<String, dynamic> json) {
    events =
        json['events'] != null ? new Events.fromJson(json['events']) : null;
    if (json['itemTypes'] != null) {
      itemTypes = <ItemTypes>[];
      json['itemTypes'].forEach((v) {
        itemTypes!.add(new ItemTypes.fromJson(v));
      });
    }
    if (json['destinations'] != null) {
      destinations = <Destinations>[];
      json['destinations'].forEach((v) {
        destinations!.add(new Destinations.fromJson(v));
      });
    }
    if (json['destinationWithPlaces'] != null) {
      destinationWithPlaces = <DestinationWithPlaces>[];
      json['destinationWithPlaces'].forEach((v) {
        destinationWithPlaces!.add(new DestinationWithPlaces.fromJson(v));
      });
    }
    notificationCount = json['notificationCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['events'] = this.events!.toJson();
    }
    if (this.itemTypes != null) {
      data['itemTypes'] = this.itemTypes!.map((v) => v.toJson()).toList();
    }
    if (this.destinations != null) {
      data['destinations'] = this.destinations!.map((v) => v.toJson()).toList();
    }
    if (this.destinationWithPlaces != null) {
      data['destinationWithPlaces'] =
          this.destinationWithPlaces!.map((v) => v.toJson()).toList();
    }
    data['notificationCount'] = this.notificationCount;
    return data;
  }
}

class Events {
  List<Services>? services;

  Events({this.services});

  Events.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? id;
  String? title;
  String? description;
  String? imageUrl;
  int? typeId;
  Null? type;

  Services(
      {this.id,
      this.title,
      this.description,
      this.imageUrl,
      this.typeId,
      this.type});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    typeId = json['typeId'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['typeId'] = this.typeId;
    data['type'] = this.type;
    return data;
  }
}

class ItemTypes {
  int? id;
  String? title;
  bool? checked;

  ItemTypes({this.id, this.title, this.checked});

  ItemTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    checked = json['checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['checked'] = this.checked;
    return data;
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
  String? menu;

  Places({this.id, this.image, this.title, this.description, this.menu});

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    menu = json['menu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    data['menu'] = this.menu;
    return data;
  }
}
