import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'nuesa_home_model.dart';
import 'package:W_SPRINGER/thank_you.dart';

class SecondScreen extends StatefulWidget {
  final Nuesa_news value;

  SecondScreen({Key key, this.value}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('News Details Page')),
      body: new Container(
        child: new Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                child: new Text(
                  'TITLE : ${widget.value.title}',
                  style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                //`widget` is the current configuration. A State object's configuration
                //is the corresponding StatefulWidget instance.
                child: Image.network('${widget.value.imageUrl}'),
                padding: EdgeInsets.all(12.0),
              ),
              Padding(
                child: new Text(
                  'TITLE : ${widget.value.para1}',
                  style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              Padding(
                child: new Text(
                  'DESC: ${widget.value.full}',
                  style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),

              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text("Please Fill the Form Below",
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
                ),
              ),

              Container(
                height: 130,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
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
              ) 
            ],
          ),
        ),
      ),
    );
  }
}
