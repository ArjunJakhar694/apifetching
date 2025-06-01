import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class Welcome extends HiveObject {
  @HiveField(0)
  bool success;

  @HiveField(1)
  String message;

  @HiveField(2)
  bool showSwatchOnCollection;

  @HiveField(3)
  List<ProductList> productList;

  @HiveField(4)
  List<AttributeValueList> attributeValueList;

  Welcome({
    required this.success,
    required this.message,
    required this.showSwatchOnCollection,
    required this.productList,
    required this.attributeValueList,
  });

  factory Welcome.fromJson(Map<dynamic, dynamic> json) {
    return Welcome(
      success: json['success'],
      message: json['message'],
      showSwatchOnCollection: json['showSwatchOnCollection'],
      productList: (json['productList'] as List)
          .map((item) => ProductList.fromJson(item))
          .toList(),
      attributeValueList: (json['attributeValueList'] as List)
          .map((item) => AttributeValueList.fromJson(item))
          .toList(),
    );
  }
}

@HiveType(typeId: 1)
class ProductList {
  @HiveField(0)
  int reviewCount;
  @HiveField(1)
  bool isInWishlist;
  @HiveField(2)
  int wishlistItemId;
  @HiveField(3)
  String typeId;
  @HiveField(4)
  String entityId;
  @HiveField(5)
  int rating;
  @HiveField(6)
  bool isAvailable;
  @HiveField(7)
  double price;
  @HiveField(8)
  double finalPrice;
  @HiveField(9)
  String formattedPrice;
  @HiveField(10)
  String formattedFinalPrice;
  @HiveField(11)
  String name;
  @HiveField(12)
  bool hasRequiredOptions;
  @HiveField(13)
  bool isNew;
  @HiveField(14)
  bool isInRange;
  @HiveField(15)
  String thumbNail;
  @HiveField(16)
  String dominantColor;
  @HiveField(17)
  String tierPrice;
  @HiveField(18)
  String formattedTierPrice;
  @HiveField(19)
  int minAddToCartQty;
  @HiveField(20)
  String availability;
  @HiveField(21)
  String arUrl;
  @HiveField(22)
  String arType;
  @HiveField(23)
  List<dynamic> arTextureImages;
  @HiveField(24)
  int itemId;
  @HiveField(25)
  int cartQty;
  @HiveField(26)
  bool maxLimitReached;
  @HiveField(27)
  int maxLimit;

  ProductList({
    required this.reviewCount,
    required this.isInWishlist,
    required this.wishlistItemId,
    required this.typeId,
    required this.entityId,
    required this.rating,
    required this.isAvailable,
    required this.price,
    required this.finalPrice,
    required this.formattedPrice,
    required this.formattedFinalPrice,
    required this.name,
    required this.hasRequiredOptions,
    required this.isNew,
    required this.isInRange,
    required this.thumbNail,
    required this.dominantColor,
    required this.tierPrice,
    required this.formattedTierPrice,
    required this.minAddToCartQty,
    required this.availability,
    required this.arUrl,
    required this.arType,
    required this.arTextureImages,
    required this.itemId,
    required this.cartQty,
    required this.maxLimitReached,
    required this.maxLimit,
  });

  factory ProductList.fromJson(Map<dynamic, dynamic> json) {
    return ProductList(
      reviewCount: json['reviewCount'],
      isInWishlist: json['isInWishlist'],
      wishlistItemId: json['wishlistItemId'],
      typeId: json['typeId'],
      entityId: json['entityId'],
      rating: json['rating'],
      isAvailable: json['isAvailable'],
      price: (json['price'] is int) ? json['price'].toDouble() : json['price'],
      finalPrice: (json['finalPrice'] is int)
          ? json['finalPrice'].toDouble()
          : json['finalPrice'],
      formattedPrice: json['formattedPrice'],
      formattedFinalPrice: json['formattedFinalPrice'],
      name: json['name'],
      hasRequiredOptions: json['hasRequiredOptions'],
      isNew: json['isNew'],
      isInRange: json['isInRange'],
      thumbNail: json['thumbNail'],
      dominantColor: json['dominantColor'],
      tierPrice: json['tierPrice'],
      formattedTierPrice: json['formattedTierPrice'],
      minAddToCartQty: json['minAddToCartQty'],
      availability: json['availability'],
      arUrl: json['arUrl'],
      arType: json['arType'],
      arTextureImages: List<dynamic>.from(json['arTextureImages']),
      itemId: json['itemId'],
      cartQty: json['cartQty'],
      maxLimitReached: json['maxLimitReached'],
      maxLimit: json['maxLimit'],
    );
  }
}

@HiveType(typeId: 2)
class AttributeValueList {
  @HiveField(0)
  String attributeName;

  @HiveField(1)
  List<String> value;

  AttributeValueList({
    required this.attributeName,
    required this.value,
  });

  factory AttributeValueList.fromJson(Map<dynamic, dynamic> json) {
    return AttributeValueList(
      attributeName: json['attributeName'],
      value: List<String>.from(json['value']),
    );
  }
}
