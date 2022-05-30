import 'package:flutter/material.dart';
import '../view_model/barber_registration_view_model.dart';
import '../views/login_view.dart';
import '../views/home_view.dart';
import '../helpers/helper_widgets.dart';
import '../view_model/customer_registration_view_model.dart';
import 'package:provider/provider.dart';
import '../app/service_locator/service_locator.dart';

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
                    "Shop Name", Icons.store, false, shopNameController),
                SizedBox(
                  height: 20,
                ),
                inputField("Contact Number", Icons.call, false,
                    contactController),
                SizedBox(
                  height: 20,
                ),
                inputField(
                    "Address", Icons.place, false, addressController),
                SizedBox(
                  height: 20,
                ),
                inputField(
                    "Description", Icons.info, false, descriptionController),    
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
                  height: 20,
                ),
                pickTime("Shop open time",openTimeController, context),
                SizedBox(
                  height: 20,
                ),
                pickTime("Shop close time",closeTimeController, context),                                    
                SizedBox(
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
                inputField("Contact Number", Icons.call, false,
                    contactController),
                SizedBox(
                  height: 20,
                ),
                inputField("Address", Icons.place, false,
                    addressController),    
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
                    await model.customerSignup(
                        name: nameController.text,
                        phone: contactController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        address: addressController.text);
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
