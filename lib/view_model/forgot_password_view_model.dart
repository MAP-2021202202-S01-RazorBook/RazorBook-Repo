import '../app/service_locator/service_locator.dart';
import 'base_view_model.dart';

class ForgotPasswordViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future<void> forgotPassword(String email) async {
    setBusy(true);
    try {
      await _authenticationService.recoverPassword(email: email);
    } catch (e) {
      rethrow;
    } finally {
      setBusy(false);
    }
  }
}
