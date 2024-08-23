import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/providers/cart_provider.dart';
import 'package:riverpod_tutorial/screens/cart_screen.dart';

/// {@template CartIcon}
/// Icon with number of items in cart
/// {@endtemplate}
class CartIcon extends ConsumerWidget {
  /// {@macro CartIcon}
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberOfItemsInCart = ref.watch(cartNotifierProvider).length;

    return Stack(
      children: [
        IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const CartScreen(),
            ),
          ),
          icon: const Icon(
            Icons.shopping_bag_outlined,
            size: 30,
            color: Colors.black,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.greenAccent.shade700,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              numberOfItemsInCart.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
