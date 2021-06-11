
import "package:flutter/material.dart";
import 'UserDataEntry.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String _title = "Raita Vahini";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.values[3],
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                height: 1.5,
              )),
          titleSpacing: 17,
          actions: [
            IconButton(
                icon: Icon(Icons.settings_applications), onPressed: () {})
          ],
        ),
        body: Center(
          child: DataCard(),
        ),
        backgroundColor: Colors.white,),

    );
  }
}
