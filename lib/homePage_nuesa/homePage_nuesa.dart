import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'details_onNusea_news.dart';
import 'nuesa_home_model.dart';
import 'dart:convert';
import 'package:carousel_pro/carousel_pro.dart';


class CustomListView extends StatelessWidget {
  final List<Nuesa_news> spacecrafts;

  CustomListView(this.spacecrafts);

  static var picture_timer = Duration(seconds: 8);
  Widget testBGCarousel = new Container(
    child: new Carousel(
      images: [
        new AssetImage('assets/ani_2.gif'),
        new AssetImage('assets/pic_2.jpg'),
        //new AssetImage('assets/pic_3.jpg'),
        new AssetImage('assets/pic_4.jpg'),
        new AssetImage('assets/pic_6.jpg'),
      ],
      autoplayDuration: picture_timer,
      animationCurve: Curves.easeInOutExpo,
      dotSize: 3.0,
      dotSpacing: 12.0,
      dotColor: Colors.lightGreenAccent,
      indicatorBgPadding: 2.0,
      dotBgColor: Colors.blueAccent.withOpacity(0.5),
      borderRadius: true,
      boxFit: BoxFit.cover,

    ),
  );


  Widget build(context) {
    return ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.black,
            child: new Stack (
                children: <Widget>[
                  new PageView(
                    children: [testBGCarousel],
                  ),
                  new Text('Get Purified water from any corner.',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)
                  ),
                ]
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 2.0,),
              child: Text("Get Water",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)
              ),
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: spacecrafts.length,
            itemBuilder: (context, int currentIndex) {
              return List_home(spacecrafts[currentIndex], context);
            },
          )
        ]
    );

    /* return ListView.builder(
      itemCount: spacecrafts.length,
      itemBuilder: (context, int currentIndex) {
        return List_home(spacecrafts[currentIndex], context);
      },
    );*/
  }

  Widget List_home (Nuesa_news nuesa_news, BuildContext context) {
    return InkWell(
      hoverColor: Colors.orange,
      onTap: () {
        //We start by creating a Page Route.
        //A MaterialPageRoute is a modal route that replaces the entire
        //screen with a platform-adaptive transition.
        var route = new MaterialPageRoute(
          builder: (BuildContext context) =>
          new SecondScreen(value: nuesa_news),
        );
        //A Navigator is a widget that manages a set of child widgets with
        //stack discipline.It allows us navigate pages.
        Navigator.of(context).push(route);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.black,
          child: Card(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(nuesa_news.imageUrl, height: 100, width: 100),
                          ),
                          Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Flexible(child: Text(nuesa_news.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),)),
                                  Flexible(child: Text(nuesa_news.para1)),
                                ]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }

}

//Future is n object representing a delayed computation.
Future<List<Nuesa_news>> downloadJSON() async {
  final jsonEndpoint =
      "https://a1in1.com/w_springer";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List nuesa_news = json.decode(response.body);
    return nuesa_news
        .map((nuesa_news) => new Nuesa_news.fromJson(nuesa_news))
        .toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}


class nuesa_news extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Color(0xFFDBECF1),
        scaffoldBackgroundColor: Colors.black45,
      ),
      home: new Scaffold(
        //appBar: new AppBar(title: const Text('MySQL Images Text')),
        body: new Center(
          //FutureBuilder is a widget that builds itself based on the latest snapshot
          // of interaction with a Future.
          child: new FutureBuilder<List<Nuesa_news>>(
            future: downloadJSON(),
            //we pass a BuildContext and an AsyncSnapshot object which is an
            //Immutable representation of the most recent interaction with
            //an asynchronous computation.
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Nuesa_news> spacecrafts = snapshot.data;
                return Container(
                    color: Colors.black,
                    child: new CustomListView(spacecrafts));
              } else if (snapshot.hasError) {
                return new Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/peas-nointernet.gif"), fit: BoxFit.fill)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Look'+"'s"+ ' Like You do not have an Internat connection- Nuesa-Bot',
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)
                          ),
                        ),
                    ],
                  ),
                );
              }
              //return  a circular progress indicator.
              return new Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/ani_2.gif"), fit: BoxFit.fill)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 2),
                  child: Text("Loading...", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20,),),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
//end

