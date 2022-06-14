import 'package:flutter/material.dart';
import 'package:razor_book/router-constants.dart';
import '../view_model/barber_registration_view_model.dart';
import '../views/home_view.dart';
import '../helpers/helper_widgets.dart';
import '../view_model/customer_registration_view_model.dart';
import 'package:provider/provider.dart';
import '../app/service_locator/service_locator.dart';

String? _dropdownValue = "barber";

class UserTypeDropdown extends StatefulWidget {
  const UserTypeDropdown({Key? key}) : super(key: key);

  @override
  State<UserTypeDropdown> createState() => _UserTypeDropdownState();
}

class _UserTypeDropdownState extends State<UserTypeDropdown> {
  @override
  Widget build(BuildContext context) {
    void dropdownCallback(String? selectedValue) {
      if (selectedValue is String) {
        setState(() {
          _dropdownValue = selectedValue;
        });
      }
    }

    return SizedBox(
      width: 330.0,
      child: DropdownButtonHideUnderline(
          child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                hint: const Text("Choose your account type"),
                items: const [
                  DropdownMenuItem(value: "barber", child: Text("Barber")),
                  DropdownMenuItem(value: "customer", child: Text("Customer"))
                ],
                value: _dropdownValue,
                onChanged: dropdownCallback,
                iconSize: 40.0,
              ))),
    );
  }
}

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                20, MediaQuery.of(context).size.height * 0.06, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo.png"),
                const SizedBox(
                  height: 20,
                ),
                const Text("Choose your account type"),
                const SizedBox(
                  height: 20,
                ),
                const UserTypeDropdown(),
                const SizedBox(
                  height: 30,
                ),
                confirmButton(context, "Continue", () {
                  if (_dropdownValue == "barber") {
                    Navigator.pushNamed(context, BarberSignupViewRoute);
                  } else {
                    Navigator.pushNamed(context, CustomerSignupViewRoute);
                  }
                }),
                //login(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BarberSignupView extends StatefulWidget {
  const BarberSignupView({Key? key}) : super(key: key);

  @override
  State<BarberSignupView> createState() => _BarberSignupViewState();
}

class _BarberSignupViewState extends State<BarberSignupView> {
  TextEditingController shopNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController openTimeController = TextEditingController();
  TextEditingController closeTimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BarbershopSignUpViewModel>(
      create: (_) => locator<BarbershopSignUpViewModel>(),
      child: Consumer<BarbershopSignUpViewModel>(
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
                    20, MediaQuery.of(context).size.height * 0.06, 20, 0),
                child: Column(
                  children: <Widget>[
                    logoWidget("assets/images/logo.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    inputField(
                        "Shop Name", Icons.store, false, shopNameController),
                    const SizedBox(
                      height: 20,
                    ),
                    inputField(
                        "Contact Number", Icons.call, false, contactController),
                    const SizedBox(
                      height: 20,
                    ),
                    inputField(
                        "Address", Icons.place, false, addressController),
                    const SizedBox(
                      height: 20,
                    ),
                    inputField("Description", Icons.info, false,
                        descriptionController),
                    const SizedBox(
                      height: 20,
                    ),
                    inputField(
                        "Email", Icons.mail_outline, false, emailController),
                    const SizedBox(
                      height: 20,
                    ),
                    inputField("Enter your Password", Icons.lock_outline, true,
                        passwordController),
                    const SizedBox(
                      height: 20,
                    ),
                    pickTime("Shop open time", openTimeController, context),
                    const SizedBox(
                      height: 20,
                    ),
                    pickTime("Shop close time", closeTimeController, context),
                    const SizedBox(
                      height: 30,
                    ),
                    confirmButton(context, "Sign Up", () async {
                      try {
                        await model.barbershopSignup(
                            name: shopNameController.text,
                            phone: contactController.text,
                            address: addressController.text,
                            openTime: openTimeController.text,
                            closeTime: closeTimeController.text,
                            description: descriptionController.text,
                            email: emailController.text,
                            password: passwordController.text);
                      } catch (e) {
                        String errorMessage = e.toString();
                        // setState(() {});
                        var snackBar =
                            messageSnackBar(errorMessage, Colors.red);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    }),
                    login(),
                    const SizedBox(
                      height: 30,
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

  Row login() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already Registered?",
            style: TextStyle(color: Colors.white)),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, LoginViewRoute);
          },
          child: const Text(
            " Login",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class CustomerSignupView extends StatefulWidget {
  const CustomerSignupView({Key? key}) : super(key: key);

  @override
  State<CustomerSignupView> createState() => _CustomerSignupViewState();
}

class _CustomerSignupViewState extends State<CustomerSignupView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CustomerSignUpViewModel>(
      create: (_) => locator<CustomerSignUpViewModel>(),
      child: Consumer<CustomerSignUpViewModel>(
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
                    20, MediaQuery.of(context).size.height * 0.06, 20, 0),
                child: Column(
                  children: <Widget>[
                    logoWidget("assets/images/logo.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    inputField("Full Name", Icons.person_outline, false,
                        nameController),
                    const SizedBox(
                      height: 20,
                    ),
                    inputField(
                        "Contact Number", Icons.call, false, contactController),
                    const SizedBox(
                      height: 20,
                    ),
                    inputField(
                        "Address", Icons.place, false, addressController),
                    const SizedBox(
                      height: 20,
                    ),
                    inputField(
                        "Email", Icons.mail_outline, false, emailController),
                    const SizedBox(
                      height: 20,
                    ),
                    inputField("Enter your Password", Icons.lock_outline, true,
                        passwordController),
                    const SizedBox(
                      height: 30,
                    ),
                    confirmButton(context, "Sign Up", () async {
                      try {
                        await model.customerSignup(
                            name: nameController.text,
                            phone: contactController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            address: addressController.text);
                      } catch (e) {
                        String errorMessage = e.toString();
                        // setState(() {});
                        var snackBar =
                            messageSnackBar(errorMessage, Colors.red);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    }),
                    login(),
                    const SizedBox(
                      height: 30,
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

  Row login() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already Registered?",
            style: TextStyle(color: Colors.white)),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, LoginViewRoute);
          },
          child: const Text(
            " Login",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
