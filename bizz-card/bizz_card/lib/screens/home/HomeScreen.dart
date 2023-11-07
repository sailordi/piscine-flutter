import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String _firstName = "Simon";
  String _lastName = "Karlsson";
  String _email = "sailordi11@gmail.com";
  String _phone = "+358 0000 00000";
  DateTime _currentDate = DateTime.now();
  DateTime _birthDate = DateTime(1992, 10, 12);

  HomeScreen();

  int _getAge() {
    int age = _currentDate.year - _birthDate.year;

    if (_currentDate.month < _birthDate.month ||
        (_currentDate.month == _birthDate.month && _currentDate.day < _birthDate.day)) {
      age--;
    }

    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("BizzCard"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Container(
             width: 220,
             height: 250,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/black-dragon-art-wallpaper.jpg'),
                  fit: BoxFit.fill,
                )
            )
            ),
            SizedBox(height: 20),
            Text(
              '$_firstName $_lastName',
              style:  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20),
            Text(
              _getAge().toString(),
              style:  TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
             '$_email',
              style:  TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              '$_phone',
              style:  TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
