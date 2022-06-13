import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/helpers/helper_widgets.dart';
import 'package:razor_book/models/user.dart';
import 'package:razor_book/view_model/base_view_model.dart';

import '../services/customer/customer_service.dart';
import '../services/failure.dart';

class CustomerProfileViewModel extends BaseModel {
  /// set  var globally
  // final CustomerService _customerService = locator<Custo>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  bool _editMode = false;
  bool get editMode => _editMode;
  set editMode(bool value) {
    _editMode = value;
    notifyListeners();
  }

  final User _user = User(u_id: "", email: "");

  User? get user => _user;

  /// store profile temp

  ///
  ProfileUploadState _profileUploadState = ProfileUploadState.none;
  ProfileUploadState get profileUploadState => _profileUploadState;
  set profileUploadState(ProfileUploadState value) {
    _profileUploadState = value;
    notifyListeners();
  }

// will be called once the page is created to fetch the data for the user object
  Future<void> getCustomerDetails(String id) async {
    setBusy(true);
    try {
      //_user = await _customerService.getCustomerDetails(id);
      print("Customer details VM");
      setBusy(true);
      // await _customerService.getCustomerDetailsForCustomer(id);
      // user = _customerService.customerDetailsForCustomer;

    } on FirebaseException catch (e) {
      // throw Failures.cannotWrite;
      throw Failure(200,
          message: e.toString(),
          location:
              'CounterServiceFireStore.getCustomerDetails() on FirebaseException');
    } catch (e) {
      throw Failure(201,
          message: e.toString(),
          location:
              'CounterServiceFireStore.getCustomerDetails() on other exceptions');
    } finally {
      setBusy(false);
    }
  }

  Future<void> updateUserProfile(User newUser, ctx) async {
    setBusy(true);
    log("[+] updaing profile");
    ScaffoldMessenger.of(ctx).showSnackBar(mySnackBar("Updating profile"));
    try {
      await locator<CustomerService>().updateCustomerDetails(newUser, ctx);
      log("[+] profile updated");
      ScaffoldMessenger.of(ctx)
          .showSnackBar(mySnackBar("Profile updated successfully"));
    } catch (e) {
      log("[-] profile update failed");
      ScaffoldMessenger.of(ctx).showSnackBar(
        mySnackBar("Profile update failed $e", error: true),
      );
      rethrow;
    } finally {
      log("[+] updaing profile finished");
      setBusy(false);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }
}

enum ProfileUploadState {
  uploading,
  uploaded,
  failed,
  none,
}
