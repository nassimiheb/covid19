import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home_page extends StatefulWidget {
  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  Widget _step0() {
    return Container(
        decoration: new BoxDecoration(
          color: Color(0xFF365F6B),
          borderRadius: new BorderRadius.all(
            const Radius.circular(20.0),
          ),
        ),
        margin: EdgeInsets.fromLTRB(
            16, MediaQuery.of(context).size.height * 0.6, 16, 116),
        height: 50,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.notifications,
                size: 80,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                "NOTIFICATION",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        ));
  }

  Widget _step2() {
    return Container(
        decoration: new BoxDecoration(
          color: Color(0xFF365F6B),
          borderRadius: new BorderRadius.all(
            const Radius.circular(20.0),
          ),
        ),
        margin: EdgeInsets.fromLTRB(
            16, MediaQuery.of(context).size.height * 0.6, 16, 116),
        height: 50,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 80,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                "PROFILE",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        ));
  }

  Widget _step1() {
    return Container(
        decoration: new BoxDecoration(
          color: Color(0xFF93FFBF),
          borderRadius: new BorderRadius.all(
            const Radius.circular(20.0),
          ),
        ),
        margin: EdgeInsets.fromLTRB(
            16, MediaQuery.of(context).size.height * 0.6, 16, 116),
        height: 50,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.play_circle_outline,
                size: 90,
                color: Color(0xFF00C3B6),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "COMMENCER",
                style: TextStyle(color: Color(0xFF00C3B6), fontSize: 18),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> steps = [
      _step0(),
      _step1(),
      _step2(),
    ];
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: Stack(
          children: <Widget>[
            FittedBox(
                child: Image.asset('assets/background_home.png'),
                fit: BoxFit.cover),
            Positioned(
              height: MediaQuery.of(context).size.height * 0.4,
              left: -MediaQuery.of(context).size.height * 0.4,
           child:Image.asset('assets/corona.png',color:Color(0xFF032833).withOpacity(0.5),colorBlendMode:BlendMode.luminosity),
             
            ),
            Positioned(
              height: MediaQuery.of(context).size.height * 0.7,
              right: -MediaQuery.of(context).size.height * 0.5,
              child: Image.asset('assets/shape.png'),
            ),
            Swiper(
              index: 1,
              loop: false,
              itemBuilder: (BuildContext context, int index) {
                return steps[index];
              },
              itemCount: steps.length,
              viewportFraction: 0.55,
              scale: 0.95,
            ),
          ],
        )));
  }
}
