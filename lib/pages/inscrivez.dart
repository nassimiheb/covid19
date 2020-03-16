import 'package:covid19/pages/inscrivez_suite1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Inscrivez_page extends StatefulWidget {
  @override
  _Inscrivez_pageState createState() => _Inscrivez_pageState();
}

class _Inscrivez_pageState extends State<Inscrivez_page> {
  String _username = "";
  String _password = "";
  String _phone = "";
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
                            style:
                                TextStyle(fontSize: 22, color: Colors.white)),
                        margin: EdgeInsets.fromLTRB(
                            16, MediaQuery.of(context).size.height * 0.1, 0, 0),
                      )
                    ],
                  )),
              backgroundColor: Colors.transparent,
              body: new Container(
                color: Colors.white,
                child: new Center(
                    child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          showUsernameInput(),
                          showPasswordInput(),
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
                                if (_username != "" &&
                                    _password != "" &&
                                    _phone != "") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Inscrivez1_page(
                                              username: _username,
                                              password: _password,
                                              phone: _phone,
                                            )),
                                  );
                                }
                              },
                              color: Color(0xFF00A79B),
                              elevation: 3,
                              textColor: Colors.white,
                              child: Text("Continuer".toUpperCase(),
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

  Widget showUsernameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
      child: new TextFormField(
        onChanged: (e) {
          _username = e;
        },
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: "Nom d'utilisateur",
            icon: new Icon(
              Icons.person,
              color: Colors.black87,
            )),
        validator: (value) => value.isEmpty ? 'Username can\'t be empty' : null,
      ),
    );
  }

  Widget showPhoneInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
      child: new TextFormField(
        keyboardType:TextInputType.phone,
        onChanged: (e) {
          _phone = e;
        },
        maxLines: 1,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Numéro de telephone',
            icon: new Icon(
              Icons.phone,
              color: Colors.black87,
            )),
        validator: (value) => value.isEmpty ? 'Phone can\'t be empty' : null,
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
      child: new TextFormField(
        onChanged: (e) {
          _password = e;
        },
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Mot de passe',
            icon: new Icon(
              Icons.lock,
              color: Colors.black87,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      ),
    );
  }
}

/**/
