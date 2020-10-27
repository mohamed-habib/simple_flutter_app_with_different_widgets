import 'package:flutter/material.dart';
import 'package:test_flutter_app/Screen2.dart';
import 'package:test_flutter_app/WebViewScreen.dart';

import 'Screen0.dart';

class Screen1 extends StatelessWidget {
  String firstName = "Mohamed";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen1'),
      ),
      body: DefaultTabController(
        initialIndex: 3,
        length: 5,
        child: Column(
          children: [
            Container(
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.blue,
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(text: "Home"),
                  Tab(text: "Orders"),
                  Tab(text: "Registration"),
                  Tab(text: "Login"),
                  Tab(text: "History"),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [
                    Container(
                      child: WebViewScreen(),
                    ),
                    Container(
                      child: WebViewScreen(),
                    ),
                    Container(
                      child: WebViewScreen(),
                    ),
                    Container(
                      child: WebViewScreen(),
                    ),
                    Container(
                      child: Screen0(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        backgroundColor: Colors.blue,
        iconSize: 30,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm), title: Text('Alarm')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
      ),
    );
  }
}

// val gestureDetector = GestureDetector(
//   child: Hero(
//     tag: 'imageHero',
//     child: Image(
//       image: AssetImage('images/Vpizza.png'),
//       width: 120,
//       height: 120,
//     ),
//   ),
//   onTap: () {
//     Navigator.push(context, MaterialPageRoute(builder: (_) {
//       return Screen2();
//     }));
//   },
// );

// Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2(firstName: "Mohamed")));

// Navigator.pushNamed(context, '2');
