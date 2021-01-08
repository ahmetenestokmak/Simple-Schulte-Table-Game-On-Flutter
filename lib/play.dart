import 'package:flutter/material.dart';
import 'dart:async';

var listNumber = [];
int rdm = 0;
int level = 0;
Timer _timer;
double _start = 0.0;
String score;
void main() {
  runApp(Play());
}

class Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    for (int k = 0; k < 25; k++) {
      listNumber.add(k);
    }
    listNumber.shuffle();
    return MaterialApp(home: Scaffold(body: Center(child: Button())));
  }
}

class Button extends StatefulWidget {
  ButtonState createState() => ButtonState();
}

class ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          tableListCustom(context),
          new Text(
            'Next#:' + ((level + 1) == 26 ? "Finish" : level + 1).toString(),
            style:
                DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
          ),
          Text(
            "Score#: " + score,
            style:
                DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
          ),
          FlatButton(
            child: Text(
              "Refresh",
              style: TextStyle(color: Colors.black),
            ),
            color: Colors.black12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            height: 50,
            onPressed: () {
              _start = 0;
              level = 0;
              arr = [];
              listNumber.shuffle();
            },
          )
        ],
      ),
    ));
  }

  var arr = [];

  void addItemArray(int i) {
    if (arr.length == 0) {
      if (i == 0) {
        arr.add(i);
        setState(() {
          level = i + 1;
        });
      }
    } else {
      if ((arr[arr.length - 1] + 1) == i) {
        arr.add(i);
        setState(() {
          level = i + 1;
        });
      }
    }
  }

  bool isDisabled(int x) {
    for (var a in arr) {
      if (a == x) {
        return false;
      }
    }
    return true;
  }

  Widget tableListCustom(BuildContext context) {
    _timer = new Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if ((level + 1) == 26) {
            timer.cancel();
          } else {
            _start = (_start + 0.01);

            score = _start.toStringAsFixed(2);
          }
        },
      ),
    );

    var rows = [0, 1, 2, 3, 4];

    var col = [
      [
        listNumber[0],
        listNumber[1],
        listNumber[2],
        listNumber[3],
        listNumber[4]
      ],
      [
        listNumber[5],
        listNumber[6],
        listNumber[7],
        listNumber[8],
        listNumber[9]
      ],
      [
        listNumber[10],
        listNumber[11],
        listNumber[12],
        listNumber[13],
        listNumber[14]
      ],
      [
        listNumber[15],
        listNumber[16],
        listNumber[17],
        listNumber[18],
        listNumber[19]
      ],
      [
        listNumber[20],
        listNumber[21],
        listNumber[22],
        listNumber[23],
        listNumber[24]
      ]
    ];

    return Table(
        children: (rows)
            .map((r) => TableRow(
                children: (col[r])
                    .map((item) =>
                        Column(children: <Widget>[buttonRandom(context, item)]))
                    .toList()))
            .toList());
  }

  Widget buttonRandom(
    BuildContext context,
    int item,
  ) {
    return FlatButton(
      child: Text(
        (listNumber[item] + 1).toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
      color: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      height: 80,
      onPressed: isDisabled(listNumber[item])
          ? () => addItemArray(listNumber[item])
          : null,
    );
  }
}
