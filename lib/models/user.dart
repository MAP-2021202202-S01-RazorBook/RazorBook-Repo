class User {
  final String username;
  final String? password;
  final String? uid;
  final String? token;
  final String? name;
  final String? email;

  const User(
      {this.username = '',
      this.password = '',
      this.uid = '',
      this.token = '',
      this.name = '',
      this.email = ''});

  User.fromJson(Map<String, dynamic> json)
      : this(
            username: json['username'],
            password: json['password'],
            uid: json['uid'],
            token: json['token'],
            name: json['name'],
            email: json['email']);

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'uid': uid,
        'token': token,
        'name': name,
        'email': email
      };

  copyWith({username, password, uid, token, name, email}) => User(
      username: username ?? this.username,
      password: password ?? this.password,
      uid: uid ?? this.uid,
      token: token ?? this.token,
      name: name ?? this.name,
      email: email ?? this.email);
}
