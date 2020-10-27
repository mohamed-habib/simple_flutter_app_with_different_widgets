import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'PizzaCard.dart';
import 'Screen1.dart';

class Screen0 extends StatefulWidget {
  @override
  _Screen0State createState() => _Screen0State();
}

var dropDownItems = ["Cairo", "Alex", "NewYork"];
var selectedValue = dropDownItems[0];
String webViewMenuItemString = "WebView";

var popupMenuItems = ["Call us", "Settings", "Logout", webViewMenuItemString];

class _Screen0State extends State<Screen0> {
  int counter = 0;

  Future<Null> selectDate(BuildContext context) async {
    DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime(2050));

    setState(() {
      selectedDateValue =
          "${selectedDate.year} -  ${selectedDate.month}  - ${selectedDate.day}";
    });
  }

  Future<Null> selectTime(BuildContext context) async {
    TimeOfDay selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    setState(() {
      selectedTimeValue = "${selectedTime.hour}:${selectedTime.minute}";
    });
  }

  String selectedDateValue = "";
  String selectedTimeValue = "";

  var rating = 0.0;
  var switchValue = false;

  @override
  void initState() {
    super.initState();
    _showPersistentSheet = _showPersistentBottomSheet;
  }

  _showSnackBar() {
    var snackbar = SnackBar(
      content: Row(
        children: [
          SizedBox(
            child: Text('This is a snackbar'),
          ),
          Icon(Icons.account_balance)
        ],
      ),
      duration: Duration(seconds: 4),
      backgroundColor: Colors.blue,
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  VoidCallback _showPersistentSheet;

  String fullName;
  String enteredText;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            key: _scaffoldKey,
            appBar: appBar,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {

                //navigate to screen 1
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen1()));
                // Navigator.pushNamed(context, "1");
                Navigator.pushNamed(context, "webView");

                setState(() {
                  stringList.add(enteredText);
                });
              }
              // _showSnackBar
              //     () {
              //   // Navigator.pushNamed(context, '1');
              //   // Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1()));
              //   print("Button Clicked");
              // }
              ,
            ),
            body: Column(
              children: [
                ButtonBar(alignment:MainAxisAlignment.spaceAround, children: [FlatButton(), FlatButton(), ],),
                SizedBox(
                  child: TextField(
                    onChanged: (text) {
                      enteredText = text;
                    },
                  ),
                  width: 100,
                ),
                RaisedButton(
                  child: Text("Add to list"),
                  onPressed: () {
                    setState(() {
                      stringList.add(enteredText);
                    });
                  },
                ),
                Expanded(
                  child: ListView(
                      children: stringList
                          .map((str) => Text(
                                str,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ))
                          .toList()),
                ),
              ],
            )));
  }

  //var textFields =  Column(children: [
  // Row(
  // children: [
  // Text('Full Name: '),
  // SizedBox(child: TextField(onChanged: (text) {
  // setState(() {
  // fullName = text;
  // });
  // },), width: 200),
  // ],
  // ),
  // Row(
  // children: [
  // Text('Email Address:'),
  // SizedBox(
  // width: 200,
  // child: TextField(onChanged: (text){   },
  // decoration: InputDecoration(
  // icon: Icon(Icons.email),
  // hintText: "Enter email here"),
  // keyboardType: TextInputType.emailAddress,
  // ),
  // )
  // ],
  // ),
  // Row(
  // children: [
  // Text('Password'),
  // SizedBox(
  // width: 200,
  // child: TextField(
  // obscureText: true,
  // ),
  // )
  // ],
  // ),
  // Row(
  // children: [
  // Text('phone'),
  // SizedBox(
  // width: 200,
  // child: TextField(
  // keyboardType: TextInputType.phone,
  // ),
  // )
  // ],
  // ),
  // Text("Your Name is: $fullName")
  // ])
  // var stack =  Stack(
  //   children: [
  //     Positioned(
  //       child: Container(
  //         color: Colors.amber,
  //         width: 100,
  //         height: 100,
  //       ),
  //       top: 150,
  //       right: 50,
  //     ),
  //     Positioned(
  //       child: Container(color: Colors.black, width: 40, height: 40),
  //       top: 0,
  //       left: 0,
  //     ),
  //     Positioned(
  //       top: 150,
  //       right: 100,
  //       child: Container(
  //         color: Colors.green,
  //         width: 100,
  //         height: 100,
  //       ),
  //     )
  //   ],
  // )

  var stringList = [
    "Mohamed",
    "Ahmed",
    "Alaa",
    "Mahmoud",
    "Youssef",
  ];

  addNewUser(user) {
    stringList.add(user);
  }

  var carData = [
    Car(carMake: "BMW", model: "2010", price: 5000),
    Car(carMake: "Mercedes", model: "2010", price: 6000),
    Car(carMake: "Lada", model: "2020", price: 3000),
    Car(carMake: "BMW", model: "2010", price: 5000),
    Car(carMake: "BMW", model: "2011", price: 5300),
  ];

  // var listView = ListView(
  //     children: pizzaItemArray
  //         .map((pizzaItem) =>
  //         PizzaCard(
  //           pizzaItem.text,
  //           pizzaItem.image,
  //           cardColor: Colors.green,
  //         ))
  //         .toList());

  _showPersistentBottomSheet() {
    setState(() {
      _showPersistentSheet = null;
    });
    _scaffoldKey.currentState
        .showBottomSheet((context) {
          return Container(
            color: Colors.blue,
            height: 200,
            child: Text(
              'Welcome to persistent Bottom Sheet',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showPersistentSheet = _showPersistentBottomSheet;
            });
          }
        });
  }
}

