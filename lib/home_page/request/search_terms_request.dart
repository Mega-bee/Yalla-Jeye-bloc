class SearcPlacesRequest {
  String?isSearch;

  SearcPlacesRequest({this.isSearch});

  Map<String, dynamic> toJson() {
    return {
      'searchTerm': isSearch,
    };
  }

}