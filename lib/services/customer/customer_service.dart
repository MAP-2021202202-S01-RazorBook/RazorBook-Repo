
import 'package:razor_book/models/user.dart';

abstract class CustomerService  {
  Future<User> getCustomerDetails(String uId);
  Future<void> updateCustomerDetails(User user, ctx);
}
