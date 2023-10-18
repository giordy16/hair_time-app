class ShopModel {
  late String image;
  late String name;
  late String address;
  late String phone;
  late String description;

  ShopModel(this.image, this.name, this.address, this.phone, this.description);

  static ShopModel getTestModel() {
    return ShopModel("", "BARBIERE DA GIGI", "Via Roma 4, Treviso (TV)", "0422400600", "Una barberia è un luogo dove gli uomini possono andare per farsi tagliare i capelli, radersi e curare la propria barba. Spesso offrono anche servizi come massaggi alla testa e trattamenti per la pelle. Una barberia tradizionale ha un'atmosfera vintage e un arredamento in stile retrò. Offrono un'esperienza di grooming unica e personale, con un servizio di alta qualità.");
  }
}
