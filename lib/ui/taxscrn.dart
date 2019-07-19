import 'package:flutter/material.dart';
import 'package:tax_calculator_app/ui/theme.dart';
import 'package:tax_calculator_app/userinfo.dart';

class taxscrn extends StatefulWidget {
  String name;
  int age;
  double _inc = 0;
  String _tax = "";

  taxscrn(this.name,this.age);

  @override
  _taxscrnState createState() => _taxscrnState();
}

class _taxscrnState extends State<taxscrn> {


  settax() {
    setState(() {
      if(_incctrl.text.isEmpty) widget._tax = "";
      else {
        widget._tax = gettax(widget.age,  widget._inc).toStringAsFixed(2);
      }
    });
  }
  var _incctrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        title: Text(
          "Tax Collection App",
          style: themestyle(22),
        ),
        centerTitle: true,
      ),

      body: ListView(

        children: <Widget>[



          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(child: new Text("Hello ${widget.name}",style: themestyle2(18),)),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _incctrl,
              decoration: InputDecoration(
                labelText: "Please enter your annual income(Rs)",
                labelStyle: themestyle2(12)
              ),
            ),
          ),

          Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: RaisedButton (
                onPressed: () {
                  try {
                    widget._inc = double.parse(_incctrl.text);
                  } catch(e) {
                    setState(() {
                      _incctrl.text = "";
                      settax();
                    });
                  }

                  settax();

                },
                child: Text("Done",style: themestyle(14)),
                color: Colors.grey.shade500,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: 500,
              child: Text(
                (widget._tax.isEmpty) ? "" : "Tax Payable: ${widget._tax}",
                style: themestyle2(25),
              ),
            ),
          )

        ],
      ),
    );
  }
}
