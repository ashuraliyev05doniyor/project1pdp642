import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project1pdp64/pages/home_page.dart';
import 'package:project1pdp64/pages/signin_page.dart';
import 'package:project1pdp64/pages/signup_page.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox("data");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SignIn(),
      routes: {
        SignUp.id: (context)=>SignUp(),
        SignIn.id: (context)=>SignIn(),
        HomePage.id: (context)=>HomePage()

      },
    );
  }
}