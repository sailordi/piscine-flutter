import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map makers: Info'),
        elevation: 2,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/4,),
              const Text('App Developers:',style: TextStyle(fontWeight: FontWeight.bold) ),
              const SizedBox(height: 10,),
              const Text('Name: Sailordi'),
              const Text('Email: sailordi11@gmail.com'),
              const Text('Year of Development: 2023'),
            ],
          ),
        ),
      )
    );
  }
}