import 'package:flutter/material.dart';
import 'package:tax_calculator_app/ui/second%20screen.dart';
import 'package:tax_calculator_app/ui/taxscrn.dart';
import 'package:tax_calculator_app/ui/theme.dart';


class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final _formkey = GlobalKey<FormState>();
  var _namectrl = new TextEditingController();
  var _agectrl = new TextEditingController();
  final double _i = -1;



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        title: Text(
          "Tax Collection App",
          style: themestyle(22),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.launch),
              onPressed: () {
                var router = new MaterialPageRoute(
                    builder: (BuildContext context) => new scrn2()); //router allows us to connect to other screens
                Navigator.of(context).push(router);
              },
            tooltip: "Tax Info",
              )
        ],
      ),
      body: new Stack(
        children: <Widget>[
            new Image.asset(
              "images/homepage.jpg",
              height: 1000,
              width: 499,
              fit: BoxFit.fill,
            ),

          Form(
            key: _formkey,
              child:
              new Column(
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0)),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextFormField(
                      controller: _namectrl,
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: themestyle(14),
                          helperText: "Enter your name",
                          helperStyle: themestyle(12.5),
                          border: OutlineInputBorder(
                            gapPadding: 2.3,
                            borderRadius: BorderRadius.circular(3.3),
                          )
                      ),
                      validator: (value) {
                        if(value.isEmpty) {
                          return "Please enter name";
                        }
                      },
                    ),
                  ),

                  new Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextFormField(
                      controller: _agectrl,
                      decoration: InputDecoration(
                          labelText: "Age",
                          labelStyle: themestyle(14),
                          helperText: "Enter your age",
                          helperStyle: themestyle(12.5),
                          border: OutlineInputBorder(
                            gapPadding: 2.3,
                            borderRadius: BorderRadius.circular(3.3),
                          )
                      ),
                      validator: (value) {
                        if(value.isEmpty) {
                          return "Please enter your age";
                        }
                        else {
                          try {
                            int a = int.parse(_agectrl.text);
                          } catch(e) {
                            setState(() {
                              _agectrl.text = "0";
                            });
                            return "Please enter an integer";
                          }
                        }
                      },
                    ),
                  ),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton (
                            onPressed: () {
                              if (_formkey.currentState.validate()) {
//                                debugPrint("Form submitted");

                                // GOING TO NEXT SCREEN

                                var router = new MaterialPageRoute(
                                    builder: (BuildContext context) => new taxscrn(_namectrl.text,int.parse(_agectrl.text)));
                                Navigator.of(context).push(router);

                              }
                            },
                            child: Text("Next",style:themestyle(14)),
                            color: Colors.grey.shade500,
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton (
                            onPressed: () {
                              if (_formkey.currentState.validate()) {
                                _formkey.currentState.reset();

                                setState(() {
                                  _namectrl.text = "";
                                  _agectrl.text = "";
                                });
                              }
                            },
                            child: Text("Clear",style: themestyle(14)),
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              )
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10,600, 10, 50),
            child: new Container(
              alignment: Alignment.center,
              height: 40,
              width: 500,

              child: new Text(
                  (_i == -1 ) ? "Source: https://www.incometaxindia.gov.in/" : "Total Payable Tax: ${(_i).toStringAsFixed(2)}",
                style: themestyle(14.2),
              ),

            ),
          )

        ],
      )
    );
  }
}

