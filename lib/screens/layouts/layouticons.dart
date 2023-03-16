import 'package:flutter/material.dart';

class LayoutIcons extends StatelessWidget {
  const LayoutIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
