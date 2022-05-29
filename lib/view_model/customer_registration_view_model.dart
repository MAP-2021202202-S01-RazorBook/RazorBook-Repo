import 'package:razor_book/services/firebase_service/customer_service_firebase/customer_service_firebase.dart';

Future customerInfo(String name, String age, String gender, String contact,
    String email, String password) async {
  CustomerServiceFirebase newCustomer = CustomerServiceFirebase();

  await newCustomer.addNewCustomer(name, age, gender, contact, email, password);
}
