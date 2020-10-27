import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  String firstName = "";

  Screen2({Key key, this.firstName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(firstName),

        ),
        body: GestureDetector(
          child: Hero(
            tag: 'imageHero',
            child: Image(
              image: AssetImage('images/Vpizza.png'),
              width: 400,
              height: 400,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ));
  }
}
