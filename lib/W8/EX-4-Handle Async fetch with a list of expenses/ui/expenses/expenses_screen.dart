import 'package:flutter/material.dart';

import '../../models/expense.dart';
import '../../repository/expense_repository.dart';
import 'expenses_tile.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

enum AsyncState { notstarted, loading, error, success }

class _ExpensesScreenState extends State<ExpensesScreen> {
  AsyncState state = AsyncState.notstarted;
  List<Expense>? expense; // not null if fech succeed
  String? error; // not error if error

  void fetchExpense() async {
    try {
   
      state = AsyncState.loading;     // loading state
      setState(() {});

      expense = await expenseRepository.fetchExpense();    // Start to fetch
      state = AsyncState.success; // Success state
      setState(() {});


    } on ExpenseException catch (e) {
      error = e.message;
      state = AsyncState.error; // Error state
      setState(() {});
    }
  }

  Widget get content {
    switch (state) {
      case AsyncState.notstarted:
        return Text("Press refresh icon to fetch");

      case AsyncState.loading:
        return CircularProgressIndicator();

      case AsyncState.error:
        return Text(error!, style: TextStyle(color: Colors.red));

      case AsyncState.success:
        return ListView.builder(
          itemCount: expense!.length,
          itemBuilder: (content, index){

            return ExpenseTile(expense: expense![index]);

          }
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(onPressed: fetchExpense, icon: Icon(Icons.refresh)),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(child: content),
      ),
    );
  }
}
