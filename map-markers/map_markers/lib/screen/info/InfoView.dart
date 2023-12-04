import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
      ),
      body: const Column(
        children: [
          Text('App Developers:'),
          Text('Name: Sailordi'),
          Text('Email: sailordi11@gmail.com'),
          Text('Year of Development: 2023'),
        ],
      ),
    );
  }
}