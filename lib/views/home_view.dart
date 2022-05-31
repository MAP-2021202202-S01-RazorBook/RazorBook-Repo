import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/service_locator/service_locator.dart';
import '../view_model/customer_profile_view_model.dart';
import '../view_model/home_view_model.dart';
import '../views/login_view.dart';
import '../views/signup_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_) => locator<CustomerProfileViewModel>()),
      ],
      child: MaterialApp(
        home: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    //deleting the say goodbye page
    return Scaffold(body: LoginView());
  }
}
