import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_june23/features/auth/screens/home_screen.dart';

import 'features/user/bloc/user_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: BlocProvider(
        create: (context) => UserBloc(),
        child:  MaterialApp(
          theme: ThemeData(primaryColor:const Color(0xff1D267D)),
          title: 'Flutter Demo',
          home: HomeScreen(),
        ),
      ),
    );
  }
}
