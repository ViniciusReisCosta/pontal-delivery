import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:pontal_03/src/config/custom_colors.dart';
=======
import 'package:pontal_delivery/src/config/custom_colors.dart';
>>>>>>> 8a7e8573245d83a8a9b9a95c18d7d42422affe39

class QuantityWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) result;
<<<<<<< HEAD
  final bool isremovable;
=======
>>>>>>> 8a7e8573245d83a8a9b9a95c18d7d42422affe39

  const QuantityWidget({
    Key? key,
    required this.suffixText,
    required this.value,
    required this.result,
<<<<<<< HEAD
    this.isremovable = false,
=======
>>>>>>> 8a7e8573245d83a8a9b9a95c18d7d42422affe39
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          )
        ],
      ),
<<<<<<< HEAD
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        _QuantityButton(
          icon: !isremovable || value > 1 ? Icons.remove: Icons.delete,
          color:!isremovable || value > 1 ? Colors.grey: Colors.red,
          onPressed: () {
            if (value == 1 && !isremovable) return;
=======
      child: Row(children: [
        _QuantityButton(
          icon: Icons.remove,
          color: Colors.grey,
          onPressed: () {
            if (value == 1) return;
>>>>>>> 8a7e8573245d83a8a9b9a95c18d7d42422affe39

            int resultCount = value - 1;

            result(resultCount);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            '$value $suffixText',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _QuantityButton(
          icon: Icons.add,
          color: CustomColors.customSwatchColor,
          onPressed: () {
            int resultCount = value + 1;

            result(resultCount);
          },
        )
      ]),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
