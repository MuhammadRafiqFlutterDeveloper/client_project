import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomePageController extends GetxController {
  final Location location = Location();
  final Map<MarkerId, Marker> markers = {};
  final Rx<LatLng?> currentLocation = Rx<LatLng?>(null);
  GoogleMapController? mapController;

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final LocationData locationData = await location.getLocation();
      currentLocation.value =
          LatLng(locationData.latitude!, locationData.longitude!);
    } catch (error) {
      print(error);
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onMarkerTapped(MarkerId markerId) {}

  void onCameraMove(CameraPosition position) {}

  @override
  void onClose() {
    mapController?.dispose();
    super.onClose();
  }
}
