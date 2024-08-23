import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/models/product.dart';
import 'package:riverpod_tutorial/providers/cart_provider.dart';
import 'package:riverpod_tutorial/providers/products_provider.dart';
import 'package:riverpod_tutorial/shared/cart_icon.dart';

/// {@template MainMenu}
/// Page Main Menu for app
/// {@endtemplate}
class MainMenu extends ConsumerWidget {
  /// {@macro MainMenu}
  const MainMenu({super.key});

  /// Add or remove product from cart
  void _addOrRemoveProduct(
    WidgetRef ref,
    Product product,
  ) {
    if (ref.read(cartNotifierProvider).contains(product)) {
      ref.read(cartNotifierProvider.notifier).removeProduct(product);
    } else {
      ref.read(cartNotifierProvider.notifier).addProduct(product);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          /// TODO: translate
          'Tutorial for Riverpod',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        actions: const [CartIcon()],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: allProducts.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Column(
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              allProducts[index].title,
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    /// TODO: translate
                                    text: 'Price: ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\$ ${allProducts[index].price}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: colors.inversePrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () => _addOrRemoveProduct(
                          ref,
                          allProducts[index],
                        ),
                        icon: cartProducts.contains(allProducts[index])
                            ? const Icon(
                                Icons.remove,
                                color: Colors.red,
                                size: 30,
                              )
                            : Icon(
                                Icons.add,
                                color: colors.inversePrimary,
                                size: 30,
                              ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Image.network(
                    allProducts[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
