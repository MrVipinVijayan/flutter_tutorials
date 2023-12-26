import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/bloc/user_bloc.dart';
import 'package:flutter_tutorials/bloc/user_event.dart';
import 'package:flutter_tutorials/repo/user_repo.dart';
import 'package:flutter_tutorials/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => UserBloc(UserRepo())..add(LoadUserEvent()),
        child: const HomePage(),
      ),
    );
  }
}
