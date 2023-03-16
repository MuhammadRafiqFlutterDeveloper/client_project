import 'package:flutter/material.dart';

import 'layouthome.dart';

class LayoutItems extends StatelessWidget {
  const LayoutItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 28.0, vertical: 29),
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
          padding: EdgeInsets.symmetric(
              horizontal: 15.0, vertical: 5),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
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
          padding: EdgeInsets.symmetric(
              horizontal: 15.0, vertical: 5),
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
    );
  }
}
