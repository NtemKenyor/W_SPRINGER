//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:W_SPRINGER/clock/clock.dart';
import 'thank_you.dart';
//void main() => runApp(new Home());

class Activities extends StatefulWidget {
  const Activities({Key key}) : super(key: key);

  @override
  _Activities createState() => _Activities();
}
class _Activities extends State<Activities> {
  @override
  
  String dropdownValue = 'Daily';
  String the_litre = '25';

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
      title: 'Carousel For W-SPRINGER',
      home: new Scaffold(
        body: Container(
          color: Colors.orange,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Clock(),
                  ),
                ),
              ),
                  /* List_home("assets/nuesa.jpg", "Nuesa Week", "The faculty of Engineering would be holding her week and other activities there in"),
                  List_home("assets/nuesa.jpg", "Examination", "The date for Exams is 16th march 2020"),
                
 */           Container(
                child: Text("Schedule Water", 
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                ),
              ),
                Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['Daily', 'Weekly', 'Monthly', 'Quaterly']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),

                    /* DropdownButton<String>(
                      value: the_litre,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String hin) {
                        setState(() {
                          the_litre = hin;
                        });
                      },
                      items: <String>['25 litre', '50 litre', '100 litre', '200 litre', '500 litre']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ), */

                    TextField(
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.content_cut),
                        helperText: "How many Litres",
                        hintText: " What is the quanity you need ",
                        hoverColor: Colors.red
                      ),
                    ),

                    /* TextField(
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.content_cut),
                        helperText: " How ma",
                        hintText: "What is the quanity you need",
                        hoverColor: Colors.red
                      ),
                    ), */

                    TextField(
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person_add),
                        helperText: "Example: john P. Hetam",
                        hintText: "What is your Full name",
                        hoverColor: Colors.red
                      ),
                    ),

                    TextField(
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        helperText: "This line would be used to contact you, once this product arrives",
                        hintText: "Enter your Mobile Number",
                        hoverColor: Colors.red
                      ),
                    ),

                    TextField(
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.location_on),
                        helperText: "Please, Why are you right now?",
                        hintText: "What is your Location",
                        hoverColor: Colors.red
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.green,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: FlatButton.icon(    
                          onPressed: () {
                          
                            var route = new MaterialPageRoute(
                              builder: (BuildContext context) =>
                              new Thanks_page(value: "" ),
                            );
                            Navigator.of(context).push(route);
                          },                
                          icon: Icon(Icons.send, color: Colors.black,), 
                          label: Text("Send")
                        ),
                        ),
                      ),
                    ),

                    
                      
                  ]
                ),
              ),
            ],
          ),
        ),
        ),
      );
  }
}
