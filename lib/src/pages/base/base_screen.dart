import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../cart/cart_tab.dart';
=======
>>>>>>> 8a7e8573245d83a8a9b9a95c18d7d42422affe39
import '../home/home_tab.dart';

// ignore: must_be_immutable
class Basescreen extends StatefulWidget {
  const Basescreen({super.key});

  @override
  State<Basescreen> createState() => _BasescreenState();
}

class _BasescreenState extends State<Basescreen> {
  int currentIndex = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeTab(),
<<<<<<< HEAD
                cardtab(),
=======
          Container(
            color: Colors.yellow,
          ),
>>>>>>> 8a7e8573245d83a8a9b9a95c18d7d42422affe39
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.orange,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState((){
          currentIndex = index;
          pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ), // icons
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'carrinho'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'pedidos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: 'outros'),
        ],
      ),
    );
  }
}
