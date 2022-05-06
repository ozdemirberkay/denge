class User {
  late String token;
  late String nameSurname;

  static final User _instance = User._internal();

  User._internal();

  factory User(String token, String nameSurname) {
    _instance.token = token;
    _instance.nameSurname = nameSurname;
    return _instance;
  }
}
