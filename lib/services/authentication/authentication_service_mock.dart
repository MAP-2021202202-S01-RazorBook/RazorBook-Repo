// import 'authentication_service.dart';
// import '../../models/user.dart';

// import '../failure.dart';

// class AuthenticationServiceMock extends AuthenticationService {
//   final _mockAuthUsers = <User?>[
//     User(
//       user_type: 'barber',
//       email: 'mockuser1@gmail.com',
//       name: 'Mock User 1',
//       u_id: '0',
//     ),
//     User(
//       user_type: 'customer',
//       email: 'mock2@gmail.com',
//       name: 'Mock User 2',
//       u_id: '1',
//     ),
//   ];

//   User? _user;

//   @override
//   User? get user => _user;

//   @override
//   Future<void> signIn({required String email, required String password}) async {
//     _user = _mockAuthUsers.firstWhere(
//         (user) => (email == user?.email) && (password == user?.u_id),
//         orElse: () => null);
//     if (_user == null) {
//       throw Failure(411,
//           message: 'Invalid username or password!',
//           location: 'AuthenticationServiceMock.signIn() > other excecptions');
//     }
//   }

//   @override
//   Future<void> signOut() async {
//     _user = null;
//   }

//   @override
//   Future<void> recoverPassword({required String email}) async {}

//   @override
//   Future<void> barbershopSignup({required String email, required String password, required String name, required String phone, required String address, required String openTime, required String closeTime, required String description}) async {}

//   @override
//   Future<void> customerSignup({required String email, required String password, required String name, required String phone, required String address}) async {}

// }
