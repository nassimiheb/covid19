import 'package:flutter/material.dart';

import 'inscriver_suite2.dart';

class Inscrivez1_page extends StatefulWidget {
  final String password;
  final String username;
  final String phone;

  const Inscrivez1_page({Key key, this.password, this.username, this.phone})
      : super(key: key);
  @override
  _Inscrivez1_pageState createState() => _Inscrivez1_pageState();
}

class _Inscrivez1_pageState extends State<Inscrivez1_page> {
  String _nom = "";
  String _prenom = "";
  int _age = -1;
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
                        title: new Text('Back'),
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
                          showNameInput(),
                          showPrenomInput(),
                          showAgeInput()
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
                                if (_nom != "" && _prenom != "" && _age != -1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Inscrivez2_page(
                                              username: widget.username,
                                              password: widget.password,
                                              phone: widget.phone,
                                              nom: _nom,
                                              prenom: _prenom,
                                              age: _age,
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

  Widget showNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
      child: new TextFormField(
        onChanged: (e) {
          _nom = e;
        },
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Nom',
            icon: new Icon(
              Icons.person,
              color: Colors.black87,
            )),
        validator: (value) => value.isEmpty ? 'Name can\'t be empty' : null,
      ),
    );
  }

  Widget showAgeInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
      child: new TextFormField(
        keyboardType:TextInputType.number,
        onChanged: (e) {
          _age = int.parse(e);
        },
        maxLines: 1,
        obscureText: false,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Age',
            icon: new Icon(
              Icons.timer,
              color: Colors.black87,
            )),
        validator: (value) => value.isEmpty ? 'age can\'t be empty' : null,
      ),
    );
  }

  Widget showPrenomInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
      child: new TextFormField(
        onChanged: (e) {
          _prenom = e;
        },
        maxLines: 1,
        obscureText: false,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Prenom',
            icon: new Icon(
              Icons.person,
              color: Colors.black87,
            )),
        validator: (value) => value.isEmpty ? 'Pernom can\'t be empty' : null,
      ),
    );
  }
}

/**/
