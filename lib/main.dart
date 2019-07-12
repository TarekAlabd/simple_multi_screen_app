import 'package:flutter/material.dart';

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
              onPressed: () {
                var router = MaterialPageRoute(
                    builder: (BuildContext context) => SecondScreen(name: _nameFieldController.text,));
                Navigator.of(context).push(router);
              },
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: ListTile(
        title: Text(
          "${widget.name}"
        ),
      )
    );
  }
}
