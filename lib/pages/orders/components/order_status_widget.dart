import 'package:flutter/material.dart';
import 'package:pontal_delivery/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({
    Key? key,
    required this.status,
    required this.isOverdue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Pedido confirmado
        _StatusDot(
          isActive: currentStatus >= 1,
          title: 'Pedido confirmado',
        ),
        const _CustomDivider(),

        // Pagamento
        _StatusDot(
          isActive: currentStatus >= 2,
          title: 'Pagamento',
          backgroundColor: isOverdue ? Colors.red : CustomColors.customSwatchColor,
        ),
        const _CustomDivider(),

        // Preparando
        _StatusDot(
          isActive: currentStatus >= 3,
          title: 'Preparando',
        ),
        const _CustomDivider(),

        // Envio
        _StatusDot(
          isActive: currentStatus >= 4,
          title: 'Envio',
        ),
        const _CustomDivider(),

        // Entregue
        _StatusDot(
          isActive: currentStatus >= 5,
          title: 'Entregue',
        ),
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;

  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.title,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dot
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.customSwatchColor,
            ),
            color: isActive ? backgroundColor ?? CustomColors.customSwatchColor : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
            Icons.check,
            size: 13,
            color: Colors.white,
          )
              : const SizedBox.shrink(),
        ),
        SizedBox(width: 5),

        // Texto
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }
}
