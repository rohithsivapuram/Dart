import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:convert";
import "package:charts_flutter/flutter.dart" as charts;
import 'package:raita_vahini/classes/graph.dart';

class graphplotUtil extends StatelessWidget{

  // String _data;
  // List _dataList;
  // DateTime _date;
  // List<double> _priceList;
  // graphplotUtil(this._data) {
  //
  // }

final List<timeseries> Data = [

  timeseries(date: DateTime(2020,1,1,), price: 1000),
  timeseries(date: DateTime(2020,2,2,), price: 2000),
  timeseries(date: DateTime(2020,3,3,), price: 3000),
  timeseries(date: DateTime(2020,4,4,), price: 1000),
  timeseries(date: DateTime(2020,5,5,), price: 5000),
  timeseries(date: DateTime(2020,6,7,), price: 6000),

];

final List<timeseries> Data2 = [

  timeseries(date: DateTime(2020,1,1,), price: 3000),
  timeseries(date: DateTime(2020,2,2,), price: 1000),
  timeseries(date: DateTime(2020,3,3,), price: 7000),
  timeseries(date: DateTime(2020,4,4,), price: 2000),
  timeseries(date: DateTime(2020,5,5,), price: 8000),
  timeseries(date: DateTime(2020,6,7,), price: 9000),

];

final List<timeseries> Data3 = [

  timeseries(date: DateTime(2020,1,1,), price: 2300),
  timeseries(date: DateTime(2020,2,2,), price: 1400),
  timeseries(date: DateTime(2020,3,3,), price: 2000),
  timeseries(date: DateTime(2020,4,4,), price: 8000),
  timeseries(date: DateTime(2020,5,5,), price: 5000),
  timeseries(date: DateTime(2020,6,7,), price: 6000),

];


  @override
  Widget build(BuildContext context) {
    return timegraph(Data,Data2,Data3);
  }

}
class timeseries{

  DateTime date;
  double price;
  Color color= Colors.deepOrange;
  timeseries({this.date, this.price});

}