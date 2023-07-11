final json = [
  {
    "id": "9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8",
    "name": "Harry Potter",
    "alternate_names": ["The Boy Who Lived", "The Chosen One"],
    "species": "human",
    "gender": "male",
    "house": "Gryffindor",
    "dateOfBirth": "31-07-1980",
    "yearOfBirth": 1980,
    "wizard": true,
    "ancestry": "half-blood",
    "eyeColour": "green",
    "hairColour": "black",
    "wand": {"wood": "holly", "core": "phoenix feather", "length": 11},
    "patronus": "stag",
    "hogwartsStudent": true,
    "hogwartsStaff": false,
    "actor": "Daniel Radcliffe",
    "alternate_actors": [],
    "alive": true,
    "image": "https://ik.imagekit.io/hpapi/harry.jpg"
  }
];

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
        alternateNames: (json['alternate_names'] as List).map((item) => item as String).toList(),
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
        alternateActors: (json['alternate_actors'] as List).map((item) => item as String).toList(),
        alive: json['alive'] as bool,
        image: json['image'] as String,
      );
}
