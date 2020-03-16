import 'package:covid19/pages/inscrivez.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, }) : super(key: key);

  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _username="";
  String _password="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      body: 
        
        SingleChildScrollView(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                
                Image.asset('assets/background.png'),
                Positioned(
                  height: MediaQuery.of(context).size.height * 0.52,
                  right: -300,
                  child: Image.asset('assets/shape.png'),
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 5.0,
                            width: 50.0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Bienvenu",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Dans votre application",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      )),
                )
              ],
            ),
            Container(
              child: Column(
                children: <Widget>[
                  showUsernameInput(),
                  showPasswordInput(),
                  
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
                             if(_password!=""&&_username!=""){
                               
                             }

                          },
                          color: Color(0xFF00A79B),
                          elevation: 3,
                          textColor: Colors.white,
                          child: Text("Connecter".toUpperCase(),
                              style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 16,
                              )),
                        ),
                      ),
                    )),
            Container(
              margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.12,
                  0,
                  MediaQuery.of(context).size.width * 0.12,
                  0),
              child: Row(
                children: <Widget>[
                  Text("Vous n'avez pas de compte?"),
                  GestureDetector(
                    child:Text("INSCRIVEZ",style:TextStyle(fontWeight: FontWeight.w700,color: Color(0xFF00A79B) )),
                 onTap: (){ Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            Inscrivez_page()
                                ),
                      );},
                  )

                  ],
              ),
            ),
            SizedBox(height: 40,)
          ],
        ),
       
      ),
      
    );
  }

  Widget showUsernameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
      child: new TextFormField(
        onChanged: (e){_username=e;},
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Username',
            icon: new Icon(
              Icons.person,
              color: Colors.black87,
            )),
        validator: (value) => value.isEmpty ? 'Username can\'t be empty' : null,
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
      child: new TextFormField(
        onChanged: (e){_password=e;},
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
