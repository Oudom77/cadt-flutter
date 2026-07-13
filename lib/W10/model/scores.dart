class Score {

  final String title;
  final int value;

  const Score({required this.title, required this.value});

  @override
  String toString() {
    return "Title: $title  |  Value: $value";
  }

}