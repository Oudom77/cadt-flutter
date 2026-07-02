import '../models/expense.dart';
import '../repository/expense_repository.dart';

void main() async {

  
  print("Fetching expense");

  Expense expense = await expenseRepository.fetchExpense();
  print("  expense fetched : ${expense.title}");
}
