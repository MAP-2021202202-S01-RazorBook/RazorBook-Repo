import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/service_locator/service_locator.dart';
import '../view_model/customer_profile_view_model.dart';
import '../view_model/home_view_model.dart';
import '../views/login_view.dart';
import '../views/all_bookings_view.dart'; //tbd
import '../views/signup_view.dart';
import 'all_services_view.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // auth service
        Provider<AuthenticationService>(
          create: (_) => locator<AuthenticationService>(),
        ),

        ChangeNotifierProvider(
            create: (_) => locator<CustomerProfileViewModel>()),
      ],
      child: const MaterialApp(
        home: Home(),
        onGenerateRoute: router.generateRoute,
        initialRoute: '/',
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
    return Scaffold(
      appBar: AppBar(title: Text(data.title),),
      body: Center(
        child: Column(children: [
        ElevatedButton(
          child: Text("Login"),
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginView())));
          }),
                  ElevatedButton(
          child: Text("Bookings"),
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute(builder: ((context) => ViewBookings())));
          }
        ),
                ElevatedButton(
          child: Text("Barber Services"),
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute(builder: ((context) => ViewServices())));
          }),
        ])
        
        ));
  }
}
