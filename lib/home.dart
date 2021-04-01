import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:W_SPRINGER/activities.dart';
import 'homePage_nuesa/homePage_nuesa.dart';

//import 'package:nuesa_app/firebase_notification_handler.dart';
class MyAppHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'W-SPRINGER',
      theme: ThemeData(
        primaryColor: Color(0xFF3eBACE),
        accentColor: Color(0xFFDBECF1),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: MyHomePage(title: 'THE W-SPRINGER APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold,  color: Colors.white
  );

  static List <Widget> _widgetOptions = <Widget> [
    nuesa_news(),
    //nuesa_leaders(),
    //Dues_payment(),
    Activities()
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      //_counter++;
    });
  }

  @override
  void initState(){
    super.initState();
    //FirebaseMessaging.initializeApp(this);
    //new FirebaseNotifications().setUpFirebase();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),

      bottomNavigationBar:  BottomNavigationBar(
        backgroundColor: Colors.blue[800],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(45, 56, 123, 1.0),
            title: Text("Home"),
            icon: Icon(
                Icons.home,
                size: 20
            ),
          ),

          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(45, 56, 123, 1.0),
            title: Text("Activities"),
            icon: Icon(
                Icons.alarm,
                size: 20
            ),
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.

  }

}