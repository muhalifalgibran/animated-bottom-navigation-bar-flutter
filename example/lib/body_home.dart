import 'package:flutter/material.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _BodyHomeState createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  @override
  void initState() {
    print(widget.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          widget.title,
        ),
      ),
    );
  }
}
