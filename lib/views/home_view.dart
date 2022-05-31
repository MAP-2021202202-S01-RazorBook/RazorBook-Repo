import 'package:flutter/material.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import '../services/booking/booking_service.dart';
import '../view_model/home_view_model.dart';
import '../views/login_view.dart';
import '../views/all_bookings_view.dart'; //tbd
import '../views/signup_view.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
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
        child: ElevatedButton(
          child: Text("Say Goodbye"),
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute(builder: ((context) => ViewBookings())));
          }
        ),));
  }
}
