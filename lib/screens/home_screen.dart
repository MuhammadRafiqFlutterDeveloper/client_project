import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:precises/screens/controller.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Obx(
              () => controller.currentLocation.value != null
              ? GoogleMap(
            onMapCreated: controller.onMapCreated,
            initialCameraPosition: CameraPosition(
              target: controller.currentLocation.value!,
              zoom: 14,
            ),
            myLocationEnabled: true,
            markers: Set<Marker>.of(controller.markers.values)
              ..add(
                Marker(
                  markerId: MarkerId("currentLocation"),
                  position: controller.currentLocation.value!,
                  infoWindow: InfoWindow(title: "Current Location"),
                ),
              ),
          )
              : CircularProgressIndicator(),
        ),

      ),
    );
  }
}
