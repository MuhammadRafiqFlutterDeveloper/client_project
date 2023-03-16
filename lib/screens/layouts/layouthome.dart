import 'package:flutter/material.dart';

class LayoutHome extends StatefulWidget {
  @override
  State<LayoutHome> createState() => _LayoutHomeState();
}

class _LayoutHomeState extends State<LayoutHome> {
  bool _isChecked = false;

  final GlobalKey _key = GlobalKey();

  void _showPopup() {
    final RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy + size.height, offset.dx + size.width, offset.dy + size.height * 2),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text('User Details'),
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.email),
            title: Text('user@example.com'),
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.phone),
            title: Text('1234567890'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      child: CheckboxListTile(
        key: _key,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          'Name',
          style: TextStyle(color: Colors.black),
        ),
        value: _isChecked,
        secondary: Container(
          width: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '45 Km/h',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.circle,
                  color: Colors.green,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: PopupMenuButton(
                  icon: Icon(Icons.keyboard_control, color: Colors.black),
                  itemBuilder: (_) => [
                    PopupMenuItem(child: Text('Playback')),
                    PopupMenuItem(child: Text('Tracking')),
                    PopupMenuItem(child: Text('Command')),
                    PopupMenuItem(child: Text('Details')),
                    PopupMenuItem(child: Text('Transfer')),
                    PopupMenuItem(child: Text('View Report')),
                  ],
                ),
              ),
            ],
          ),
        ),
        onChanged: (value) {
          setState(() {
            _isChecked = value!;
            _showPopup;
          });
        },
      ),
    );
  }
}
