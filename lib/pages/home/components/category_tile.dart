import 'package:flutter/material.dart';
import 'package:pontal_delivery/config/custom_colors.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected
                ? CustomColors.customConstrastColor
                : Colors.transparent,
          ),
          child: Text(
            category,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black, // Cor do texto
              fontWeight: isSelected
                  ? FontWeight.bold
                  : FontWeight.normal, // Negrito se selecionado
              fontSize: 14, // Tamanho da fonte ajustado
            ),
          ),
        ),
      ),
    );
  }
}
