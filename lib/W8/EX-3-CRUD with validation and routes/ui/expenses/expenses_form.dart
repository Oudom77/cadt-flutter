import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  String? errorMessage;

  void onCheckPressed() {
    String title = _titleController.text.trim();
    double? amount = double.tryParse(_amountController.text);

    if (title.isEmpty){

      setState(() {
        errorMessage = "Please enter an item";
        
      });
      return;

    }

    if (amount == null || amount <= 0 || amount >= 100){

      setState(() {
        errorMessage = "Please enter a valid amount (1 - 99)";
        
      });
      return;

    }

    Expense newExpense = Expense(
      amount: amount,
      title: title,
      category: Category.food,
      date: DateTime.now(),
    );

    Navigator.pop<Expense>(context, newExpense);
  }

  void onCancelPressed() {
    Navigator.pop(context);
  }

    Widget errorWidget(){

    if (errorMessage != null){

      return Padding(
        padding: EdgeInsetsGeometry.only(top: 30),
        child: Text(
          errorMessage!,
          style: TextStyle(
            color: Colors.red[500],
          ),
        ),
      );

    }

    return SizedBox(height: 24,);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: Icon(Icons.arrow_back_ios_sharp)
        ),
        title: Text(
          "Expense Form"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text('Title')),
            ),

            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: _amountController,
              maxLength: 50,
              decoration: InputDecoration(
                prefix: Text("\$"),
                label: const Text('Amount'),
              ),
            ),

            errorWidget(),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: onCancelPressed, child: Text("Cancel")),
                ElevatedButton(onPressed: onCheckPressed, child: Text("Save")),
              ],
            ),
          ],
        ),
      )
    );
  }
}