testMap() {
  List<String> stringArray = ["1", "2", "3", "4"];

  List<int> integerArray =
      stringArray.map((String str) => int.parse(str)).toList();
}

_showBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
            height: 100,
            child: Text('This is a modal bottom sheet'),
          ));
}

showConfirmationDialog(BuildContext context) {
  //CupertinoAlertDialog()
  var alertDialog = AlertDialog(
      title: Text('Are you sure ?'),
      content: Text('this is a confirmation dialog'),
      actions: [
        RaisedButton(
          child: Text('Yes'),
          onPressed: () {
            print("Yes is selected");
            SystemNavigator.pop();
          },
        ),
        RaisedButton(
          child: Text('No'),
          onPressed: () {},
        )
      ]);

  showDialog(context: context, builder: (BuildContext context) => alertDialog);
}

var appBar = AppBar(
  title: Row(
    children: [
      Text("My App is Stateless Widget"),
      SizedBox(
        width: 30,
      )
    ],
  ),
  actions: [
    PopupMenuButton(
        onSelected: (selectedItem) {
          if (selectedItem == webViewMenuItemString) {}

          print("$selectedItem is selected");
        },
        itemBuilder: (BuildContext context) => popupMenuItems
            .map((menuItem) => PopupMenuItem(
                  child: Text(menuItem),
                  value: menuItem,
                ))
            .toList())
  ],
);

var _myItems = [
  MyItem(header: 'Header1', body: 'Body1'),
  MyItem(header: 'Header2', body: 'Body2'),
  MyItem(header: 'Header3', body: 'Body3'),
  MyItem(header: 'Header4', body: 'Body4'),
];

var pizzaItemArray = [
  PizzaItem("My Vegetables Pizza", "images/Vpizza.png"),
  PizzaItem("My Cheese Pizza", "images/CPizza.png"),
  PizzaItem("My Cheese Pizza", "images/CPizza.png"),
  PizzaItem("Fries", "images/Fries.png")
];

