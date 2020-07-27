class User {
  final String id, password;

  User({this.id, this.password});

  @override
  String toString() => "User { id: $id, password:$password }";
}
