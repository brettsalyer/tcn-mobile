import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/services': (context) => ServicesPage()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color.fromRGBO(130, 130, 130, 100),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      drawer: NavDrawer(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(50),
              child: Image.asset('images/tcn_logo_white.png',
                  height: 250, width: 275),
            ),

            Container(
              height: 50,
              width: 150,
              child: FlatButton(
                child: Text("Services", style: TextStyle(fontSize: 18.0, color: Colors.white),),
                color: Colors.blue,
        
                onPressed: (){
                  Navigator.pushNamed(context, '/services');
                },
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 150,
              child: DrawerHeader(
                child: Text(""),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  image: DecorationImage(
                    image: ExactAssetImage('images/drawer_tcn_logo_black.png'),
                  ),
                ),
              ),
            ), 
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text("News & Announcements"),
            ),
            ListTile(
              title: Text("Digital Sermons"),
            ),
            ListTile(
              title: Text("Request Prayer"),
            ),
            ListTile(
              title: Text("Contact"),
            ),
            ListTile(
              title: Text("Online Giving"),
            ),
            ListTile(
              title: Text("Sunday Bulletin"),
            ),
          ],
        ),
      );
  }
}

// Page not reachable from the navigation drawer. It is stateless, and can be left by using the 
// Navigation drawer.

// Currently, I am copying and pasting the drawer to each page, 
// but a class should be created so we can keep reusing the drawer as needed.

class ServicesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(130, 130, 130, 100),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: NavDrawer(),
      body: Text("Services listed here")
    );
  }
}