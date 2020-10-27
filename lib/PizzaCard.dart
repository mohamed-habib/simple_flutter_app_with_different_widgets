import 'package:flutter/material.dart';

class PizzaCard extends StatelessWidget {
  String imageName;
  String text;
  Color cardColor = Colors.deepOrangeAccent;

  // PizzaCard(this.text, this.imageName);

  PizzaCard(this.text, this.imageName, {this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10.0),
      color: cardColor,
      elevation: 20.0,
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage(imageName),
            width: 100.0,
            height: 100.0,
          ),
          SizedBox(width: 20.0),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
