import 'package:hair_time/models/domain/shop/shop_address.dart';

class ShopModel {
  final String name;
  final ShopAddress address;
  final String phone;

  ShopModel({
    required this.name,
    required this.address,
    required this.phone,
  });

  ShopModel copyWith({
    String? name,
    ShopAddress? address,
    String? phone,
  }) {
    return ShopModel(
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }

  static ShopModel empty() {
    return ShopModel(
      name: "",
      phone: "",
      address: ShopAddress("", "", "", ""),
    );
  }
}
