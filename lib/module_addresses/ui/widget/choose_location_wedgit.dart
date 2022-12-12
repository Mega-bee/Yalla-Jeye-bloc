import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:untitled1/home_page/response/homepage_response.dart';
import 'package:untitled1/module_deep_links/service/deep_links_service.dart';
import 'package:untitled1/order_details/response/order_response.dart';

import 'location_service.dart';

class ChooseLocationWidget extends StatefulWidget {
  LatLng? previousLocation;

  ChooseLocationWidget({this.previousLocation});

  @override
  State<StatefulWidget> createState() => ChooseLocationWidgetState();
}

const kGoogleApiKey = 'AIzaSyAUb3BCjipGx9ZhrmI15migHs6RVan7XPE';
final homeScaffoldKey = GlobalKey<ScaffoldState>();

class ChooseLocationWidgetState extends State<ChooseLocationWidget> {
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(-33.852, 151.211),
    zoom: 15.0,
  );
  TextEditingController _searchController = TextEditingController();

  CameraPosition _position = _kInitialPosition;
  bool _isMapCreated = false;
  final bool _isMoving = false;
  bool _compassEnabled = true;
  bool _mapToolbarEnabled = true;
  CameraTargetBounds _cameraTargetBounds = CameraTargetBounds.unbounded;
  MinMaxZoomPreference _minMaxZoomPreference = MinMaxZoomPreference.unbounded;
  MapType _mapType = MapType.normal;
  bool _rotateGesturesEnabled = true;
  bool _scrollGesturesEnabled = true;
  bool _tiltGesturesEnabled = true;
  bool _zoomControlsEnabled = false;
  bool _zoomGesturesEnabled = true;
  bool _indoorViewEnabled = true;
  bool _myLocationEnabled = true;
  bool _myTrafficEnabled = false;
  bool _myLocationButtonEnabled = true;

  // late GoogleMapController _controller;/
  late CustomInfoWindowController customInfoWindowController;
  bool _nightMode = false;
  Set<Marker> markers = {};
  final Mode _mode = Mode.overlay;

  // Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    // _controller = GoogleMapController.init(id, _position);
    _position = widget.previousLocation != null
        ? CameraPosition(
            target: LatLng(widget.previousLocation!.latitude,
                widget.previousLocation!.longitude),
            zoom: 15.0,
          )
        : _kInitialPosition;
    customInfoWindowController = CustomInfoWindowController();
    getDefualtLocation(widget.previousLocation);
  }

  getDefualtLocation([LatLng? previous]) async {
    print('in loocc');
    late LatLng POS;
    if (previous == null || previous.latitude == 0.0) {
      var myLocation = await DeepLinksService.defaultLocation();
      POS = LatLng(myLocation?.latitude ?? 0, myLocation?.longitude ?? 0);
      print(POS);
      print('ddddddddddddddddddddddddddd');
    } else {
      await Future.delayed(Duration(milliseconds: 30));
      print('innnnnnnnelllssseeeee');
      print(previous);
      POS = previous;
    }
    customInfoWindowController.googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(target: POS, zoom: 15)));
    markers.add(
        Marker(markerId: MarkerId(POS.latitude.toString()), position: POS));
    setState(() {
      print('ssssssssss');
    });
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    // final GoogleMapController controller = await _cameraTargetBounds.f
    // con
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GoogleMap googleMap = GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition: _position,
      compassEnabled: _compassEnabled,
      mapToolbarEnabled: _mapToolbarEnabled,
      cameraTargetBounds: _cameraTargetBounds,
      minMaxZoomPreference: _minMaxZoomPreference,
      mapType: _mapType,
      rotateGesturesEnabled: _rotateGesturesEnabled,
      scrollGesturesEnabled: _scrollGesturesEnabled,
      tiltGesturesEnabled: _tiltGesturesEnabled,
      zoomGesturesEnabled: _zoomGesturesEnabled,
      zoomControlsEnabled: _zoomControlsEnabled,
      indoorViewEnabled: _indoorViewEnabled,
      myLocationEnabled: _myLocationEnabled,
      myLocationButtonEnabled: _myLocationButtonEnabled,
      trafficEnabled: _myTrafficEnabled,
      // onCameraMove: _updateCameraPosition,
      markers: markers,
      onTap: (v) {
        markers.clear();
        markers.add(
            Marker(markerId: MarkerId(v.latitude.toString()), position: v));
        setState(() {});
      },
    );

    return Scaffold(
      key: homeScaffoldKey,
      appBar: AppBar(
        title: Text('Select location'),
      ),
      body: Stack(
        children: [
          googleMap,
          ElevatedButton(
            onPressed: _handlePressButton,
            child: Text("Search Places"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, markers.first.position);
        },
        child: Icon(
          FontAwesomeIcons.checkDouble,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: [""],
        decoration: InputDecoration(
          hintText: 'Search',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        components: [Component(Component.country, "zahle")]);

    displayPrediction(p!, homeScaffoldKey.currentState);
  }

  void onError(PlacesAutocompleteResponse response) {
    Fluttertoast.showToast(
      msg: response.errorMessage.toString(),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      customInfoWindowController.googleMapController = controller;
      // _isMapCreated = true;
    });
  }

  Future<void> displayPrediction(
      Prediction p, ScaffoldState? currentState) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders());
    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    markers.clear();
    markers.add(
      Marker(
          markerId: const MarkerId("0"),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: detail.result.name)),
    );
    setState(() {});

    customInfoWindowController.googleMapController!.animateCamera(
      CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0),
    );
  }
}
