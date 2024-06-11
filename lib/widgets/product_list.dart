import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_app/pages/home_page.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/widgets/product_card.dart';
import 'package:shopping_app/pages/product_detail_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> brands = const [
    '  All  ',
    'Adidas',
    'Nike',
    'Puma',
  ];

  late String selectedFilter;
  TextEditingController tec = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedFilter = brands[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    style: const TextStyle(fontWeight: FontWeight.w600),
                    controller: tec,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        border: HomePage.textFieldBorder,
                        focusedBorder: HomePage.textFieldBorder,
                        enabledBorder: HomePage.textFieldBorder),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: brands.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter = brands[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        label: Text(brands[index]),
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromRGBO(245, 247, 249, 1),
                        labelStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        side: const BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        // labelPadding: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.only(
                            top: 15.0, right: 20.0, bottom: 15.0, left: 20.0),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: size.width > 650
                  ? GridView.builder(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) {
                                  return ProductDetailsPage(product: product);
                                },
                              ),
                            );
                          },
                          child: ProductCard(
                            title: product["title"].toString(),
                            price: double.parse(product["price"].toString()),
                            imageUrl: product["imageUrl"].toString(),
                            bgColor: index % 2 == 0
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 249, 1),
                          ),
                        );
                      })
                  : ListView.builder(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) {
                                  return ProductDetailsPage(product: product);
                                },
                              ),
                            );
                          },
                          child: ProductCard(
                            title: product["title"].toString(),
                            price: double.parse(product["price"].toString()),
                            imageUrl: product["imageUrl"].toString(),
                            bgColor: index % 2 == 0
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 249, 1),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
