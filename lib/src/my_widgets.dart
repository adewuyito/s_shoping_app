import 'package:flutter/material.dart';
import 'package:s_shoping_app/src/product_details.dart';

class ProductItem extends StatefulWidget {
  final String? imagePath;
  final String? productName;
  final String? price;

  final ProductModel? productModel;
  final Function(int)? addItem;
  final Function(int)? removeItem;

  const ProductItem({
    super.key,
    this.removeItem,
    this.addItem,
    this.imagePath,
    this.productName,
    this.price,
    this.productModel,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  void setToggle() {
    bool isTrue = widget.productModel!.isFavourite;
    isTrue
        ? {
            widget.removeItem!(widget.productModel!.id),
            setState(() {
              widget.productModel!.isFavourite = false;
            })
          }
        : {
            widget.addItem!(widget.productModel!.id),
            setState(() {
              widget.productModel!.isFavourite = true;
            })
          };
  }

  @override
  Widget build(BuildContext context) {
    var item = widget.productModel;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.grey[100],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              item != null ? item.productImage : widget.imagePath!,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, size: 50),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item != null ? item.productName : widget.productName!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item != null ? item.productPrice : widget.price!,
                      style: const TextStyle(fontSize: 12),
                    ),
                    item != null
                        ? IconButton(
                            onPressed: () {
                              setToggle();
                            },
                            icon: Icon(
                              widget.productModel!.isFavourite
                                  ? Icons.shopping_cart_rounded
                                  : Icons.shopping_cart_outlined,
                            ),
                          )
                        : const Icon(Icons.error),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CSearchBar extends StatelessWidget {
  const CSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
