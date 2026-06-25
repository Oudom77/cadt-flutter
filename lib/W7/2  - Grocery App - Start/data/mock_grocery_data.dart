import 'package:uuid/uuid.dart';
import '../models/grocery.dart';

const uuid = Uuid();

final allGroceryItems = [
  GroceryItem(
      id: uuid.v4(),
      name: 'Milk',
      quantity: 1,
      category: GroceryCategory.dairy),
  GroceryItem(
      id: uuid.v4(),
      name: 'Bananas',
      quantity: 5,
      category: GroceryCategory.fruit),
  GroceryItem(
      id: uuid.v4(),
      name: 'Beef Steak',
      quantity: 1,
      category: GroceryCategory.meat),
];
