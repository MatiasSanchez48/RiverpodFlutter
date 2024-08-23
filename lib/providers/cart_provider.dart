// ignore_for_file: type_annotate_public_apis
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_tutorial/models/product.dart';

part 'cart_provider.g.dart';

/// {@template CartIcon}
/// An observable class that stores a single immutable [state].
///
/// It can be used as a drop-in replacement to ChangeNotifier or other
/// equivalent objects like Bloc. Its particularity is that it tries to be
/// simple, yet promote immutable data.
/// {@endtemplate}
@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() {
    return const {};
  }

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {
        product,
        ...state,
      };
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((element) => element.id != product.id).toSet();
    }
  }
}

@riverpod
// ignore: inference_failure_on_untyped_parameter
int cartTotal(ref) {
  // ignore: avoid_dynamic_calls
  final cartProducts = ref.watch(cartNotifierProvider);
  var total = 0;

  for (final product in cartProducts as Set<Product>) {
    total += product.price;
  }

  return total;
}
