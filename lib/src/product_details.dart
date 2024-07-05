class ProductDetails {
  const ProductDetails._();

  static final productLenght = productNames.length;

  static final productNames = <String>[
    "AirMax Breeze",
    "UltraBoost Flex",
    "CloudFoam Runner",
    "React Phantom",
    "ZoomX Invincible",
    "Gel-Nimbus Glide",
    "Fresh Foam Tempo",
    "Boost Horizon",
    "Free RN Motion",
    "Ignite Prism",
    "Wave Rider Edge",
    "Hovr Sonic Rush",
    "Cushion 21 Elite",
    "Floatride Energy Surge",
    "Kinvara Velocity",
    "Clifton Edge Glide",
    "Pegasus Turbo Shift",
    "Nano X1 Adventure",
    "Speedcross Pulse",
    "Triumph ISO Flux",
    "Glycerin Maxim",
    "Propel Nitro Elite",
  ];

  static final productImages = <String>[
    "assets/images/01.png",
    "assets/images/02.png",
    "assets/images/03.png",
    "assets/images/04.png",
    "assets/images/05.png",
    "assets/images/06.png",
    "assets/images/07.png",
    "assets/images/08.png",
    "assets/images/09.png",
    "assets/images/10.png",
    "assets/images/11.png",
    "assets/images/12.png",
    "assets/images/13.png",
    "assets/images/14.png",
    "assets/images/15.png",
    "assets/images/16.png",
    "assets/images/17.png",
    "assets/images/18.png",
    "assets/images/19.png",
    "assets/images/20.png",
    "assets/images/21.png",
    "assets/images/22.png",
  ];

  static final productPrices = <String>[
    "\$129.99",
    "\$159.99",
    "\$89.99",
    "\$139.99",
    "\$179.99",
    "\$149.99",
    "\$109.99",
    "\$169.99",
    "\$119.99",
    "\$99.99",
    "\$134.99",
    "\$144.99",
    "\$189.99",
    "\$159.99",
    "\$124.99",
    "\$164.99",
    "\$179.99",
    "\$139.99",
    "\$149.99",
    "\$129.99",
    "\$169.99",
    "\$199.99",
  ];

  static final productPriceNumber = <double>[
    129.99,
    159.99,
    89.99,
    139.99,
    179.99,
    149.99,
    109.99,
    169.99,
    119.99,
    99.99,
    134.99,
    144.99,
    189.99,
    159.99,
    124.99,
    164.99,
    179.99,
    139.99,
    149.99,
    129.99,
    169.99,
    199.99,
  ];

  static final id = List.generate(productLenght, (index) => index);
}

class ProductModel {
  final String productName;
  final String productImage;
  final String productPrice;
  final double productPriceNo;
  final int id;

  bool isFavourite;

  ProductModel({
    required this.id,
    required this.productPriceNo,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    this.isFavourite = false,
  });

  static List<ProductModel> createClassList(
    List<String> name,
    List<String> image,
    List<String> price,
    List<double> productPriceNo,
    List<int> id,
  ) {
    return List.generate(
      name.length,
      (index) => ProductModel(
        id: id[index],
        productPriceNo: productPriceNo[index],
        productName: name[index],
        productImage: image[index],
        productPrice: price[index],
      ),
    );
  }

  @override
  String toString() {
    return "ID: $id\tName: $productName\tImage: $productImage\tPrice: $productPrice\tIsFavourite: $isFavourite";
  }
}
