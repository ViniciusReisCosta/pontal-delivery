import 'package:flutter/material.dart';
import 'package:pontal_delivery/config/custom_colors.dart';
import 'package:pontal_delivery/models/cart_item_model.dart';
import 'package:pontal_delivery/pages/common_widgets/quantity_widget.dart';
import 'package:pontal_delivery/services/utils_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final void Function(CartItemModel cartItem) remove;

  CartTile({
    Key? key,
    required this.cartItem,
    required this.remove,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),

        title: Text(
          widget.cartItem.item.itemName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        // Total
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
              color: CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold),
        ),
        // Quantidade
        trailing: QuantityWidget(
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
            });

            // Remove o item se a quantidade for zero
            if (quantity == 0) {
              widget.remove(widget.cartItem);
            }
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
