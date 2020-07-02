import 'package:flutter/material.dart';
import 'package:TCN/tcn_widgets.dart';
import 'package:TCN/screens/services/components/tcn_decorations.dart';


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
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsetsDirectional.only(bottom: 100, top: 40),
              child: Text(
                pageHeader, 
                style: TextStyle(
                  fontFamily: "Roboto", 
                  fontWeight: FontWeight.w300, 
                  fontSize: 28, 
                  color: Colors.white
                ),
              )
            ),
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.95,
                heightFactor: 1,
                child: Container (
                  decoration: TCNDecorations().servicesDecoration(),
                  child: Text("Sunday Morning", textAlign: TextAlign.center),
                )
              ),
            )
          ],
        )
      )
    );
  }
}