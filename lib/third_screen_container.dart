import 'package:flutter/material.dart';

class ThirdScreenContainer extends StatelessWidget {
  ThirdScreenContainer({super.key, this.name, this.color1, this.icon1});
  String? name;
  var color1;
  var icon1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color1,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 360,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Hello ${name}',
                style: TextStyle(fontSize: 20),
              ),
              Icon(
                icon1,
                size: 40,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 30,
                width: 80,
                child: Text(
                  'hello',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
