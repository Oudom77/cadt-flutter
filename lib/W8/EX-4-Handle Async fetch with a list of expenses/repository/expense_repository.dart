import '../models/expense.dart';

class ExpenseRepository {
  List<Expense> singelExpense = [
    Expense(amount: 45, title: "fake"),
    Expense(amount: 45, title: "fake"),
    Expense(amount: 45, title: "fake"),
    Expense(amount: 45, title: "fake"),
    Expense(amount: 45, title: "fake")
  ];

  Future<List<Expense>> fetchExpense() {
    // Simulate 5 seconds before returnning the success fetch
    return Future.delayed(Duration(seconds: 5), () {
      return [...singelExpense];
    });
  }
}

class ExpenseException implements Exception {
  final String message;
  ExpenseException(this.message);

  @override
  String toString() => message;
}

final ExpenseRepository expenseRepository =
    ExpenseRepository(); // global access for now
