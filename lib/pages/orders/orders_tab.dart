import 'package:flutter/material.dart';
import 'package:pontal_delivery/config/app_data.dart' as appData;
import 'package:pontal_delivery/pages/orders/components/order_tile.dart';

class OrdersTab extends StatelessWidget {

  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemBuilder: (_, index) => OrderTile(order: appData.orders[index]),
        itemCount: appData.orders.length,
      ),
    );
  }
}
