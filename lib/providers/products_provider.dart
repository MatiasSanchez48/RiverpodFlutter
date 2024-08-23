import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_tutorial/models/product.dart';

part 'products_provider.g.dart';

/// List of all products[`Harcoded`].
const List<Product> allProducts = [
  Product(
    price: 200,
    id: '1',
    title: 'Image 1',
    image: 'https://picsum.photos/1000/309',
  ),
  Product(
    price: 500,
    id: '2',
    title: 'Image 2',
    image: 'https://picsum.photos/1000/300',
  ),
  Product(
    price: 1500,
    id: '3',
    title: 'Image 3',
    image: 'https://picsum.photos/1000/301',
  ),
  Product(
    price: 600,
    id: '4',
    title: 'Image 4',
    image: 'https://picsum.photos/1000/302',
  ),
  Product(
    price: 2000,
    id: '5',
    title: 'Image 5',
    image: 'https://picsum.photos/1000/303',
  ),
  Product(
    price: 150,
    id: '6',
    title: 'Image 6',
    image: 'https://picsum.photos/1000/304',
  ),
  Product(
    price: 100,
    id: '7',
    title: 'Image 7',
    image: 'https://picsum.photos/200/306',
  ),
];

@riverpod
List<Product> products(ProductsRef ref) {
  return allProducts;
}

@riverpod
List<Product> reducedProducts(ProductsRef ref) {
  return allProducts.where((p) => p.price < 4).toList();
}
