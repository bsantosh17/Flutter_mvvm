import 'package:flutter/material.dart';
import 'package:flutter_new/data/sharepreference/AuthHelper.dart';
import 'package:flutter_new/screen/auth/login.dart';
import 'package:flutter_new/screen/auth/viewmodel/AuthViewModel.dart';
import 'package:flutter_new/screen/dashboard/dashboard.dart';
import 'package:flutter_new/screen/dashboard/viewModel/HomeViewModel.dart';
import 'package:flutter_new/screen/dashboard/viewModel/ProfileViewModel.dart';
import 'package:flutter_new/screen/dashboard/viewModel/SettingViewModel.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/firebase/notification_service.dart';




void main() async{

  WidgetsFlutterBinding.ensureInitialized(); // Ensure binding is initialized
  await Firebase.initializeApp();

  await NotificationService.initialize();

  bool loggedIn = await AuthHelper.isLoggedIn();


  runApp(
    MultiProvider(
        providers: [
            ChangeNotifierProvider(create: (_) => AuthViewModel()),
            ChangeNotifierProvider(create: (_) => ProfileViewModel()),
            ChangeNotifierProvider(create: (_) => HomeViewModel()),
            ChangeNotifierProvider(create: (_) => SettingViewModel()),
        ],
      child: MyApp(loggedIn: loggedIn),
    )
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
