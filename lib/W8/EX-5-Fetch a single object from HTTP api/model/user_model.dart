class User {

  final String name;
  final String email;
  final String website;

  const User({required this.name, required this.email, required this.website});

  @override
  String toString() {
    return "Name: $name  |  Email: $email  |  Website: $website";
  }
}

enum AsyncState { notStarted, loading, success, error }
