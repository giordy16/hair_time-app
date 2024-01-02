class ShopRegistrationStep2State {
  Map<String, String>? predictions;
  bool? isLoading;
  String? placeFullAddress;
  double? latitude;
  double? longitude;
  String? country;
  String? province;
  String? zipCode;
  String? address;
  String? houseNumber;

  ShopRegistrationStep2State({
    this.predictions,
    this.isLoading,
    this.placeFullAddress,
    this.latitude,
    this.longitude,
    this.country,
    this.province,
    this.zipCode,
    this.address,
    this.houseNumber,
  });

  ShopRegistrationStep2State copyWith({
    Map<String, String>? predictions,
    bool? isLoading,
    String? placeFullAddress,
    double? latitude,
    double? longitude,
    String? country,
    String? province,
    String? zipCode,
    String? address,
    String? houseNumber,
  }) {
    return ShopRegistrationStep2State(
      predictions: predictions ?? this.predictions,
      isLoading: isLoading ?? this.isLoading,
      placeFullAddress: placeFullAddress ?? this.placeFullAddress,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      country: country ?? this.country,
      province: province ?? this.province,
      zipCode: zipCode ?? this.zipCode,
      address: address ?? this.address,
      houseNumber: houseNumber ?? this.houseNumber,
    );
  }
}
