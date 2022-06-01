// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/service_locator/service_locator.dart';
import '../view_model/login_view_model.dart';
import '../helpers/helper_widgets.dart';
import '../views/signup_view.dart';
import '../views/forgot_password_view.dart';
// import '../views/home_view.dart';
import 'barbershop_profile_view.dart';
import 'customer_screens/customer_main_page_nav.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) => locator<LoginViewModel>(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
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
                    20, MediaQuery.of(context).size.height * 0.1, 20, 15),
                child: Column(
                  children: <Widget>[
                    logoWidget("assets/images/logo.png"),
                    SizedBox(
                      height: 20,
                    ),
                    inputField("Enter your Email", Icons.mail_outline, false,
                        emailController),
                    SizedBox(
                      height: 20,
                    ),
                    inputField("Enter your Password", Icons.lock_outline, true,
                        passwordController),
                    SizedBox(
                      height: 30,
                    ),
                    confirmButton(context, "Login", () async {
                      try {
                        await model.signIn(
                            email: emailController.text,
                            password: passwordController.text);
                        // FORWARD TO PAGE HERE:
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CustomerMainPageNav()),
                        );
                      } catch (e) {
                        String errorMessage = e.toString();
                        // setState(() {});
                        var snackBar =
                            messageSnackBar(errorMessage, Colors.red);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordView()));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            // horizontal: 20,
                            vertical:
                                15), //apply padding horizontal or vertical only
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    signup(),
                  ],
                ),
              ),
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TypeView()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
