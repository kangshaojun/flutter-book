import 'package:flutter/material.dart';



void main() {
  runApp(
      new MaterialApp(
        title: 'Container demo',
        home: new ContainerDemo(),
      )
  );
}

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(

      child: new Container(
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(
              color: Colors.green,
              width: 8.0,
            ),
            borderRadius: const BorderRadius.all(const  Radius.circular(48.0))
        ),
        child: new Text(
          'Flutter',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}