import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_markers/bloc/markers_bloc.dart';
import 'package:map_markers/bloc/index_bloc.dart';
import 'package:map_markers/screen/home/HomeView.dart';

void main() {
  runApp(const MyApp() );
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Map makers',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => MarkersBloc() ),
                BlocProvider(create: (context) => IndexBloc() )
              ],
            child: const HomeView(),
          ),
          debugShowCheckedModeBanner: false,
      );
  }
}
