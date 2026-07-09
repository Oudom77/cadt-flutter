enum AsyncState{notStarted, loading, success, error}

class User {

  final String name;
  bool selected = false;

  User({required this.name, required this.selected});

  @override
  String toString() {
    return "$name, $selected";
  }
}

