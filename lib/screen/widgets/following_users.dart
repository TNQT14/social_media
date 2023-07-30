import 'package:flutter/material.dart';

class FollowingUsers extends StatelessWidget {
  const FollowingUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Padding(
          padding: EdgeInsets.fromLTRB(20,20,20,10),
          child: Text(
            "Following",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
          ),
      ],
    );
  }
}