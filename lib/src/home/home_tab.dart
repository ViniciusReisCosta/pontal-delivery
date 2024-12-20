import 'package:flutter/material.dart';
import 'package:pontal_delivery/src/home/components/category_tile.dart';

import '../config/custom_colors.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<String> categories = [
    'executivos',
    'bebidas',
    'sobremessas',
    'promo da semana',
    'Entradas e petiscos',
    'pratos kid/individual',
    'fit',
    'acompanhamentos',
  ];

  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 30),
            children: [
              TextSpan(
                text: 'Pontal',
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                ),
              ),
              const TextSpan(
                text: 'Delivery',
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              child: Badge(
                backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                label: const Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Campo de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui ...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customSwatchColor,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Lista de categorias centralizada horizontalmente
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (_, index) {
                    return CategoryTile(
                      onPressed: () {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                      },
                      category: categories[index],
                      isSelected: selectedCategory == categories[index],
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(width: 10),
                  itemCount: categories.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

