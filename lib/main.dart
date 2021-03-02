import 'package:flutter/material.dart';
import 'package:movies/common/styles/styles.dart';
import 'package:movies/screens/screens.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'nncthang Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.mainColor,
      ),
      home: HomeScreen(),
    );
  }
}
