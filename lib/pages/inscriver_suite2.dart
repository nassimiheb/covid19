
import 'dart:convert';

import 'package:covid19/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid19/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Inscrivez2_page extends StatefulWidget {
  final String username;
  final String password;
  final String phone;
  final String nom;
  final String prenom;
  final int age;

  const Inscrivez2_page({Key key, this.username, this.password, this.phone, this.nom, this.prenom, this.age}) : super(key: key);
  @override
  _Inscrivez2_pageState createState() => _Inscrivez2_pageState();
}
class Item {
  const Item(this.name,);
  final String name;

}
class _Inscrivez2_pageState extends State<Inscrivez2_page> {
  String _emergencyphone="";
   Item selectedGender;
  List<Item> users = <Item>[
    const Item('Homme',),
    const Item('Femme',),
   
  ];
  bool _isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            child: new Image.asset('assets/background.png'),
          ),
          Positioned(
            height: MediaQuery.of(context).size.height * 0.23,
            right: 0,
            child: Image.asset('assets/shape.png'),
          ),
          new Scaffold(
            resizeToAvoidBottomInset: false,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(200.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppBar(
                        title: new Text('Retour'),
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                      ),
                      Container(
                        child: Text('Créer un nouveau compte',
                            style: TextStyle(fontSize: 22, color: Colors.white)),
                        margin: EdgeInsets.fromLTRB(
                            16, MediaQuery.of(context).size.height * 0.1, 0, 0),
                      )
                    ],
                  )),
              backgroundColor: Colors.transparent,
              body: new Container(
                color: Colors.white,
                child:  _isLoading ? Center(child: CircularProgressIndicator()) : Center(
                    child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          showNameInput(),
                          showPhoneInput()
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.12,
                          0,
                          MediaQuery.of(context).size.width * 0.12,
                          0),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 36, 0, 32),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.width * 0.12,
                            width: MediaQuery.of(context).size.width * 0.76,
                            child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(6.0),
                                  side: BorderSide(color: Color(0xFF00A79B))),
                              onPressed: () {
                                if(selectedGender!=null&&_emergencyphone!=""){
                                  // put all the infos into database;
                                  signIn(widget.username, widget.password, widget.phone, widget.prenom, widget.nom, widget.age, selectedGender, _emergencyphone);
                                }

                              },
                              color: Color(0xFF00A79B),
                              elevation: 3,
                              textColor: Colors.white,
                              child: Text("Commencer".toUpperCase(),
                                  style: TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 16,
                                  )),
                            ),
                          ),
                        )),
                  ],
                )),
              ))
        ],
      ),
    );
  }

  signIn(String username, String password, String phoneNumber, String firstName, String familyName, int age, Item gender, String secondaryNum) async {
    User user = new User(userName: username, password: password, phoneNumber: phoneNumber, firstName: firstName, familyName: familyName, age: age, gender: gender, secondaryNum: secondaryNum);
    var jsonData; 
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post("url", body: user);
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      setState(() {
        _isLoading = false;
        sharedPreferences.setString("token", jsonData['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);

      });
    }
    else {
      print(response.body);
    }
  }

  Widget showNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Icon(Icons.wc),
       Expanded(child:
       Container(
         padding: EdgeInsets.all(12), 
         child: DropdownButton<Item>(
            hint:  Text("Sexe"),
            value: selectedGender,
            onChanged: (Item Value) {
              setState(() {
                selectedGender = Value;
              });
            },
            items: users.map((Item user) {
              return  DropdownMenuItem<Item>(
                value: user,
                child: Row(
                  children: <Widget>[
              
                    
                    Text(
                      user.name,
                      style:  TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),)
        ,) 
      ],) 
    );
  }

  Widget showPhoneInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
      child: new TextFormField(
       keyboardType: TextInputType.phone,
          onChanged: (e) {
           _emergencyphone= e;
        },
        maxLines: 1,
        obscureText: false,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: "Numéro d'urgence",
            icon: new Icon(
              Icons.phone,
              color: Colors.black87,
            )),
        validator: (value) => value.isEmpty ? 'Veuillez saisir un numéro' : null,
      ),
    );
  }


}

/**/
