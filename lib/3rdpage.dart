import 'package:first_project/main.dart';
import 'package:flutter/material.dart';

import '2ndpage.dart';
import '4thpage.dart';
import '5thpage.dart';
import '6thpage.dart';
import '7thpage.dart';
import 'drawer.dart';
import 'list_tile.dart';
import 'third_screen_container.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visswa'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_circle_right),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FourthScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10)),
              ThirdScreenContainer(
                name: 'visswa',
                color1: Colors.amberAccent,
              ),
              SizedBox(height: 10),
              ThirdScreenContainer(
                name: 'Prem',
                color1: Colors.lightBlueAccent,
                icon1: Icons.ac_unit,
              ),
              SizedBox(height: 10),
              ThirdScreenContainer(
                name: 'Vignesh',
                color1: Color.fromARGB(180, 260, 88, 5),
              ),
              SizedBox(height: 10),
              ThirdScreenContainer(
                name: 'Vikram',
                color1: Colors.grey,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.9,
                    ),
                    child: Image.asset(
                      "assets/images/img.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: SeventhScreenStateDrawer(),
    );
  }
}
