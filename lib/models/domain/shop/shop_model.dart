import 'package:hair_time/models/domain/LatLng.dart';

class ShopModel {
  final String? name;
  final ShopAddress? address;
  final String? phone;

  ShopModel({
    this.name,
    this.address,
    this.phone,
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
}

class ShopAddress {
  final String? address;
  final LatLng? coordinates;
  final String? country;
  final String? province;
  final String? zipCode;

  ShopAddress({
    this.address,
    this.coordinates,
    this.country,
    this.province,
    this.zipCode,
  });
}
