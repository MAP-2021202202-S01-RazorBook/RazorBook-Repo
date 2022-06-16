import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';

import 'file_upload_service.dart';
import 'dart:io';

class FileUploadServiceFirebase extends FileUploadService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  @override
  Future<void> uploadFile(String filePath, String fileName) async {
    try {
      await _firebaseStorage
          .ref('userUploads/$fileName')
          .putFile(File(filePath));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<String> getDownloadUrl(String fileName) async {
    try {
      return await _firebaseStorage
          .ref('userUploads/$fileName')
          .getDownloadURL();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
