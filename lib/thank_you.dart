import 'package:flutter/material.dart';

class Thanks_page extends StatefulWidget {
  //const Thanks_page({Key key}) : super(key: key);
  final String value;

  Thanks_page({Key key, this.value}) : super(key: key);

  @override
  Thanks_page__ createState() => Thanks_page__();
}


class Thanks_page__ extends State<Thanks_page> {
  @override
  
  String dropdownValue = 'Daily';

  Container List_home (String Image_location, String headings, String sub_headings) {
    return Container(
      //width: double.infinity,
        child: Card(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  title: Text(headings),
                  subtitle: Text(sub_headings),
                ),
                Image.asset(Image_location, height: 200, width: double.infinity*0.3,),
              ],
            )
        )
    );
  }
  static var picture_timer = Duration(seconds: 8);
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Thanks for Using W-springer',
      home: new Scaffold(
        body: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.sentiment_very_satisfied, size: 60, color:Colors.green,),
                    ),
                    Text(" We would deliver clean water to the Address you provided Above.",
                      style: TextStyle(fontSize: 18, fontFamily:"arial"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Thank you...",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                )
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
