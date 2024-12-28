import 'package:flutter/material.dart';
import 'package:pontal_03/src/models/cart_item.dart';
import 'package:pontal_03/src/pages/cart/componets/cart_title.dart';
import 'package:pontal_03/src/services/utils_services.dart';

import '../../config/custom_colors.dart';
// ignore: library_prefixes
import 'package:pontal_03/src/config/app_data.dart' as appData;

class cardtab extends StatefulWidget {
  const cardtab({super.key});

  @override
  State<cardtab> createState() => _cardtabState();
}

class _cardtabState extends State<cardtab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemfromcart(cartItemModel cartItem) {
    setState(() {
      appData.cartItems.remove(cartItem);
    });
  }

  double cartotalPrice() {
    double total = 0;

    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('carrinho')),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: appData.cartItems.length,
            itemBuilder: (_, index) {
              return cardTitle(
                cartItem: appData.cartItems[index],
                remove: removeItemfromcart,
              );
            },
          )),
          Container(
            padding: const EdgeInsets.all(16),
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3,
                    spreadRadius: 2),
              ],
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    utilsServices.priceToCurrency(cartotalPrice()),
                    style: TextStyle(
                        fontSize: 23,
                        color: CustomColors.customSwatchColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.customSwatchColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          )),
                      onPressed: () async {
                        bool? result = await showOrderConfirmation();
                        print(result);
                      },
                      child: const Text(
                        'concluir pedido',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('confirmar compra'),
          content: const Text('deseja finalizar o pedido'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('não'),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Sim'))
          ],
        );
      },
    );
  }
}
