class Address {
  Address({
    this.street,
    this.city,
    this.state,
    this.zip,
    this.country,
  });

  Address.fromJson(dynamic json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
  }
  String? street;
  String? city;
  String? state;
  String? country;
  String? zip;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['city'] = city;
    map['state'] = state;
    map['country'] = country;
    map['zip'] = zip;
    return map;
  }
}
