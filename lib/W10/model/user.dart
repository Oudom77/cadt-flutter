enum UserRole{ admin, student, teacher }

class User {

  final String id;
  final String username;
  final DateTime expiration;

  const User({required this.id, required this.username, required this.expiration});

  @override
  String toString() {
    return "Id: $id  |  Username: $username  |  Expiration: $expiration";
  }

}