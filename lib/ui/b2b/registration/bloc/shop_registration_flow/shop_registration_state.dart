import 'package:hair_time/models/domain/shop/shop_model.dart';

class ShopRegistrationState {
  int currentPage;
  ShopModel? shop;
  List<bool>? canGoNext;

  ShopRegistrationState({
    this.currentPage = 0,
    this.shop,
    this.canGoNext,
  });

  ShopRegistrationState copyWith({
    ShopModel? shop,
    int? currentPage,
    List<bool>? canGoNext
  }) {
    return ShopRegistrationState(
      currentPage: currentPage ?? this.currentPage,
      shop: shop ?? this.shop,
      canGoNext: canGoNext ?? this.canGoNext,
    );
  }
}
