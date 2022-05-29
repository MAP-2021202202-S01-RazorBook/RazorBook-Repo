import 'package:flutter/cupertino.dart';

class ProfileViewModelProvider extends ChangeNotifier {
  bool _editMode = false;
  bool get editMode => _editMode;
  set editMode(bool value) {
    _editMode = value;
    notifyListeners();
  }

  ProfileUploadState _profileUploadState = ProfileUploadState.none;
  ProfileUploadState get profileUploadState => _profileUploadState;
  set profileUploadState(ProfileUploadState value) {
    _profileUploadState = value;
    notifyListeners();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

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
