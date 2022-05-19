import 'package:flutter/material.dart';
import '../view_model/login_view_model.dart';
import '../helpers/helper_widgets.dart';
import '../views/signup_view.dart';
import '../views/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(0, 219, 201, 201),
            Color.fromARGB(255, 21, 141, 91),
            Color(0x610BE803)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height*0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/images/logo.png"),
                  SizedBox(
                    height: 20,
                  ),
                  inputField("Enter your Email", Icons.mail_outline, false, emailController),
                  SizedBox(height: 20,
                  ),
                  inputField("Enter your Password", Icons.lock_outline, true, passwordController),
                  SizedBox(height: 30,
                  ),
                  confirmButton(context, "Login", (){

                    loginAttempt(emailController.text, passwordController.text);
                    
                  }),
                  signup(),
                ],
              ),
            ),
          ),
        ),
      );
    }

  Row signup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color: Colors.white)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TypeView()));
          },
          child: const Text(" Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}




