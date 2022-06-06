import 'package:razor_book/models/user.dart';

import '../../models/user.dart';


//this class is used to return the customer details by both the customer
// and the barbershop (when viewing customers' bookings).
//also includes the part where customer can update his profile details.
abstract class CustomerService {
  User? get customerDetailsForBarber => null;
  List<dynamic>? get customerDetailsForCustomer => null;

//need to change it to void which results in changing the viewmodels as well
  Future<void> getCustomerDetailsForCustomer(String uId);
  Future<void> getCustomerDetailsForBarber(String uId);
  Future<void> updateCustomerDetails(User user, ctx);

  //TODO: get customer details for each user 
}
