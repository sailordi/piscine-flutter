import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_markers/bloc/index_bloc.dart';
import 'package:map_markers/screen/map/MapView.dart';
import 'package:map_markers/screen/favorites/FavoritePlacesView.dart';
import 'package:map_markers/screen/info/InfoView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  @override
  Widget build(BuildContext context) {
      return BlocBuilder<IndexBloc,IndexState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state.index,
              children: const [
                MapView(),
                FavoritePlacesView(),
                InfoView()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.index,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.map),
                    label: 'Map',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favorites',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.info),
                    label: 'Info',
                  ),
                ],
                onTap: (index) {
                  context.read<IndexBloc>().add(UpdateIndex(i: index) );
                },
            )
          );
        },
      );
    }

}