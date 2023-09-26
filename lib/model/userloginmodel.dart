class Userlogin {
  String username;
  String password;
  Userlogin({
    required this.username,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
