class Restaurant {
  final String name;
  double avgRating;
  int numRatings;

  Restaurant(
    this.name,
    this.avgRating,
    this.numRatings,
  );

  factory Restaurant.fromFirestore(Object? document) {
    return Restaurant("fake data", 3.4, 11);
  }
}
