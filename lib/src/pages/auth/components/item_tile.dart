import 'package:flutter/material.dart';
import 'package:pontal_03/src/config/custom_colors.dart';
import 'package:pontal_03/src/models/item_model.dart';
import 'package:pontal_03/src/pages/product/product_screen.dart';
import 'package:pontal_03/src/services/utils_services.dart';

// ignore: must_be_immutable
class ItemTile extends StatelessWidget {

  ItemTile({
    super.key,
    required this.item
  });

  final ItemModel item;

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
                       child: Image.asset(item.imgUrl),
                     ),
                   ),

                   Text(
                     item.itemName,
                     style: const TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.bold
                     ),
                   ),

                   Row(
                     children: [
                       Text(
                         utilsServices.priceToCurrency(item.price),
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 20,
                             color: CustomColors.customSwatchColor
                         ),
                       ),

                       Text(
                         '/${item.unit}',
                         style: TextStyle(
                             color: Colors.deepOrange.shade500,
                             fontWeight: FontWeight.bold,
                             fontSize: 12
                         ),
                       ),
                     ],
                   ),
                 ],
               )
           ),
         ),
       ),

       Positioned(
         top: 4,
         right: 4,
         child: GestureDetector(
           onTap: () {},
           child: Container(
             height: 40,
             width: 35,
             decoration: BoxDecoration(
                 color: CustomColors.customSwatchColor,
                 borderRadius: const BorderRadius.only(
                   bottomLeft: Radius.circular(15),
                   topRight: Radius.circular(20),
                 )
             ),
             child: const Icon(
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
