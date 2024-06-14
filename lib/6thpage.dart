import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '1stpage.dart';
import '2ndpage.dart';
import '3rdpage.dart';
import '4thpage.dart';
import '5thpage.dart';
import '7thpage.dart';
import 'drawer.dart';
import 'list_tile.dart';
import 'main.dart';

class SixthScreen extends StatefulWidget {
  const SixthScreen({super.key});

  @override
  State<SixthScreen> createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen> {
  late WebViewController con;
  @override
  void initState() {
    super.initState();
    con = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.w3schools.com'), // Replace with your desired URL
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Sixth Page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeventhScreen()),
                );
              },
              icon: Icon(Icons.arrow_circle_right))
        ],
      ),
      body: SafeArea(
        child: WebViewWidget(
          controller: con,
        ),
      ),
      drawer: SeventhScreenStateDrawer(),
    );
  }
}
