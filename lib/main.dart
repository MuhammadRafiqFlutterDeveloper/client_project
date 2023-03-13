import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:precises/screens/controller.dart';
import 'package:precises/screens/login.dart';

void main() => runApp(
  GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: LoginScreen(),
    initialBinding: BindingsBuilder(() {
      Get.lazyPut(() => HomePageController());
    }),
  ),
);

// void main() {
//   runApp(GetMaterialApp(
//     title: 'Google Maps Web Demo',
//     home: HomePage(),
//
//   ));
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Google Maps Web Demo',
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final Location location = Location();
//   final Map<MarkerId, Marker> markers = {};
//   GoogleMapController? mapController;
//   LatLng? _currentLocation;
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   Future<void> _getCurrentLocation() async {
//     try {
//       final LocationData locationData = await location.getLocation();
//       setState(() {
//         _currentLocation =
//             LatLng(locationData.latitude!, locationData.longitude!);
//       });
//     } catch (error) {
//       print(error);
//     }
//   }
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_currentLocation == null) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//
//     final Marker marker = Marker(
//       markerId: MarkerId('current_location'),
//       position: _currentLocation!,
//     );
//     markers[marker.markerId] = marker;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Maps Web Demo'),
//       ),
//       body: Center(
//         child: GoogleMap(
//           onMapCreated: _onMapCreated,
//           initialCameraPosition: CameraPosition(
//             target: _currentLocation!,
//             zoom: 14,
//           ),
//           myLocationEnabled: true,
//           markers: Set<Marker>.of(markers.values),
//         ),
//       ),
//     );
//   }
// }
