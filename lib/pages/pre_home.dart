import 'dart:async';

import 'package:covid19/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Pre_home extends StatefulWidget {
  @override
  _Pre_homeState createState() => _Pre_homeState();
}

class _Pre_homeState extends State<Pre_home> {
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        FittedBox(
            child: Image.asset('assets/background_home.png'), fit: BoxFit.fill),
        Positioned(
          height: MediaQuery.of(context).size.height * 0.8,
          right: -MediaQuery.of(context).size.height * 0.6,
          child: Image.asset('assets/shape.png'),
        ),
Positioned(bottom: MediaQuery.of(context).size.height * 0.2,
  left: MediaQuery.of(context).size.width * 0.3 ,
                 child:Align(
                  alignment: Alignment.bottomCenter,
                  child:  
                  Column(children: <Widget>[
                    
                     SpinKitFadingCircle(
            color: Colors.white,
            size: 50.0,
          ),
          SizedBox(height: 20,),
          Text("Let’s get you started",style: TextStyle(color: Colors.white,fontSize: 16),)
          ],)
                  

                ),
               
           ),


        
      ],
    ));
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home_page()));
  }
}
