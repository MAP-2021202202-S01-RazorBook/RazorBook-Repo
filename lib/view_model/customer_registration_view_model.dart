import '../models/customerUserSide/customer_registration_model.dart';

Future customerInfo(String name, String age, String gender, String contact,
    String email, String password) async {
  CustomerDatabaseManager newCustomer = CustomerDatabaseManager();

  await newCustomer.addNewCustomer(name, age, gender, contact, email, password);
}
