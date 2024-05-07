import 'package:ecommerce_app/components/my_button.dart';
import 'package:ecommerce_app/models/products.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item from cart
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content:
              const Text("Do you want to remove this item from the cart ?"),
          actions: [
            // cancel button
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),

            // remove button
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<Shop>().removeFromCart(product);
              },
              child: const Text("yes"),
            )
          ]),
    );
  }

  // user pressed pay button
  void payButtonPress(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text(
                  "User wants to pay! Connect this app to your payement backend"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart

    final cart = context.watch<Shop>().getUserCart();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Cart'),
        elevation: 0.0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            // cart list
            Expanded(
              child: cart.isEmpty
                  ? const Center(child: Text("Your cart is empty"))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        // get current product from cart
                        final item = cart[index];
                        return ListTile(
                            title: Text(item.name),
                            subtitle: Text(item.price.toStringAsFixed(2)),
                            trailing: IconButton(
                                onPressed: () =>
                                    removeItemFromCart(context, item),
                                icon: const Icon(Icons.remove)));
                      },
                    ),
            ),

            // pay button
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: MyButton(
                onTap: () => payButtonPress(context),
                child: const Text("PAY NOW"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
