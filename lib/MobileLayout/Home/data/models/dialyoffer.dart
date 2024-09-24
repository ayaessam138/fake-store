class OfferModel {
   String? image;
  final String description;
  final String proudctaName;
  final String price;
  final String discountPrice;
  final String discountPercentage;
  final String? rating;
   String? deatils;

  OfferModel(
      { this.image,
      required this.description,
      required this.proudctaName,
      required this.price,
      required this.discountPrice,
      required this.discountPercentage,
       this.deatils,
       this.rating});
}
