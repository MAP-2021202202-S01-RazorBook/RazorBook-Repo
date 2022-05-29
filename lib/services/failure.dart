// Change the class name, since Error is already used in Flutter
class Failure {
  final int code;
  final String? message;
  final String? location; // e.g. the class and method where the error occured

  const Failure(this.code, {this.message = '', this.location = ''});

  @override
  String toString() =>
      'Code: $code\n\nMessage: $message\n\nLocation: $location';
}
