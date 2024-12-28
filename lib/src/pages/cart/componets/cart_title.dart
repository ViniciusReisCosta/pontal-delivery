import 'package:flutter/material.dart';
import 'package:pontal_03/src/config/custom_colors.dart';
import 'package:pontal_03/src/models/cart_item.dart';
import 'package:pontal_03/src/pages/common_widgets/quantity_widget.dart';
import 'package:pontal_03/src/services/utils_services.dart';

class cardTitle extends StatefulWidget {
  final cartItemModel cartItem;
  final Function(cartItemModel) remove;
  const cardTitle({super.key, required this.cartItem,required this.remove});

  @override
  State<cardTitle> createState() => _cardTitleState();
}

class _cardTitleState extends State<cardTitle> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          //image
          leading: Image.asset(
            widget.cartItem.item.imgUrl,
            height: 60,
            width: 60,
          ),
          //titulo
          title: Text(
            widget.cartItem.item.itemName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          //total
          subtitle: Text(
            utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
            style: TextStyle(
                color: CustomColors.customSwatchColor,
                fontWeight: FontWeight.bold),
          ),
          //quantidade
          trailing: QuantityWidget(
            suffixText: widget.cartItem.item.unit,
            value: widget.cartItem.quantity,
            result: (quantity) {
              setState(() {
                widget.cartItem.quantity = quantity;
                if(quantity == 0){
                  //remove o item do carrinho
                widget.remove(widget.cartItem);
                }
              });
            },
            isremovable: true,
          ),
        ));
  }
}
