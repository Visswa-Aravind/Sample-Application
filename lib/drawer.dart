import 'package:flutter/material.dart';

import '9thpage.dart';
import '1stpage.dart';
import '2ndpage.dart';
import '3rdpage.dart';
import '4thpage.dart';
import '5thpage.dart';
import '6thpage.dart';
import '7thpage.dart';
import '8thpage.dart';
import 'list_tile.dart';

class SeventhScreenStateDrawer extends StatelessWidget {
  SeventhScreenStateDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 6.0,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Visswa Aravind'),
            accountEmail: Text('visswaaravind@gmail.com'),
            currentAccountPicture: CircleAvatar(),
          ),
          FirstScreenListTile(
            pg: 'Basic Ui',
            sc: () => FirstScreen(),
          ),
          Divider(
            height: 0.5,
          ),
          FirstScreenListTile(
            pg: 'Basic Ui',
            sc: () => SecondScreen(),
          ),
          Divider(
            height: 0.5,
          ),
          FirstScreenListTile(
            pg: 'Container',
            sc: () => ThirdScreen(),
          ),
          Divider(
            height: 0.5,
          ),
          FirstScreenListTile(pg: 'Buttons ', sc: () => FourthScreen()),
          Divider(
            height: 0.5,
          ),
          FirstScreenListTile(pg: 'Card', sc: () => FifthScreen()),
          Divider(
            height: 0.5,
          ),
          FirstScreenListTile(pg: 'Webview', sc: () => SixthScreen()),
          Divider(
            height: 0.5,
          ),
          FirstScreenListTile(pg: 'Sign in', sc: () => SeventhScreen()),
          Divider(
            height: 0.5,
          ),
          FirstScreenListTile(
              pg: 'Image Selection ',
              sc: () => EighthScreen(
                    name: '',
                    phoneno: '',
                    email: '',
                    selectedDays: [],
                    selectedGender: '',
                  )),
          Divider(
            height: 0.5,
          ),
          FirstScreenListTile(
              pg: 'Form Results',
              sc: () => TenthScreen(
                    email: '',
                    phoneno: '',
                    name: '',
                    selectedDays: [],
                    selectedGender: '',
                  )),
          Divider(
            height: 0.5,
          ),
        ],
      ),
    );
  }
}
