import 'package:flutter/material.dart';
import '../view_model/barber_registeration_view_model.dart';
import '../views/login_view.dart';
import '../views/home_view.dart';
import '../helpers/helper_widgets.dart';
import '../view_model/customer_registration_view_model.dart';

String? _dropdownValue = "barber";

class typeList extends StatefulWidget {
  const typeList({Key? key}) : super(key: key);

  @override
  State<typeList> createState() => _typeListState();
}

class _typeListState extends State<typeList> {
  @override
  Widget build(BuildContext context) {
    void dropdownCallback(String? selectedValue) {
      if (selectedValue is String) {
        setState(() {
          _dropdownValue = selectedValue;
        });
      }
    }

    return Container(
      width: 330.0,
      child: DropdownButtonHideUnderline(
          child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                hint: const Text("Choose your account type"),
                items: const [
                  DropdownMenuItem(child: Text("Barber"), value: "barber"),
                  DropdownMenuItem(child: Text("Customer"), value: "customer")
                ],
                value: _dropdownValue,
                onChanged: dropdownCallback,
                iconSize: 40.0,
              ))),
    );
  }
}

class TypeView extends StatefulWidget {
  const TypeView({Key? key}) : super(key: key);

  @override
  State<TypeView> createState() => _TypeViewState();
}

class _TypeViewState extends State<TypeView> {
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
                20, MediaQuery.of(context).size.height * 0.06, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo.png"),
                SizedBox(
                  height: 20,
                ),
                Text("Choose your account type"),
                SizedBox(
                  height: 20,
                ),
                typeList(),
                SizedBox(
                  height: 30,
                ),
                confirmButton(context, "Continue", () {
                  if (_dropdownValue == "barber") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BarberSignupView()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomerSignupView()));
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
  TextEditingController locationController = TextEditingController();
  TextEditingController locationOnMapController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                20, MediaQuery.of(context).size.height * 0.06, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo.png"),
                SizedBox(
                  height: 20,
                ),
                inputField(
                    "Shop Name", Icons.mail_outline, false, shopNameController),
                SizedBox(
                  height: 20,
                ),
                inputField("Contact Number", Icons.person_outline, false,
                    contactController),
                SizedBox(
                  height: 20,
                ),
                inputField(
                    "Location", Icons.mail_outline, false, locationController),
                SizedBox(
                  height: 20,
                ),
                inputField("Location on Map", Icons.mail_outline, false,
                    locationOnMapController),
                SizedBox(
                  height: 20,
                ),
                inputField("Email", Icons.mail_outline, false, emailController),
                SizedBox(
                  height: 20,
                ),
                inputField("Enter your Password", Icons.lock_outline, true,
                    passwordController),
                SizedBox(
                  height: 30,
                ),
                confirmButton(context, "Sign Up", () async {
                  try {
                    await barberInfo(
                        shopNameController.text,
                        contactController.text,
                        locationController.text,
                        locationOnMapController.text,
                        emailController.text,
                        passwordController.text);
                  } catch (e) {
                    String errorMessage = e.toString();
                    // setState(() {});
                    var snackBar = messageSnackBar(errorMessage, Colors.red);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }),
                login(),
                SizedBox(
                  height: 30,
                ),
              ],
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginView()));
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
  TextEditingController ageController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                20, MediaQuery.of(context).size.height * 0.06, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo.png"),
                SizedBox(
                  height: 20,
                ),
                inputField(
                    "Full Name", Icons.person_outline, false, nameController),
                SizedBox(
                  height: 20,
                ),
                inputField("Age", Icons.person_outline, false, ageController),
                SizedBox(
                  height: 20,
                ),
                inputField(
                    "Gender", Icons.person_outline, false, genderController),
                SizedBox(
                  height: 20,
                ),
                inputField("Contact Number", Icons.mail_outline, false,
                    contactController),
                SizedBox(
                  height: 20,
                ),
                inputField("Email", Icons.mail_outline, false, emailController),
                SizedBox(
                  height: 20,
                ),
                inputField("Enter your Password", Icons.lock_outline, true,
                    passwordController),
                SizedBox(
                  height: 30,
                ),
                confirmButton(context, "Sign Up", () async {
                  try {
                    await customerInfo(
                        nameController.text,
                        ageController.text,
                        genderController.text,
                        contactController.text,
                        emailController.text,
                        passwordController.text);
                  } catch (e) {
                    String errorMessage = e.toString();
                    // setState(() {});
                    var snackBar = messageSnackBar(errorMessage, Colors.red);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }),
                login(),
                SizedBox(
                  height: 30,
                ),
              ],
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginView()));
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
