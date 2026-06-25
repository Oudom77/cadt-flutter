
// ---------------------------------------------
// Create a new stateless widget : GroceryTile
// ---------------------------------------------


// The widget shall take as required parameter a Grocery  

// 	Use a ListTile widget to layout the elements


// https://api.flutter.dev/flutter/material/ListTile-class.html

import '../../../models/grocery.dart';
import 'package:flutter/material.dart';

class GroceryTile extends StatelessWidget {

  final GroceryItem groceryItem;
  const GroceryTile({super.key, required this.groceryItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white)
        )
      ),
      child: ListTile(
        leading: SizedBox(
          width: 15,
          height: 15,
          child: Container(
            color: groceryItem.category.color,
          ),
        ),
        title: Text(
          groceryItem.name
        ),
        trailing: Text(
          "${groceryItem.quantity}",
          style: TextStyle(
            fontSize: 16
          ),
        ),
      ),
      // child: Row(
      //   mainAxisAlignment: .spaceBetween,
      //   children: [
      //     Row(
      //       children: [
      //         SizedBox(
      //           width: 15,
      //           height: 15,
      //           child: Container(
      //             color: groceryItem.category.color,
      //           ),
      //         ),
      //         SizedBox(width: 10,),
      //         Text(
      //           groceryItem.name
      //         )
      //       ],
      //     ),
      //     Text(
      //       "${groceryItem.quantity}"
      //     )
      //   ],
      // ),
    );
  }
}
