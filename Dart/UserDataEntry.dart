import 'package:flutter/material.dart';
import 'GraphPlot.dart';
import 'commodity_menu.dart';
import 'prediction_period.dart';

class DataCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DataCardState();
  }
}

class DataCardState extends State<DataCard> {
  bool _isBothEnter = true;
  String _Commodity;
  String _period;

  void _setCommodity(String val) => _Commodity = val;
  void _setPeriod(String val) =>_period = val;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 400,
      child: Card(
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
          color: Colors.indigo,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Commodity(_setCommodity),
                predPeriod(_setPeriod),
                ElevatedButton(
                    onPressed: () {
                      print(_Commodity);
                      print(_period);
                      if (_Commodity != null && _period != null) {
                        Navigator.push(
                            context, _createRoute(_Commodity, _period));
                      } else {
                        _isBothEnter = false;
                        setState(() {});
                      }
                    },
                    child: Text("Press")),
                _isBothEnter
                    ? SizedBox()
                    : (_Commodity == null && _period == null)
                        ? Text(
                            "Please Enter Both The fields",
                            style: TextStyle(color: Colors.red),
                          )
                        : (_Commodity == null)
                            ? Text("Please Enter Commodity")
                            : Text("Please Enter Period"),
              ],
            ),
          )),
    );
  }
}

Route _createRoute(x, y) {
  return PageRouteBuilder(
    transitionDuration: Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => graphPlot(x, y),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0, 0);
      var end = Offset.zero;
      var curve = Curves.easeIn;
      print(animation.isCompleted);
      var tween = Tween(begin: begin, end: end).chain(CurveTween(
        curve: curve,
      ));

      return SlideTransition(
        position: Tween(begin: Offset(1,0), end: Offset(0,0))
            .animate(animation),
        child: child,
      );
    },
  );
}

