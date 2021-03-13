import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/Screen/HomeScreen.dart';
import 'package:flutter_bloc_example/bloc/navbarbloc_bloc.dart';
import 'package:flutter_bloc_example/cubit/launchurl_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavbarblocBloc>(
          create: (crx) => NavbarblocBloc(),
        ),
        BlocProvider<LaunchurlCubit>(
          create: (crx) => LaunchurlCubit(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.blueGrey,
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 20, color: Color(0xff8c9eff)),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
