import 'package:flutter/material.dart';

class FirstScreenListTile extends StatelessWidget {
  FirstScreenListTile({super.key, required this.pg, required this.sc});
  String pg;
  final Widget Function() sc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${pg} Page '),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => sc()),
        );
      },
    );
  }
}
