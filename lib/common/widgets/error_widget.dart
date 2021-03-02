import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class DisplayError extends StatelessWidget {
  final String error;

  const DisplayError({
    Key key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline_outlined),
          SizedBox(height: 10.0),
          Text("Exception occurred: $error"),
        ],
      ),
    );
  }
}
