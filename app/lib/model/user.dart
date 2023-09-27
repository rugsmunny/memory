class User {
  final String username;
  final String password;

  User(this.username, this.password);

  Map<String, dynamic> toDb() {
    return {
      'username': username,
      'password': password,
    };
  }
}
