import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:tempo_timer/blocs/blocs.dart';

import 'screens/page_home.dart';

void main() {
  runApp(const MyBlocProvider());
}

class MyBlocProvider extends StatelessWidget {
  const MyBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => Temporizador())],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Tempo Timer",
      debugShowCheckedModeBanner: false,
      home: PageHome(),
    );
  }
}
