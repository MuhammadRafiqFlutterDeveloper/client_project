import 'package:flutter/material.dart';

class LayoutIcons1 extends StatelessWidget {
  const LayoutIcons1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
