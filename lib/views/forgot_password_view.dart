import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/service_locator/service_locator.dart';
import '../views/login_view.dart';
import '../helpers/helper_widgets.dart';
import '../view_model/forgot_password_view_model.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordViewModel>(
      create: (_) => locator<ForgotPasswordViewModel>(),
      child: Consumer<ForgotPasswordViewModel>(
        builder: (context, model, child) => Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(0, 219, 201, 201),
              Color.fromARGB(255, 21, 141, 91),
              Color(0x610BE803)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                child: Column(
                  children: <Widget>[
                    logoWidget("assets/images/logo.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    inputField("Enter your Email", Icons.mail_outline, false,
                        emailController),
                    const SizedBox(
                      height: 30,
                    ),
                    confirmButton(
                      context,
                      "Submit",
                      () async {
                        try {
                          await model.forgotPassword(emailController.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginView()));
                          const snackBar = SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(' Email sent successfully'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } catch (e) {
                          String errorMessage = e.toString();
                          // setState(() {});
                          var snackBar =
                              messageSnackBar(errorMessage, Colors.red);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView()));
                      },
                      child: const Text(
                        "Back to Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
