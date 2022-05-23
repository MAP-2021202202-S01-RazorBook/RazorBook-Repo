import 'dart:html';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../views/home_view.dart';
import 'firebase_options.dart';
import '../views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  razorbookApp.auth=FirebaseAuth.instance;//razorbookApp 
  //we need to customer info from backend to be shown here
  //I named it razorbookApp maybe we can change it later on
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Ro-Parts',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home:SplashScreen()
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState() {
    super.initState();
    
    displaySplash();
  }

  displaySplash()
  {
    Timer(Duration(seconds: 2), () async {
      if(await razorbookApp.auth.currentUser() != null)
      {
        Route route = MaterialPageRoute(builder: (_) => StoreHome()); // StoreHome need to be created on view
        Navigator.pushReplacement(context, route);
      }
      else
      {
        Route route = MaterialPageRoute(builder: (_) => LoginView());
        Navigator.pushReplacement(context, route);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Color.fromARGB(255, 31, 223, 73), Color.fromARGB(255, 255, 255, 254)],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/welcome.png"),//Here we will upload an image on assets directory
              SizedBox(height: 20.0,),
              Text(
                "For the First time in Malaysia, Online BarbarShop",
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
