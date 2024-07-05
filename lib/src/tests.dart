import 'package:flutter/material.dart';
import 'package:s_shoping_app/src/product_details.dart';

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

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.productCartList.length,
              itemBuilder: (context, index) {
                final item = widget.productCartList[index];
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
