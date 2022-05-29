import 'package:firebase_core/firebase_core.dart';

import '../../firebase_options.dart';
import 'service_initializer.dart';

class ServiceInitializerFirebase extends ServiceInitializer {
  @override
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
