import 'package:get_storage/get_storage.dart';

class ServiceInitializer {
  Future<void> init() async {
    await GetStorage.init();
  }
}
