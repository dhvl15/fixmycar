import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}
class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(19.076090,  72.877426);

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void getMarkers(){
    FirebaseFirestore.instance.collection('stores').get().then((documents){
      if(documents.docs.isNotEmpty){
        for (var item in documents.docs) {
          GeoPoint geoPoint = item.get("loc");
          LatLng latLng = new LatLng(geoPoint.latitude, geoPoint.longitude);
          setState(() {
            _markers.add(Marker(
              // This marker id can be anything that uniquely identifies each marker.
              markerId: MarkerId(latLng.toString()),
              position: latLng,
              infoWindow: InfoWindow(
                title: item.get("name"),
                snippet: item.get("rating"),
                onTap: (){
                  launch('tel://91${item.get("contact")}');
                }
              ),
              icon: BitmapDescriptor.defaultMarker,
            ));
          });
        }
      }
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    super.initState();
    getMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Store locator'),
          backgroundColor: Colors.blueGrey, //Colors.green[700],
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget> [
                    FloatingActionButton(
                      onPressed: _onMapTypeButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.blueGrey,
                      child: const Icon(Icons.map, size: 36.0),
                    ),
                    SizedBox(height: 16.0),
                    FloatingActionButton(
                      onPressed: _onAddMarkerButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.blueGrey,
                      child: const Icon(Icons.add_location, size: 36.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}