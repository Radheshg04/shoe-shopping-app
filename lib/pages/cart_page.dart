import 'package:flutter/material.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';
// import 'package:shopping_app/global_variables.dart';
// import 'package:shopping_app/global_variables.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cart[index]['imageUrl'].toString()),
              radius: 40,
            ),
            title: Text(
              cart[index]['title'].toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Size: ${cart[index]['size'].toString()}\nPrice: \$${cart[index]['price'].toString()}',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "Delete Item",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        content: const Text(
                          "Are you sure you want to delete this item from cart?",
                          style: TextStyle(fontSize: 17),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(
                                () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeProduct(cart[index]);
                                  Navigator.pop(context);
                                },
                              );
                            },
                            child: const Text(
                              "Yes",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      );
                    },
                  );
                });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
