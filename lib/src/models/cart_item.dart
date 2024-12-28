import 'package:pontal_03/src/models/item_model.dart';

class cartItemModel {
  ItemModel item;
  int quantity;

  cartItemModel({ 
    required this.item,
    required this.quantity
  });
  double totalPrice(){
   return item.price * quantity;
  }
}
