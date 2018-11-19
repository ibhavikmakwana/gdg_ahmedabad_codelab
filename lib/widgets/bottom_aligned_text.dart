import 'package:flutter/material.dart';

class BottomAlignedText extends StatelessWidget {
  const BottomAlignedText(this.username);

  final String username;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        color: Colors.black38,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "By $username",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
