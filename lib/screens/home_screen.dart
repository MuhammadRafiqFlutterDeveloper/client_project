import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:precises/screens/controller.dart';
import 'package:precises/screens/header%20and%20footer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'layouthome.dart';

class HomePage extends GetView<HomePageController> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(),
      drawer: kIsWeb ? AppDrawer() : null,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Obx(
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
            Positioned(
              top: 60,
              left: 250,
              child: Container(
                color: Color(0xffFFF5F5),
                height: 400,
                width: 300,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 28.0, vertical: 29),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xff7996A4),
                            ),
                            hintText: 'IMEI/Device name/Simcard no.',
                            hintStyle: TextStyle(
                              color: Color(0xff7996A4),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Color(0xff7996A4),
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'All',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            'Online (15)',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Offline (5)',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Inactive (7)',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            'Sorted By',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff7996A4),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return LayoutHome();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 20,
              child: Container(
                color: Colors.white,
                height: 100,
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.maps_ugc_sharp,
                      color: Colors.black,
                      size: 24,
                    ),
                    Image.asset(
                      'assets/image/img_3.png',
                      color: Colors.black,
                      height: 24,
                      width: 24,
                    ),
                    Image.asset(
                      'assets/image/img_4.png',
                      color: Colors.black,
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 230,
              bottom: 230,
              child: Container(
                color: Colors.white,
                height: 100,
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 24,
                    ),
                    Icon(
                      Icons.navigation_outlined,
                      color: Colors.black,
                      size: 24,
                    ),

                    Image.asset(
                      'assets/image/img_5.png',
                      color: Colors.black,
                      height: 24,
                      width: 24,
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
