import 'package:flutter/material.dart';
import 'package:shopping_app/pages/cart_page.dart';
import 'package:shopping_app/pages/music_page.dart';
// import 'package:shopping_app/product_detail_page.dart';

import 'package:shopping_app/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      bottomLeft: Radius.circular(30),
      topRight: Radius.circular(0),
      bottomRight: Radius.circular(0),
    ),
    borderSide: BorderSide(
      color: Color.fromRGBO(0, 0, 0, 0.2),
      width: 1,
    ),
  );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const ProductList(),
    const CartPage(),
    const MusicPage(),
  ];
  late int bottomNavIndex;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    bottomNavIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            bottomNavIndex = value;
            currentPage = value;
          });
        },
        iconSize: 35,

        useLegacyColorScheme: false,
        // unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: bottomNavIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_outlined),
            label: 'Music',
          )
        ],
      ),
    );
  }
}
