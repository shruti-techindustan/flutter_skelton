import 'package:flutter/material.dart';
import 'package:flutter_demo_app/services/data_manager.dart';
import 'package:flutter_demo_app/services/localisation/app_translations.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _counter = 0;

   _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppTranslations.of(context).text("app_name"),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Image.asset(
              "images/payment_large.png",
              height: 100,
              width: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: AppTranslations.of(context).text("app_name"),
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}