final json = {
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {"lat": "-37.3159", "lng": "81.1496"}
  },
  "phone": "1-770-736-8031 x56442",
  "website": "hildegard.org",
  "companies": [
    {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    },
    {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    },
    {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  ]
};

class Geo {
  String lat;
  String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, Object?> json) => Geo(
        lat: json['lat'] as String,
        lng: json['lng'] as String,
      );
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, Object?> json) => Address(
        street: json['street'] as String,
        suite: json['suite'] as String,
        city: json['city'] as String,
        zipcode: json['zipcode'] as String,
        geo: Geo.fromJson(json['geo'] as Map<String, Object?>),
      );
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, Object?> json) => Company(
        name: json['name'] as String,
        catchPhrase: json['catchPhrase'] as String,
        bs: json['bs'] as String,
      );
}

class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  List<Company> companies;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.companies,
  });

  factory User.fromJson(Map<String, Object?> json) => User(
        id: json['id'] as int,
        name: json['name'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
        address: Address.fromJson(json['address'] as Map<String, Object?>),
        phone: json['phone'] as String,
        website: json['website'] as String,
        companies: (json['companies'] as List).map((item) => Company.fromJson(item as Map<String, Object?>)).toList(),
      );
}

class Wand {
  String wood;
  String core;
  num? length;

  Wand({required this.wood, required this.core, required this.length});

  factory Wand.fromJson(Map<String, Object?> json) => Wand(
        wood: json['wood'] as String,
        core: json['core'] as String,
        length: json['length'] as num?,
      );
}

class Character {
  String id;
  String name;
  List<String> alternateNames;
  String species;
  String gender;
  String house;
  String? dateOfBirth;
  int? yearOfBirth;
  bool wizard;
  String ancestry;
  String eyeColour;
  String hairColour;
  Wand wand;
  String patronus;
  bool hogwartsStudent;
  bool hogwartsStaff;
  String actor;
  List<String> alternateActors;
  bool alive;
  String image;

  Character(
      {required this.id,
      required this.name,
      required this.alternateNames,
      required this.species,
      required this.gender,
      required this.house,
      required this.dateOfBirth,
      required this.yearOfBirth,
      required this.wizard,
      required this.ancestry,
      required this.eyeColour,
      required this.hairColour,
      required this.wand,
      required this.patronus,
      required this.hogwartsStudent,
      required this.hogwartsStaff,
      required this.actor,
      required this.alternateActors,
      required this.alive,
      required this.image});

  factory Character.fromJson(Map<String, Object?> json) => Character(
        id: json['id'] as String,
        name: json['name'] as String,
        alternateNames: (json['alternate_names'] as List)
            .map((item) => item as String)
            .toList(),
        species: json['species'] as String,
        gender: json['gender'] as String,
        house: json['house'] as String,
        dateOfBirth: json['dateOfBirth'] as String?,
        yearOfBirth: json['yearOfBirth'] as int?,
        wizard: json['wizard'] as bool,
        ancestry: json['ancestry'] as String,
        eyeColour: json['eyeColour'] as String,
        hairColour: json['hairColour'] as String,
        wand: Wand.fromJson(json['wand'] as Map<String, Object?>),
        patronus: json['patronus'] as String,
        hogwartsStudent: json['hogwartsStudent'] as bool,
        hogwartsStaff: json['hogwartsStaff'] as bool,
        actor: json['actor'] as String,
        alternateActors: (json['alternate_actors'] as List)
            .map((item) => item as String)
            .toList(),
        alive: json['alive'] as bool,
        image: json['image'] as String,
      );
}
