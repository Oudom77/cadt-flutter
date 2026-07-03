enum AsyncState { notStarted, loading, success, error }

class User {

  final String name;
  final String email;
  final String website;
  final Address address;

  const User({required this.name, required this.email, required this.website, required this.address});

  @override
  String toString() {
    return "Name: $name  |  Email: $email  |  Website: $website";
  }
}

class Address {

  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  const Address({required this.street, required this.suite, required this.city, required this.zipcode, required this.geo});
}

class Geo {

  final double lat;
  final double lng;

  const Geo({required this.lat, required this.lng});
}