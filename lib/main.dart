import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_app/Screen0.dart';
import 'package:test_flutter_app/Screen2.dart';
import 'package:test_flutter_app/WebViewScreen.dart';

import 'Screen1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static String WEB_VIEW_KEY = 'webView';
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen0(),
      routes: {
        '1': ((context) => Screen1()),
        '2': ((context) => Screen2()),
        'webView': ((context) => WebViewScreen())
      },
    );
  }
}
// Student student = Student('Mohamed', (String) {
//   print("Hello Mohamed");
// });
//   Student(String name, Null Function(String) param1) {
//     param1("");
//   }
// }

// class Student {

// val buttonBar = ButtonBar(
//   alignment: MainAxisAlignment.spaceAround,
//   children: [
//     FlatButton(
//       color: Colors.green,
//       splashColor: Colors.blue,
//       onPressed: () {},
//       child: Text('Flat Button'),
//     ),
//     OutlineButton(
//       child: Text('Outline Button'),
//       shape: StadiumBorder(),
//       highlightedBorderColor: Colors.blue,
//       onPressed: () {},
//     ),
//     FlatButton(
//       color: Colors.green,
//       splashColor: Colors.blue,
//       onPressed: () {},
//       child: Text('Flat Button'),
//     )
//   ],
// );

// val iconButton = IconButton(
//   icon: Icon(Icons.call),
//   onPressed: () {},
//   tooltip: 'Call icon button',
// );

// val cardExample = Card(
//   color: Colors.amber,
//   child: Row(
//     children: [
//       Image(image: AssetImage('images/flag.png'), width: 50, height: 50),
//       Text(
//         'This is a flag',
//         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 30),
//       )
//     ],
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//   ),
// );

// val alignmentColumn = Column(children: [Text('ABC') , Text('DEF'), Text('GHI'), Text('JKL'), ],
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,)

// val safeArea = SafeArea(
//     child: Padding(
//       padding: const EdgeInsets.all(9),
//       child: Container(
//         child: Text('Flutter App'),
//         alignment: Alignment.topRight,
//         padding: EdgeInsets.fromLTRB(0, 12, 12, 9),
//       ),
//     ));

// runApp(MaterialApp(
//     home: Scaffold(
//         // appBar: AppBar(
//         //   title: Text('My first app'),
//         //   backgroundColor: Colors.green[200],
//         //   centerTitle: true,
//         // ),
//         body: SafeArea(
//             child: Column(children: [
//   Row(
//     children: [
//       Text("Text 1"),
//       Text("Text 2"),
//     ],
//   ),
//   Icon(
//     Icons.android,
//     size: 50,
//     color: Colors.green,
//   ),
//   Image(
//     image: AssetImage('images/flag.png'),//add to pubspec.yaml and upgrade.
//     width: 50,
//     height: 50,
//   ),
//   Text("Text 3"),
//   Container(
//     child: Text("Text in container"),
//     color: Colors.grey,
//     margin: EdgeInsets.all(10),
//   )
// ])))));
