class Score {

  final String id;
  final String title;
  final int value;

  const Score({required this.title, required this.value, required this.id});

  @override
  String toString() {
    return "Title: $title  |  Value: $value";
  }

}