// var drawerListView = ListView(
//   children: [
//     Container(
//       height: 50,
//       child: DrawerHeader(
//         child: Text('Welcome to my drawer'),
//         margin: EdgeInsets.all(2),
//         padding: EdgeInsets.all(2),
//       ),
//     ),
//     ListTile(
//       leading: Icon(Icons.phone),
//       title: Text("Main Title"),
//       subtitle: Text("Sub title"),
//       trailing: Icon(Icons.shop),
//       onTap: () {
//         Navigator.pushNamed(context, '1');
//       },
//       onLongPress: () {
//         print('Tile 1 was long pressed');
//       },
//     ),
//     ListTile(
//       leading: Icon(Icons.phone),
//       title: Text("Main Title"),
//       subtitle: Text("Sub title"),
//       trailing: Icon(Icons.shop),
//       onTap: () {
//         Navigator.pushNamed(context, '2');
//       },
//     ),
//     ListTile(
//       leading: Icon(Icons.phone),
//       title: Text("Main Title"),
//       subtitle: Text("Sub title"),
//       trailing: Icon(Icons.shop),
//       onTap: () {
//         print('Tile 2 was clicked');
//       },
//     ),
//     ListTile(
//       leading: Icon(Icons.phone),
//       title: Text("Main Title"),
//       subtitle: Text("Sub title"),
//       trailing: Icon(Icons.shop),
//       onTap: () {
//         print('Tile 2 was clicked');
//       },
//     ),
//     ListTile(
//       leading: Icon(Icons.phone),
//       title: Text("Main Title"),
//       subtitle: Text("Sub title"),
//       trailing: Icon(Icons.shop),
//       onTap: () {
//         print('Tile 2 was clicked');
//       },
//     ),
//     ListTile(
//       leading: Icon(Icons.phone),
//       title: Text("Main Title"),
//       subtitle: Text("Sub title"),
//       trailing: Icon(Icons.shop),
//       onTap: () {
//         print('Tile 2 was clicked');
//       },
//     ),
//     ListTile(
//       leading: Icon(Icons.phone),
//       title: Text("Main Title"),
//       subtitle: Text("Sub title"),
//       trailing: Icon(Icons.shop),
//       onTap: () {
//         print('Tile 2 was clicked');
//       },
//     ),
//     ListTile(
//       leading: Icon(Icons.phone),
//       title: Text("Main Title"),
//       subtitle: Text("Sub title"),
//       trailing: Icon(Icons.shop),
//       onTap: () {
//         print('Tile 2 was clicked');
//       },
//     ),
//     ListTile(
//       leading: Icon(Icons.phone),
//       title: Text("Main Title"),
//       subtitle: Text("Sub title"),
//       trailing: Icon(Icons.shop),
//       onTap: () {
//         print('Tile 2 was clicked');
//       },
//     ),
//     ListTile(
//       leading: Icon(Icons.phone),
//       title: Text("Main Title"),
//       subtitle: Text("Sub title"),
//       trailing: Icon(Icons.shop),
//       onTap: () {
//         print('Tile 2 was clicked');
//       },
//     ),
//     ListTile(
//       leading: Icon(Icons.phone),
//       title: Text("Main Title"),
//       subtitle: Text("Sub title"),
//       trailing: Icon(Icons.shop),
//       onTap: () {
//         print('Tile 2 was clicked');
//       },
//     ),
//     ListTile(
//       leading: Icon(Icons.phone),
//       title: Text("Main Title"),
//       subtitle: Text("Sub title"),
//       trailing: Icon(Icons.shop),
//       onTap: () {
//         print('Tile 2 was clicked');
//       },
//     ),
//   ],
// ));

// var checkBoxAndRadioGroup = Column(
//   children: [
//     Padding(
//       padding: EdgeInsets.all(15),
//       child: Column(
//         children: [
//           SizedBox(height: 50, child: Text('Please choose from below:')),
//           CheckboxGroup(
//             labels: ["A", "B", "C", "D"],
//             onSelected: (checked) {
//               print(checked.toString());
//             },
//           ),
//           SizedBox(height: 50, child: Text('Please choose from below:')),
//           RadioButtonGroup(
//             labels: ["1", "2", "3", "4"],
//             onSelected: (checked) {
//               print(checked.toString());
//             },
//           )
//         ],
//       ),
//     )
//   ],
// );

