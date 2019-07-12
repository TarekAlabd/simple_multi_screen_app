import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: "Multi Screen App",
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var _nameFieldController = TextEditingController();

  Future _gotoNextScreen(BuildContext context) async {
    Map results = await Navigator.of(context).push(
      MaterialPageRoute<Map>(
          builder: (BuildContext context) {
            return SecondScreen(name: _nameFieldController.text);
          }
      )
    );

    if (results != null && results.containsKey("info")){
      print(results["info"]);
      _nameFieldController = results["info"];
    }else{
      print("Nothing!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "First Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: TextField(
              controller: _nameFieldController,
              decoration: InputDecoration(
                labelText: "Enter Your Name!",
              ),
            ),
          ),
          ListTile(
            title: RaisedButton(
              child: Text("Send me to the Second Screen"),
              onPressed: () {_gotoNextScreen(context);}
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  final String name;
  SecondScreen({Key key, this.name}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var _backTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                  "${widget.name}"
              ),
            ),
            ListTile(
              title: TextField(
                controller: _backTextFieldController,
                decoration: InputDecoration(
                  labelText: "Write anything!"
                ),
              ),
            ),
            ListTile(
              title: FlatButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'info': _backTextFieldController.text,
                    });
                  },
                  child: Text(
                    "Send back",
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
