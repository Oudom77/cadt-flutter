import 'package:app_cadt/W7/2%20%20-%20Grocery%20App%20-%20Start/ui/screens/groceries/grocery_form.dart';
import 'package:app_cadt/W7/2%20%20-%20Grocery%20App%20-%20Start/ui/screens/groceries/grocery_tile.dart';
import 'package:flutter/material.dart';
import '../../../models/grocery.dart';
import '../../../data/mock_grocery_data.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {

  List<GroceryItem> groceryItems = [...allGroceryItems];

  void onCreate() async {
    
    // ---------------------------------------------
    // Navigate to the form screen using showModalBottomSheet
    // ---------------------------------------------

    // https://api.flutter.dev/flutter/material/showModalBottomSheet.html

    final GroceryItem? newGrocery = await showModalBottomSheet(
      context: context, 
      builder: (context) => GroceryForm(groceryItem: [...groceryItems],)
    );

    if (newGrocery != null){

      setState(() {
        groceryItems.add(newGrocery);
      });

    }
  }

  @override
  Widget build(BuildContext context) {

    Widget content = const Center(child: Text('No items added yet.'));

    if (groceryItems.isNotEmpty) {
      // ---------------------------------------------
      //  Loop on groceries with an ListView builder
      //  For each grocery items, create a GroceryTile (grocery_tile.dart)
      // ---------------------------------------------
      // https://api.flutter.dev/flutter/widgets/ListView-class.html

      return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ObjectKey(groceryItems[index]),
            background: Container(
              color: Colors.blue[400],
            ),
            onDismissed: (direction) {
              setState(() {
                groceryItems.removeAt(index);
              });
            },
            child: GroceryTile(groceryItem: groceryItems[index])
          );
        },
      ),
    );

    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