// var textFields = [  Row(
//   children: [
//     Text('Full Name: '),
//     SizedBox(child: TextField(), width: 200),
//   ],
// ),
//   Row(
//     children: [
//       Text('Email Address:'),
//       SizedBox(
//         width: 200,
//         child: TextField(
//           decoration: InputDecoration(
//               icon: Icon(Icons.email), hintText: "Enter email here"),
//           keyboardType: TextInputType.emailAddress,
//         ),
//       )
//     ],
//   ),
//   Row(
//     children: [
//       Text('Password'),
//       SizedBox(
//         width: 200,
//         child: TextField(
//           obscureText: true,
//         ),
//       )
//     ],
//   ),
//   Row(
//     children: [
//       Text('phone'),
//       SizedBox(
//         width: 200,
//         child: TextField(
//           keyboardType: TextInputType.phone,
//         ),
//       )
//     ],
//   ),];
//
// var stack =  Stack(
//   children: [
//     Positioned(
//       child: Container(
//         color: Colors.amber,
//         width: 100,
//         height: 100,
//       ),
//       top: 150,
//       right: 50,
//     ),
//     Positioned(
//       child: Container(color: Colors.black, width: 40, height: 40),
//       top: 0,
//       left: 0,
//     ),
//     Positioned(
//       top: 150,
//       right: 100,
//       child: Container(
//         color: Colors.green,
//         width: 100,
//         height: 100,
//       ),
//     )
//   ],
// );

// var selectableText = SelectableText(
//   'This is a selectable text, you can select and copy paste whatever you want.',
//   showCursor: true,
//   cursorWidth: 20,
//   cursorColor: Colors.amber,
//   style: TextStyle(fontSize: 50),
// );
// var carData = [
//   Car(carMake: "Honda", model: "2010", price: 5000),
//   Car(carMake: "Kia", model: "2012", price: 8000),
//   Car(carMake: "BMW", model: "2011", price: 7000),
// ];

// var dropDownButton = DropdownButton<String>(
//   value: selectedValue,
//   onChanged: (String selectedItem) {
//     print("Welcome to $selectedItem");
//     setState(() {
//       selectedValue = selectedItem;
//     });
//   },
//   items: dropDownItems
//       .map((String item) =>
//       DropdownMenuItem<String>(child: Text(item), value: item))
//       .toList(),
// );
// var dataTable = DataTable(
// sortColumnIndex: 2,
// sortAscending: false,
// columns: [
// DataColumn(
// label: Text('Car Make'),
// numeric: false,
// onSort: (i, b) {
// setState(() {
// carData
//     .sort((a, b) => a.carMake.compareTo(b.carMake));
// });
// }),
// DataColumn(
// label: Text('Model'),
// numeric: false,
// onSort: (i, b) {
// setState(() {
// carData.sort((a, b) => a.model.compareTo(b.model));
// });
// }),
// DataColumn(
// label: Text('Price'),
// numeric: true,
// onSort: (i, b) {
// setState(() {
// carData.sort((a, b) => a.price.compareTo(b.price));
// });
// })
// ],
// rows: carData.map((car) {
// return DataRow(cells: [
// DataCell(Text(car.carMake)),
// DataCell(Text(car.model)),
// DataCell(Text(car.price.toString())),
// ]);
// }).toList())

var cards = Column(
  children: [
    Card(
      margin: EdgeInsets.all(10),
      color: Colors.orange,
      //column1, Vegetables Pizza Card
      child: Row(
        children: [
          Image(
            image: AssetImage('images/Vpizza.png'),
            width: 100,
            height: 100,
          ),
          SizedBox(width: 20),
          Text(
            'Vegetables Pizza',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
    Card(
      margin: EdgeInsets.all(10),
      color: Colors.orange,
      //column1, Vegetables Pizza Card
      child: Row(
        children: [
          Image(
            image: AssetImage('images/flag.png'),
            width: 100,
            height: 100,
          ),
          SizedBox(width: 20),
          Text(
            'Fries',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
    Card(
      margin: EdgeInsets.all(10),
      color: Colors.orange,
      //column1, Vegetables Pizza Card
      child: Row(
        children: [
          Image(
            image: AssetImage('images/flag.png'),
            width: 100,
            height: 100,
          ),
          SizedBox(width: 20),
          Text(
            'Cheese Pizza',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  ],
);

void abc() {
  Car(carMake: 'avc');
}

class MyItem {
  String header;
  String body;
  bool isExpanded;

  MyItem({this.header, this.body, this.isExpanded: false});
}

class Car {
  String carMake;
  String model;
  double price;

  Car({this.carMake, this.model, this.price});
}

class PizzaItem {
  String text;
  String image;

  PizzaItem(this.text, this.image);
}
