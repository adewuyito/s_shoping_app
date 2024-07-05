import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:s_shoping_app/src/my_widgets.dart';
import 'package:s_shoping_app/src/product_details.dart';
import 'package:s_shoping_app/src/tests.dart';
import 'package:s_shoping_app/utils/constants/sizes.dart';

class HomeBuilder extends StatefulWidget {
  const HomeBuilder({super.key});

  @override
  State<HomeBuilder> createState() => _HomeBuilderState();
}

class _HomeBuilderState extends State<HomeBuilder> {
  int currentPageIndex = 0;

  List<ProductModel> productCart = [];

  final List<ProductModel> productList = ProductModel.createClassList(
    ProductDetails.productNames,
    ProductDetails.productImages,
    ProductDetails.productPrices,
    ProductDetails.productPriceNumber,
    ProductDetails.id,
  );

  void addToCart(int id) {
    setState(() {
      productCart.add(productList.where((e) => e.id == id).single);
    });
  }

  void removeWithId(int id) {
    log("Removing index $id");
    setState(() {
      productCart
          .remove(productCart.where((element) => element.id == id).first);
    });
  }

  void removeItem(int id) {
    log("Removing index $id");
    setState(() {
      productList.removeAt(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        ProductView(
          removeItem: removeWithId,
          addItem: addToCart,
          productItems: productList,
        ),
        CartPage(
          productCartList: productCart,
          removeItem: removeWithId,
        ),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 136, 134, 126),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.storefront_rounded),
            icon: Icon(Icons.storefront),
            label: 'Product',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_bag_rounded),
            icon: Badge(child: Icon(Icons.shopping_bag_outlined)),
            label: 'Checkout',
          ),
          // NavigationDestination(
          //   selectedIcon: Icon(Icons.shopping_bag_rounded),
          //   icon: Badge(child: Icon(Icons.shopping_bag_outlined)),
          //   label: 'Checkout',
          // ),
        ],
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  final List<ProductModel> productItems;
  final Function(int)? addItem;
  final Function(int)? removeItem;

  const ProductView({
    super.key,
    required this.productItems,
    this.addItem,
    this.removeItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            toolbarHeight: CSizes.appBarHeight + 20,
            centerTitle: true,
            title: CSearchBar(),
            floating: true,
            pinned: false,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final item = productItems[index];
                  return ProductItem(
                    removeItem: removeItem,
                    addItem: addItem,
                    productModel: item,
                  );
                },
                // childCount: ProductDetails.productImages.length,
                childCount: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckOutView extends StatelessWidget {
  final List<ProductModel> productList;

  const CheckOutView({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 20; i++) {
            log(productList[i].toString());
          }
        },
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 250,
          child: ProductItem(
            productModel: productList[1],
          ),
        ),
      ),
    );
  }
}
