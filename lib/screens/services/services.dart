import 'package:flutter/material.dart';
import 'package:TCN/tcn_widgets.dart';
import 'package:TCN/screens/services/components/tcn_decorations.dart';
import 'package:TCN/screens/services/livestream.dart';

// Page not reachable from the navigation drawer. It is stateless, and can be left by using the 
// Navigation drawer.

// Currently, I am copying and pasting the drawer to each page, 
// but a class should be created so we can keep reusing the drawer as needed.

class ServicesPage extends StatelessWidget{

  final String pageHeader = "Services";
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromRGBO(130, 130, 130, 100),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          pageHeader,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w100,
            fontSize: 28,
          ),
        ),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.95,
                heightFactor: 0.8,
                child: Container (
                  decoration: TCNDecorations().servicesDecoration(),
                  padding: EdgeInsets.only(top: 25, bottom: 25,),
                  child: Column(
                    children: <Widget>[
                      
                      Padding(
                        padding: EdgeInsets.only(top: 25, bottom:20),
                        child: Text(
                          "Sunday Morning", 
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom:10),
                        child: Text(
                          "Worship begins at 10:40 AM", 
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom:10),
                        child: Text(
                          "Sermon Immediately Following", 
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom:50),
                        child: FlatButton(
                          child: Text("View Live", style: TextStyle(color: Colors.white,),),
                          color: Colors.blue,
                          // Use the URL Plugin to launch the stream through YouTube (if desired)
                          onPressed: () {
                            LiveStream().launchLivestreamYoutube();
                          }
                        )
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 25, bottom:20),
                        child: Text(
                          "Sunday Evening", 
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom:10),
                        child: Text(
                          "Worship begins at 6:00 PM", 
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom:10),
                        child: Text(
                          "Sermon Immediately Following", 
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom:40),
                        child: FlatButton(
                          child: Text("View Live", style: TextStyle(color: Colors.white,),),
                          color: Colors.blue,
                          // Use the URL Plugin to launch the stream through YouTube (if desired)
                          onPressed: () {
                            LiveStream().launchLivestreamYoutube();
                          },
                        )
                      ),

                    ],
                  )
                )
              ),
            )
          ],
        )
      )
    );
  }
}