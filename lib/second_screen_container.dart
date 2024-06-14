import 'package:flutter/material.dart';

class SecondScreenContainer extends StatelessWidget {
  const SecondScreenContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
      height: 180.3,
      width: 180.3,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '12',
                style: TextStyle(color: Colors.grey, fontSize: 50),
              ),
              Icon(
                Icons.add_card,
                color: Colors.grey,
                size: 40,
              ),
            ],
          ),
          Text(
            'Premium',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          Text(
            'Cards',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          Icon(
            Icons.more_horiz_sharp,
            size: 40,
            color: Colors.grey,
          ),
          // ),
        ],
      ),
    );
  }
}
