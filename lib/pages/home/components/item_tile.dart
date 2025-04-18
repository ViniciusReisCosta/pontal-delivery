import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/custom_colors.dart';
import '../../../models/item_model.dart';
import '../../../services/utils_services.dart';
import '../../product/product_screen.dart';

class ItemTile extends StatelessWidget {
  ItemTile({
    super.key,
    required this.item,
    required this.cartAnimationMethod,
  });

  final ItemModel item;
  final void Function(GlobalKey) cartAnimationMethod;
  final GlobalKey imageGk = GlobalKey();

  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProductScreen(item: item);
            }));
          },
          child: Card(
            elevation: 3,
            shadowColor: Colors.deepOrange.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: item.imgUrl,
                        child: Image.asset(
                          item.imgUrl,
                          key: imageGk,
                        ),
                      ),
                    ),
                    Text(
                      item.itemName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          utilsServices.priceToCurrency(item.price),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: CustomColors.customSwatchColor),
                        ),
                        Text(
                          '/${item.unit}',
                          style: TextStyle(
                              color: Colors.deepOrange.shade500,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              cartAnimationMethod(imageGk);
            },
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                  color: CustomColors.customSwatchColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(20),
                  )),
              child: Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
