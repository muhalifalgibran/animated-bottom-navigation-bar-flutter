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
      child: ListView(
        children: [
          Center(
            child: Text(
              widget.title,
            ),
          ),
          ...List.generate(
            10,
            (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 60,
              width: double.infinity,
              color: index.isEven ? Colors.blue : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
