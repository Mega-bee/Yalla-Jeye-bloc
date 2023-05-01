import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled1/module_deep_links/service/deep_links_service.dart';
import 'package:untitled1/utils/Colors/colors.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

class ChooseLocationWidget extends StatefulWidget {
  LatLng? previousLocation;

  ChooseLocationWidget({this.previousLocation});

  @override
  State<StatefulWidget> createState() => ChooseLocationWidgetState();
}

class ChooseLocationWidgetState extends State<ChooseLocationWidget> {
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(-33.852, 151.211),
    zoom: 15.0,
  );
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
  final List<Marker> markers = [];

  static const KGoogleApiKey = 'AIzaSyBW7QXx_2fXaX_ROBknRJJVdXBf0_bOZ3c';

  final Mode _mode = Mode.overlay;

  final homeScaffoldKey = GlobalKey<ScaffoldState>();

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
      markers: markers.toSet(),
      onTap: (v) {
        markers.clear();
        markers.add(
            Marker(markerId: MarkerId(v.latitude.toString()), position: v));
        setState(() {});
      },
      onCameraMove: (position) {
        setState(() {
          markers.first =
              markers.first.copyWith(positionParam: position.target);
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Select location'),
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          googleMap,
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: ElevatedButton(
              onPressed: _handlePressButton,
              child: Text(
                'Search Places',
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context, markers.first.position);
        },
        label: InkWell(
          onTap: () {
            Navigator.pop(context, markers.first.position);
          },
          child: Text(
            "Confirm location",
          ),
        ),
        backgroundColor: redColor,
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      customInfoWindowController.googleMapController = controller;
      // _isMapCreated = true;
    });
  }

  Future<void> _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: KGoogleApiKey,
        onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: [''],
        decoration: InputDecoration(
          hintText: 'Search',
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              )),
        ),
        components: [
          Component(
            Component.country,
            'lebanon',
          ),
        ]);

    displayPrediction(p!, homeScaffoldKey.currentState);
  }

  void onError(PlacesAutocompleteResponse response) {
    print("errorPlace:${response.errorMessage!}");
    Fluttertoast.showToast(
        msg: response.errorMessage!, backgroundColor: redColor);
  }

  Future<void> displayPrediction(
      Prediction p, ScaffoldState? currentState) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: KGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders());

    PlacesDetailsResponse details =
        await places.getDetailsByPlaceId(p.placeId!);
    final lat = details.result.geometry!.location.lat;
    final long = details.result.geometry!.location.lng;

    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId(
          '0',
        ),
        position: LatLng(
          lat,
          long,
        ),
        infoWindow: InfoWindow(title: details.result.name),
      ),
    );
    setState(() {});

    customInfoWindowController.googleMapController?.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(lat, long),
        14.0,
      ),
    );
  }
}
