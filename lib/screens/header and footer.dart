import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:precises/screens/home_screen.dart';
import 'package:precises/screens/screens.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffF5F5F5),
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      centerTitle: true,
      title: Row(
        children: [
          Flexible(
            child: Container(
              margin: EdgeInsets.all(10),
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
              margin: EdgeInsets.all(10),
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
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            children: [
              Text('Off', style: TextStyle(color: Colors.black),),
              Icon(
                Icons.sunny,color: Colors.black,
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
          icon: Icon(Icons.language_outlined, color: Colors.black),
          itemBuilder: (_) => [
            PopupMenuItem(child: Text('English')),
            PopupMenuItem(child: Text('Spanish')),
            PopupMenuItem(child: Text('French')),
          ],
        ),
        SizedBox(width: 10),
        Row(
          children: [
            Text(
              'Scot',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/image/img_2.png'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class AppDrawer extends StatelessWidget {
  const AppDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              color: Color(0xffFFF5F5),
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
                Get.to(HomePage());
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
    );
  }
}
