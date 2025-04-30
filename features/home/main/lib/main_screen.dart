import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main/main_bloc.dart';
import 'package:main/main_event.dart';
import 'package:main/main_state.dart';
import 'package:movies/presentation/ui/movies_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainScreenBloc(),
      child: MainScreenView(),
    );
  }
}

class MainScreenView extends StatelessWidget {
  MainScreenView({super.key});

  final List<Widget> _screens = [MoviesScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<MainScreenBloc, MainScreenState>(
            builder: (context, state) {
          return Text(state.selectedIndex == 0 ? 'Movies' : 'Settings');
        }),
      ),
      body: BlocBuilder<MainScreenBloc, MainScreenState>(
          builder: (context, state) {
        return _screens[state.selectedIndex];
      }),
      bottomNavigationBar: BlocBuilder<MainScreenBloc, MainScreenState>(
          builder: (context, state) {
        return BottomNavigationBar(
            currentIndex: state.selectedIndex,
            onTap: (index) {
              context.read<MainScreenBloc>().add(ChangeTab(index));
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings")
            ]);
      }),
    );
  }
}
