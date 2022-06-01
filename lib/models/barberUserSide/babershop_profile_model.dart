class BarberShopProfilePageModel {
  late String shopName;
  late String shopLocation;
  String? locationOnMap;
  late int customers;
  int? ranking;
  late int profileViews;
  late int contactNumber;
  late double rating;

  late List<String> availableTimes;
  late List services;
  late String shopeImage;
  int? voterCounts;
  String? docId;

  BarberShopProfilePageModel(
      {required this.profileViews,
      this.ranking,
      this.locationOnMap,
      this.docId,
      this.voterCounts,
      required this.shopName,
      required this.shopLocation,
      required this.contactNumber,
      required this.availableTimes,
      required this.services,
      required this.customers,
      required this.rating,
      required this.shopeImage});

  BarberShopProfilePageModel.fromMap(Map snapshot, [String? id]) {
    ///
    ///map key name changed
    ///make sure var name and keyName are the same to avoid error
    shopName = snapshot['shopName'];
    shopLocation = snapshot['shopLocation'];
    locationOnMap = snapshot['locationOnMap'] ?? "";
    customers = snapshot['customers'];
    ranking = snapshot['ranking'];
    profileViews = snapshot['profileViews'].runtimeType == int
        ? snapshot['profileViews']
        : snapshot['profileViews'] == null
            ? 0
            : int.parse(snapshot['profileViews']);
    contactNumber = snapshot['contactNumber'];
    availableTimes = snapshot['availableTimes'] ?? <String>[];
    services = snapshot['services'];
    shopeImage = snapshot['shopImage'];
    docId = snapshot['docId'] ?? id;
    rating = snapshot['rating'];
  }

  Map<String, dynamic> toMap() {
    return {
      'shopName': shopName,
      'shopLocation': shopLocation,
      'locationOnMap': locationOnMap,
      'customers': customers,
      'ranking': ranking,
      'profileViews': profileViews,
      'contactNumber': contactNumber,
      'availableTimes': availableTimes,
      'services': services,
      'shopImage': shopeImage,
      'docId': docId,
      'rating': rating,
    };
  }
}
