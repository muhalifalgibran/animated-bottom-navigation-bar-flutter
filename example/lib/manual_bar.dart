import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ManualBar extends StatefulWidget {
  const ManualBar({Key? key}) : super(key: key);

  @override
  _ManualBarState createState() => _ManualBarState();
}

class _ManualBarState extends State<ManualBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Text(
              'text text text text text text text text text text text text text text text text text text text text ');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(top: 20),
        child: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 20,
        color: Colors.blue,
        child: Container(
          height: 60,
        ),
      ),
    );
  }
}
