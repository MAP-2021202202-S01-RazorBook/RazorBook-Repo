import '../models/customerUserSide/customer_registration_model.dart';


customerInfo(String name, String age, String gender,
String contact, String email, String password){

  CustomerDatabaseManager newCustomer =  CustomerDatabaseManager();

  newCustomer.addNewCustomer(name, age, gender, contact, email, password);
}