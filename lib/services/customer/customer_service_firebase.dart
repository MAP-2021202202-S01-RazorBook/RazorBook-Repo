import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/services/customer/customer_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:razor_book/models/user.dart';
import '../../models/user.dart';
import '../failure.dart';

class CustomerServiceFirebase extends CustomerService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  Map<String, dynamic>? _customerDetailsForCustomer;
  Map<String, dynamic>? _customerDetailsForBarber;

  @override
  Map<String, dynamic>? get customerDetailsForCustomer =>
      _customerDetailsForCustomer;

  @override
  Map<String, dynamic>? get customerDetailsForBarber =>
      _customerDetailsForBarber;

  final currentUserId = locator<AuthenticationService>().currentUser?.u_id;

  final String _uId = 'eRiujAfrWASWbosQGToSO1wcmNz1';

  @override
  Future<void> getCustomerDetailsForCustomer(String uId) async {
    print("uid : $uId");
    try {
      QuerySnapshot value =
          await _usersCollection.where('u_id', isEqualTo: uId).get();

      if (value.docs.isNotEmpty) {
        _customerDetailsForCustomer = Map<String, dynamic>.from(
            value.docs.first.data() as Map<String, dynamic>); // safe cast
      }
    } on FirebaseException catch (e) {
      throw Failure(100,
          message: e.toString(),
          location:
              'CustomerServiceFirebase.getCustomerDetails() on FirebaseException');
    } catch (e) {
      throw Failure(101,
          message: e.toString(),
          location:
              'CustomerServiceFirebase.getCustomerDetails() on other exception');
    }
  }

  @override
  Future<void> updateCustomerDetails(User user, ctx) async {
    try {
      String dId = user.docId ?? '0DEPzMAgJji5MoIjvoGY'; //document id
      await _usersCollection
          .doc(dId)
          .update(user.customerToFirestore()); // update customer data 
    } on FirebaseException catch (e) {
      throw Failure(100,
          message: e.toString(),
          location:
              'CustomerServiceFirebase.updateCustomerDetails() on FirebaseException');
    } catch (e) {
      throw Failure(101,
          message: e.toString(),
          location:
              'CustomerServiceFirebase.updateCustomerDetails() on other exception');
    }
  }

  @override
  Future<void> getCustomerDetailsForBarber(String uId) async {
    try {
      QuerySnapshot value =
          await _usersCollection.where('u_id', isEqualTo: uId).get();

      // return a map of name, phone, address, profile pic, u_id,
      Map<String, dynamic> data =
          value.docs.map((value) => value.data()) as Map<String, dynamic>;

      _customerDetailsForBarber = data;
    } on FirebaseException catch (e) {
      throw Failure(100,
          message: e.toString(),
          location:
              'CustomerServiceFirebase.getCustomerDetails() on FirebaseException');
    } catch (e) {
      throw Failure(101,
          message: e.toString(),
          location:
              'CustomerServiceFirebase.getCustomerDetails() on other exception');
    }
  }
}
