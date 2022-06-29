abstract class FileUploadService {
  Future<void> uploadFile(String filePath, String fileName);
  Future<String>? getDownloadUrl(String fileName);
}
