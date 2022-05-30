import 'authentication_service.dart';
import '../../models/user.dart';

import '../failure.dart';

class AuthenticationServiceMock extends AuthenticationService {
  final _mockAuthUsers = <User?>[
    User(
      username: 'mockuser1@gmail.com',
      password: 'pwd123',
      email: 'mockuser1@gmail.com',
      name: 'Mock User 1',
      uid: '0',
    ),
    User(
      username: 'mock2@gmail.com',
      password: 'pwd123',
      email: 'mock2@gmail.com',
      name: 'Mock User 2',
      uid: '1',
    ),
  ];

  User? _user;

  @override
  User? get user => _user;

  @override
  Future<void> signIn({required String email, required String password}) async {
    _user = _mockAuthUsers.firstWhere(
        (user) => (email == user?.username) && (password == user?.password),
        orElse: () => null);
    if (_user == null) {
      throw Failure(411,
          message: 'Invalid username or password!',
          location: 'AuthenticationServiceMock.signIn() > other excecptions');
    }
  }

  @override
  Future<void> signOut() async {
    _user = null;
  }

  @override
  Future<void> recoverPassword({required String email}) async {}

  @override
  Future<void> barbershopSignup({required String email, required String password, required String name, required String phone, required String address, required String openTime, required String closeTime, required String description}) async {}

  @override
  Future<void> customerSignup({required String email, required String password, required String name, required String phone, required String address}) async {}

}
