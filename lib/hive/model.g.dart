// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WelcomeAdapter extends TypeAdapter<Welcome> {
  @override
  final int typeId = 0;

  @override
  Welcome read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Welcome(
      success: fields[0] as bool,
      message: fields[1] as String,
      showSwatchOnCollection: fields[2] as bool,
      productList: (fields[3] as List).cast<ProductList>(),
      attributeValueList: (fields[4] as List).cast<AttributeValueList>(),
    );
  }

  @override
  void write(BinaryWriter writer, Welcome obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.success)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.showSwatchOnCollection)
      ..writeByte(3)
      ..write(obj.productList)
      ..writeByte(4)
      ..write(obj.attributeValueList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WelcomeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductListAdapter extends TypeAdapter<ProductList> {
  @override
  final int typeId = 1;

  @override
  ProductList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductList(
      reviewCount: fields[0] as int,
      isInWishlist: fields[1] as bool,
      wishlistItemId: fields[2] as int,
      typeId: fields[3] as String,
      entityId: fields[4] as String,
      rating: fields[5] as int,
      isAvailable: fields[6] as bool,
      price: fields[7] as double,
      finalPrice: fields[8] as double,
      formattedPrice: fields[9] as String,
      formattedFinalPrice: fields[10] as String,
      name: fields[11] as String,
      hasRequiredOptions: fields[12] as bool,
      isNew: fields[13] as bool,
      isInRange: fields[14] as bool,
      thumbNail: fields[15] as String,
      dominantColor: fields[16] as String,
      tierPrice: fields[17] as String,
      formattedTierPrice: fields[18] as String,
      minAddToCartQty: fields[19] as int,
      availability: fields[20] as String,
      arUrl: fields[21] as String,
      arType: fields[22] as String,
      arTextureImages: (fields[23] as List).cast<dynamic>(),
      itemId: fields[24] as int,
      cartQty: fields[25] as int,
      maxLimitReached: fields[26] as bool,
      maxLimit: fields[27] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductList obj) {
    writer
      ..writeByte(28)
      ..writeByte(0)
      ..write(obj.reviewCount)
      ..writeByte(1)
      ..write(obj.isInWishlist)
      ..writeByte(2)
      ..write(obj.wishlistItemId)
      ..writeByte(3)
      ..write(obj.typeId)
      ..writeByte(4)
      ..write(obj.entityId)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(6)
      ..write(obj.isAvailable)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.finalPrice)
      ..writeByte(9)
      ..write(obj.formattedPrice)
      ..writeByte(10)
      ..write(obj.formattedFinalPrice)
      ..writeByte(11)
      ..write(obj.name)
      ..writeByte(12)
      ..write(obj.hasRequiredOptions)
      ..writeByte(13)
      ..write(obj.isNew)
      ..writeByte(14)
      ..write(obj.isInRange)
      ..writeByte(15)
      ..write(obj.thumbNail)
      ..writeByte(16)
      ..write(obj.dominantColor)
      ..writeByte(17)
      ..write(obj.tierPrice)
      ..writeByte(18)
      ..write(obj.formattedTierPrice)
      ..writeByte(19)
      ..write(obj.minAddToCartQty)
      ..writeByte(20)
      ..write(obj.availability)
      ..writeByte(21)
      ..write(obj.arUrl)
      ..writeByte(22)
      ..write(obj.arType)
      ..writeByte(23)
      ..write(obj.arTextureImages)
      ..writeByte(24)
      ..write(obj.itemId)
      ..writeByte(25)
      ..write(obj.cartQty)
      ..writeByte(26)
      ..write(obj.maxLimitReached)
      ..writeByte(27)
      ..write(obj.maxLimit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AttributeValueListAdapter extends TypeAdapter<AttributeValueList> {
  @override
  final int typeId = 2;

  @override
  AttributeValueList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttributeValueList(
      attributeName: fields[0] as String,
      value: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, AttributeValueList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.attributeName)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttributeValueListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
