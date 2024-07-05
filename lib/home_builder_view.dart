import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:s_shoping_app/common/extentions/text_extention.dart';
import 'package:s_shoping_app/src/my_widgets.dart';
import 'package:s_shoping_app/src/product_details.dart';
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

class CartPage extends StatefulWidget {
  final List<ProductModel> productCartList;
  final Function(int)? removeItem;

  const CartPage({
    super.key,
    required this.productCartList,
    this.removeItem,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double total = widget.productCartList
        .fold(0, (sum, item) => sum + item.productPriceNo);
    var cart = widget.productCartList;
    return Scaffold(
      floatingActionButton: cart.isNotEmpty
          ? FloatingActionButton.extended(
              elevation: 1,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const OrderSuccessfulPage()),
                  ),
                );
              },
              isExtended: true,
              icon: const Icon(Icons.shopping_cart_checkout_rounded),
              label: "Check Out".toText(),
            )
          : null,
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.productCartList.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return ListTile(
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      item.productImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(item.productName),
                  subtitle: Text(item.productPrice),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        item.isFavourite = false;
                      });
                      widget.removeItem!(item.id);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderSuccessfulPage extends StatelessWidget {
  const OrderSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 35,
          icon: Icon(Icons.navigate_before_rounded),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Order Placed Successfully!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Thank you for your purchase.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('Back to Home'),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
