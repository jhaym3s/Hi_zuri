import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Portfolio(title: 'Portfolio'),
    );
  }
}

class Portfolio extends StatefulWidget {
  Portfolio({this.title});

  final String title;
  @override
  _PortfolioState createState() => _PortfolioState();
}
Widget circleStuffs(double radiusSize, {String imageLink}){
  return CircleAvatar(
    radius: radiusSize,
    backgroundImage: AssetImage("$imageLink"),
  );
}
Widget links(String title,String URI){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap:()=> _launchURL(URI),
      child: Column(
        children: [
          circleStuffs(24),
          Text(title)
        ],
      ),
    ),
  );
}
final String githubURI = "https://github.com/jhaymesdev";
final String twitterURI = "https://twitter.com/manniikin";
final String dashboardURI = "https://i4g.zuriboard.com/dashboard";
_launchURL(url) async {
  //const url = 'https://google.com';
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}
class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: deviceSize.height,
              width: deviceSize.width,
              color: Colors.white,
              child: SafeArea(child:
              Column(
                children: [
                  circleStuffs(45,imageLink:"asset/image/face.jpeg"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  links("github",githubURI),
                  links("Twitter",twitterURI),
                  links("DashBoard",dashboardURI),
                    ],
                  )
                ],
              )),
            ),
            Container(
              decoration: BoxDecoration(
              color:Colors.purple ,
                  borderRadius: BorderRadius.only(topRight:Radius.circular(25),topLeft:Radius.circular(25) ),
              ),
              height: deviceSize.height/1.4,
              width: deviceSize.width,
              child: Center(child: Text("*Some interesting things about me*\nEnough aesthetics Yeah?",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
            ),
          ],
        ),
      ),
    );
  }
}
