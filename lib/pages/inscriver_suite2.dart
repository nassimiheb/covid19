
import 'package:flutter/material.dart';

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
    const Item('homme',),
    const Item('femme',),
   
  ];
  
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
                            style: TextStyle(fontSize: 22, color: Colors.white)),
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
                                if(selectedGender!=null&&_emergencyphone!=""){}

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
            hint:  Text("Select item"),
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
            hintText: 'Numero d''urgence',
            icon: new Icon(
              Icons.phone,
              color: Colors.black87,
            )),
        validator: (value) => value.isEmpty ? 'Phone can\'t be empty' : null,
      ),
    );
  }


}

/**/
