import 'package:first_project/3rdpage.dart';
import 'package:first_project/second_screen_container.dart';
import 'package:flutter/material.dart';

import '4thpage.dart';
import '5thpage.dart';
import '6thpage.dart';
import '7thpage.dart';
import 'drawer.dart';
import 'list_tile.dart';
import 'main.dart';

class SecondScreen extends StatelessWidget {
  final List randomImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgbUFDomxdd-iqANTUrrn3SvMTO8UW0-3TuA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPwO-G1-EPd3lztLin-oDal5G-nspA7t0iUg&s'
  ];

  SecondScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        //(leading: Icon(Icons.menu), title: Text('Second Screen')),
        title: const Text('Oppo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_circle_right),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThirdScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 200, 20, 20),
                ),
                for (int i = 0; i < randomImages.length; i++)
                  Align(
                    widthFactor: 0.5,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(randomImages[i]),
                    ),
                  )
              ],
            ),
            const Row(
              children: <Widget>[
                Expanded(
                  child: Text('Making----------- Data Better',
                      style: TextStyle(fontSize: 50, color: Colors.white)),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  color: Colors.grey,
                  height: 180.3,
                  width: 180.3,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '9',
                            style: TextStyle(fontSize: 50),
                          ),
                          Icon(
                            Icons.location_city,
                            size: 40,
                          )
                        ],
                      ),
                      Text(
                        'Corporate',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Cities',
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(
                        Icons.more_horiz_sharp,
                        color: Colors.black,
                        size: 40,
                      ),
                      // ),
                    ],
                  ),
                ),
                const SecondScreenContainer(),
              ],
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  color: Colors.black,
                  width: 360,
                  height: 150,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '4.9',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.grey,
                            ),
                          ),
                          Icon(
                            Icons.flare_sharp,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ],
                      ),
                      Text(
                        '3.8K + Trust Pilot',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      Text(
                        'Reviews',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      Icon(
                        Icons.more_horiz_sharp,
                        size: 30,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: SeventhScreenStateDrawer(),
    );
  }
}
