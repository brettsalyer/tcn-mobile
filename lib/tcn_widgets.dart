import 'package:flutter/material.dart';


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