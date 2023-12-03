import 'package:firebase_core/firebase_core.dart';
import 'package:furniture_app/screens/register.dart';
import 'package:furniture_app/screens/test_item.dart';
import 'package:furniture_app/utils/colors.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home:Register(),

    );}

}