import 'package:flutter/material.dart';

import '2ndpage.dart';
import '3rdpage.dart';
import '5thpage.dart';
import '6thpage.dart';
import '7thpage.dart';
import 'drawer.dart';
import 'list_tile.dart';
import 'main.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  double volume = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Fourth page'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FifthScreen()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Divider(
              height: 10,
            ),
            Text(
              'hello',
              style: TextStyle(color: Colors.black),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                splashFactory: InkRipple.splashFactory, // Splash effect
                overlayColor: Colors.black, // Splash color
              ),
              onPressed: () {},
              child: Text('Clickme'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                splashFactory: InkRipple.splashFactory, // Splash effect
                overlayColor: Colors.orange, // Splash color
              ),
              onPressed: () {
                showDialog<void>(
                  context: context,
                  // barrierDismissible: barrierDismissible,
                  // false = user must tap button, true = tap outside dialog
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      backgroundColor: Colors.white10,
                      title: Text('Elevated button'),
                      content: Text('This is alert dialog box'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(dialogContext)
                                .pop(); // Dismiss alert dialog
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('This is Elevated Button'),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  volume++;
                });
              },
              icon: Icon(
                Icons.volume_down_sharp,
                size: 40,
                color: Colors.white,
              ),
            ),
            Text(
              'Volume is $volume',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
          onPressed: () {},
          child: Icon(Icons.abc_outlined),
        ),
        ElevatedButton(onPressed: () {}, child: Icon(Icons.clear))
      ],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.man_2),
          ),
        ],
        onTap: (int i) {
          print(i.toString());
        },
      ),
      drawer: SeventhScreenStateDrawer(),
    );
  }
}
