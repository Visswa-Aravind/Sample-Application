import 'package:first_project/6thpage.dart';
import 'package:first_project/main.dart';
import 'package:flutter/material.dart';

import '2ndpage.dart';
import '3rdpage.dart';
import '4thpage.dart';
import '7thpage.dart';
import 'drawer.dart';
import 'list_tile.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  void bottom() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Text('This is bottom sheet'),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    MaterialApp(
      debugShowCheckedModeBanner: false,
    );
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Fifth Page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SixthScreen()),
                );
              },
              icon: Icon(Icons.arrow_circle_right))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Ink(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              child: IconButton(
                alignment: Alignment.topRight,
                icon: Icon(Icons.add),
                onPressed: () {
                  bottom();
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Visswa',
                    style: TextStyle(
                      fontFamily: "RobotoMono-Italic-VariableFont_wght",
                      fontSize: 25,
                      color: Colors.purpleAccent,
                      decoration: TextDecoration.overline,
                      decorationStyle: TextDecorationStyle.dashed,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Aravind',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.wavy,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: ButtonBar(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      color: Colors.black,
                      Icons.access_alarm,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      color: Colors.black,
                      Icons.access_alarm,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      color: Colors.black,
                      Icons.access_alarm,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width: 150 * 2,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://res.cloudinary.com/apptailors/image/upload/v1666090421/blog/Flutter_apps_pwl2pp.png',
                    ),
                  ),
                ),
                alignment: Alignment.topCenter,
                child: Text('This is Network Image'),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.holiday_village,
                          size: 30,
                        ),
                        Text('Biggest Risk is not taking any Risk',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "RobotoMono-Italic-VariableFont_wght",
                            )),
                      ],
                    ),
                    Text(
                      '- Mark Zuckerberg',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: SeventhScreenStateDrawer(),
    );
  }
}
