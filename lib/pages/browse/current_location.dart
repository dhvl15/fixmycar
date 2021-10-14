// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// class CurrentLocation extends StatefulWidget {
//   final lat;
//   final lng;
//   CurrentLocation({Key key, this.lat, this.lng}) : super(key: key);
//   @override
//   _CurrentLocationState createState() => _CurrentLocationState();
// }

// class _CurrentLocationState extends State<CurrentLocation> {
//   GoogleMapController mapController;

//   final Set<Marker> _markers = {};

//   var currentLocation = LocationData;
//   var location = new Location();
//   var lat, lng;

//   void onMapCreated(controller) {
//     setState(() {
//       mapController = controller;
//     });
//     _markers.add(
//       Marker(
//         icon: BitmapDescriptor.defaultMarker,
// //        icon: BitmapDescriptor.fromAsset(
// //          'lib/assets/icon/marker.png',
// //        ),
//         markerId: MarkerId(LatLng(widget.lat, widget.lng).toString()),
//         position: LatLng(widget.lat, widget.lng),
//       ),
//     );
//   }

//   Widget _buildMap() {
//     return Container(
//       height: 300,
//       width: 300,
//       child: GoogleMap(
//         onMapCreated: onMapCreated,
//         myLocationEnabled: true,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(widget.lat, widget.lng),
//           zoom: 18.0,
//         ),
//         markers: _markers,
//       ),
//     );
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     getLocation();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: _buildMap()));
//   }

//   getLocation() async {
//     try {
//       location.onLocationChanged().listen((LocationData currentLocation) {
//         lat = currentLocation.latitude;
//         lng = currentLocation.longitude;
//         print('lattttttttttttttttt ${currentLocation.latitude}');
//         print('loooongggggggggggggg ${currentLocation.longitude}');
//       });
//     } catch (e) {
//       // if (e.code == 'PERMISSION_DENIED') {
//       //   error = 'Permission denied';
//       // }
//       currentLocation = null;
//     }
//   }
// }
