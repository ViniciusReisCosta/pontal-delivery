import 'package:flutter/material.dart';
import 'package:pontal_delivery/config/custom_colors.dart';
import 'package:pontal_delivery/models/cart_item_model.dart';
import 'package:pontal_delivery/pages/cart/components/cart_tile.dart';
import 'package:pontal_delivery/services/utils_services.dart';
import 'package:pontal_delivery/config/app_data.dart' as appData;

import '../common_widgets/payment_dialog.dart';

class CartTab extends StatefulWidget {
  CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      appData.cartItems.removeWhere(
            (item) => item.item.itemName == cartItem.item.itemName,
      );

      utilsServices.showToast(
        message: '${cartItem.item.itemName} removido do Carrinho',
      );
    });
  }

  double cartTotalPrice() {
    double total = 0;

    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: appData.cartItems.length,
                itemBuilder: (_, index) {
                  return CartTile(
                    cartItem: appData.cartItems[index],
                    remove: removeItemFromCart,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10), // Espaço para evitar overflow
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 3,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize
                      .min, // evita ocupar mais espaço que o necessário
                  children: [
                    const Text(
                      'Total geral',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      utilsServices.priceToCurrency(cartTotalPrice()),
                      style: TextStyle(
                        fontSize: 23,
                        color: CustomColors.customSwatchColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.customSwatchColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () async {
                          bool? result = await showOrderConfirmation();

                          if (result ?? false) {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return PaymentDialog(
                                  order: appData.orders.first,
                                );
                              },
                            );
                          } else {
                            utilsServices.showToast(message: 'Pedido não confirmado', isError: true);
                          }
                        },
                        child: const Text(
                          'Concluir pedido',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
          title: const Text('Configuração'),
          content: const Text('Deseja realmente concluir o pedido ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Não'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
