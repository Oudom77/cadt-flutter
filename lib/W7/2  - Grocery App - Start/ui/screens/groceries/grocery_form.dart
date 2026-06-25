
// ---------------------------------------------
// Create a new statefull widget : GroceryForm
// ---------------------------------------------
  
// The form shall be composed of 2 text fields:
// -	Name of the grocery item
 //-	Quantity (number only)

// ⚠️  For now we don’t select the grocery type, we assume it’s always food

// The form shall be composed of 2 buttons:
//-	Cancel button
// -	Add item button

import '../../../data/mock_grocery_data.dart';
import '../../../models/grocery.dart';
import 'package:flutter/material.dart';

class GroceryForm extends StatefulWidget {

  final List<GroceryItem> groceryItem;

  const GroceryForm({super.key, required this.groceryItem});

  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {

  TextEditingController nameController = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  GroceryCategory? selectedCategory;
  String? errorMessage;

  @override
  void dispose() {
    nameController.dispose();
    amountcontroller.dispose();
    super.dispose();
  }

  void onSubmit(){

    final name = (nameController.text).trim();
    final amount = int.tryParse(amountcontroller.text);

    if(name.isEmpty){

      setState(() {
        errorMessage = "Please enter an item";
      });
      return;
    }
    
    if (amount == null || amount < 0){

      setState(() {
        errorMessage = "Please enter a valid amount";
      });
      return;
    }

    final GroceryItem? item = GroceryItem(
      id: uuid.v4(), 
      name: name, 
      quantity: amount, 
      category: selectedCategory ?? GroceryCategory.other
    );

    if (item != null){

      Navigator.pop(context, item);

    }
  }

  void onClose(){

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
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(label: Text("Enter Title: ")),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountcontroller,
                  decoration: InputDecoration(label: Text("Enter amount: ")),
                ),
              ),
              SizedBox(width: 20,),
              DropdownMenu( 
                inputDecorationTheme: InputDecorationTheme(
                  border: UnderlineInputBorder(),
                ),
                initialSelection: GroceryCategory.other,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                dropdownMenuEntries: GroceryCategory.values.map((category) {
                  return DropdownMenuEntry(value: category, label: category.name);
                }).toList(),
                onSelected: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              )
            ],
          ),

          errorWidget(),

          Row(
            mainAxisAlignment: .end,
            children: [
              Container(
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[50]
                ),
                child: ElevatedButton(
                  onPressed: onSubmit, 
                  child: Text(
                    "Submit"
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[50]
                ),
                child: ElevatedButton(
                  onPressed: onClose, 
                  child: Text(
                    "Close"
                  )
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}