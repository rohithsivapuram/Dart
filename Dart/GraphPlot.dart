import "package:flutter/material.dart";
import 'package:flutter/services.dart' show rootBundle; // doubt

import 'Graphplotutil.dart';

class graphPlot extends StatefulWidget {
  final String _commodity;
  final String _period;

  graphPlot(this._commodity, this._period);

  @override
  State<StatefulWidget> createState() {
    return GraphplotState(_commodity, _period);
  }
}

class GraphplotState extends State<graphPlot> {
  String _path = "assets/DATA/";

  String predicted = "",
      price2020 = "",
      price2019 = "",
      price2018 = "",
      price2017 = "";

  String _commodity;
  final String _period;
  Map<String, String> _Predlen = {
    "1 week": "week1_",
    "2 weeks": "week2_",
    "3 weeks": "week3_",
    "4 weeks": "week4_",
    "1 month": "week5_",
  };

  GraphplotState(this._commodity, this._period) {
    _commodity = _commodity.replaceAll('\r', "");
    _commodity+="_";
    _path += _commodity + _Predlen[_period];
    _loadData(_path);
  }

  Future<void> _loadData(String path) async {
    predicted = await rootBundle.loadString(path + "predicted.txt");
    price2020 = await rootBundle.loadString(path + "price2020.txt");
    price2019 = await rootBundle.loadString(path + "price2019.txt");
    price2018 = await rootBundle.loadString(path + "price2018.txt");
    // price2017 = await rootBundle.loadString(path + "price2017.txt");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(),
          body: ListView(
            padding: EdgeInsets.all(20),
            physics: BouncingScrollPhysics(),
            children: [
              // Text(" iuyt"),
              graphplotUtil(),
              // graphplotUtil(price2020),
              // graphplotUtil(price2019),
              // graphplotUtil(price2018),
              // graphplotUtil(price2017),
            ],
          )),
    );
  }
}
