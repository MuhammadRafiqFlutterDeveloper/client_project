import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:precises/constant.dart';
import 'package:precises/screens/screens.dart';
import 'controller.dart';
import 'layouts/layoutIcons1.dart';
import 'layouts/layoutItems.dart';
import 'layouts/layouticons.dart';

class ResponsiveLayout extends StatelessWidget {
  final HomePageController controller;
  ResponsiveLayout({required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appbarColor,
        centerTitle: true,
        title: Row(
          children: [
            Flexible(
              child: Image.asset(
                'assets/image/img.png',
                width: 255,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Flexible(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 4,
                margin: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'GPS/DEMO',
                    hintStyle: TextStyle(
                      color: Color(0xffA9A9A9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Current Customer',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Flexible(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 4,
                margin: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'IMEI/Device name/Simcard no.',
                    hintStyle: TextStyle(
                      color: Color(0xffA9A9A9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          // theme light theme and dark theme
          Container(
            height: 40,
            margin: EdgeInsets.symmetric(vertical: 13),
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Off',
                  style: TextStyle(color: Colors.black),
                ),
                Icon(
                  Icons.sunny,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.notification_add_outlined,
            color: Colors.black,
          ),
          SizedBox(width: 10),
          PopupMenuButton(
            icon: Icon(Icons.language_outlined, color: Colors.black, size: 24,),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('English')),
              PopupMenuItem(child: Text('Spanish')),
              PopupMenuItem(child: Text('French')),
            ],
          ),
          SizedBox(width: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Scot',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 3),
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/image/img_2.png'),
              ),
              PopupMenuButton(
                icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                itemBuilder: (_) => [
                  PopupMenuItem(child: Text('Change Password')),
                  PopupMenuItem(child: Text('Log Out')),
                  PopupMenuItem(child: Text('Help')),
                ],
              ),
            ],
          ),
        ],
        elevation: 0,
      ),
      drawer: isMobile
          ? Drawer(
              backgroundColor: Color(0xffFFF5F5),
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Center(
                        child: Image.asset(
                      "assets/image/logo.png",
                      height: 130,
                      width: 130,
                    )),
                    decoration: BoxDecoration(
                      color: drawerColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      tileColor: Color(0xffFFD6D0),
                      leading: Icon(
                        Icons.location_on_outlined,
                        color: Color(0xffEE7E62),
                      ),
                      title: Text('Location'),
                      onTap: () {
                        // Get.to(HomePage());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: Icon(
                        Icons.analytics,
                      ),
                      title: Text('Analytics'),
                      onTap: () {
                        Get.to(MaintenancePage());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: Icon(Icons.manage_accounts),
                      title: Text('Manage'),
                      onTap: () {
                        Get.to(MaintenancePage());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: Icon(Icons.people),
                      title: Text('Users'),
                      onTap: () {
                        Get.to(MaintenancePage());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: Icon(Icons.document_scanner),
                      title: Text('Maintenance'),
                      onTap: () {
                        Get.to(MaintenancePage());
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      onTap: () {
                        Get.to(LogoutPage());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: Icon(Icons.call),
                      title: Text('Call Center'),
                      onTap: () {
                        Get.to(CallCenterPage());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Log out'),
                      onTap: () {
                        Get.to(LogoutPage());
                      },
                    ),
                  ),
                ],
              ),
            )
          : null,
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              color: drawerColor,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      tileColor: Color(0xffFFD6D0),
                      leading: Icon(
                        Icons.location_on_outlined,
                        color: Color(0xffEE7E62),
                      ),
                      title: Text('Location'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: Icon(
                        Icons.analytics,
                      ),
                      title: Text('Analytics'),
                      onTap: () {
                        Get.to(MaintenancePage());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: Icon(Icons.manage_accounts),
                      title: Text('Manage'),
                      onTap: () {
                        Get.to(MaintenancePage());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: Icon(Icons.people),
                      title: Text('Users'),
                      onTap: () {
                        Get.to(MaintenancePage());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: Icon(Icons.document_scanner),
                      title: Text('Maintenance'),
                      onTap: () {
                        Get.to(MaintenancePage());
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      onTap: () {
                        Get.to(LogoutPage());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: Icon(Icons.call),
                      title: Text('Call Center'),
                      onTap: () {
                        Get.to(CallCenterPage());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Log out'),
                      onTap: () {
                        Get.to(LogoutPage());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!isMobile)
            Flexible(
              flex: 4,
              child: Container(
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
                                    infoWindow:
                                        InfoWindow(title: "Current Location"),
                                  ),
                                ),
                            )
                          : CircularProgressIndicator(),
                    ),
                    Positioned(
                      top: 60,
                      left: 30,
                      child: Container(
                        color: appbarColor,
                        height: 400,
                        width: 300,
                        child: LayoutItems(),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 20,
                      child: Container(
                        color: drawerColor,
                        height: 100,
                        width: 70,
                        child: LayoutIcons(),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 230,
                      bottom: 230,
                      child: Container(
                        color: drawerColor,
                        height: 100,
                        width: 70,
                        child: LayoutIcons1(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
