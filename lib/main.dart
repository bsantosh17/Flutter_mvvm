import 'package:flutter/material.dart';
import 'package:flutter_new/data/sharepreference/AuthHelper.dart';
import 'package:flutter_new/screen/auth/login.dart';
import 'package:flutter_new/screen/auth/viewmodel/AuthViewModel.dart';
import 'package:flutter_new/screen/dashboard/dashboard.dart';
import 'package:flutter_new/screen/dashboard/home_screen.dart';
import 'package:flutter_new/screen/dashboard/profile_screen.dart';
import 'package:flutter_new/screen/dashboard/setting_screen.dart';
import 'package:provider/provider.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized(); // Ensure binding is initialized

  // Check if the user is logged in
  bool loggedIn = await AuthHelper.isLoggedIn();
  final username = await AuthHelper.getUsername();



  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
      child: MyApp(loggedIn: loggedIn),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool loggedIn;

  MyApp({required this.loggedIn});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MVVM',
      initialRoute: loggedIn ? 'dashboard' : 'login',
      routes: {
        'login': (context) => MyLogin(),
        'dashboard' : (context) => MyDashboard(),


      },

    );
  }
}
