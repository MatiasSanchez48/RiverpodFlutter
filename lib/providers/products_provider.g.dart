// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsHash() => r'7aef159dd7d6415c6125a031910d62ed4fbb750c';

/// See also [products].
@ProviderFor(products)
final productsProvider = AutoDisposeProvider<List<Product>>.internal(
  products,
  name: r'productsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsRef = AutoDisposeProviderRef<List<Product>>;
String _$reducedProductsHash() => r'a21f8bfeede07455831c8ecb4038a7e28a783b5d';

/// See also [reducedProducts].
@ProviderFor(reducedProducts)
final reducedProductsProvider = AutoDisposeProvider<List<Product>>.internal(
  reducedProducts,
  name: r'reducedProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reducedProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ReducedProductsRef = AutoDisposeProviderRef<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
