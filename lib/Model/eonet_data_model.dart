// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String title;
  String description;
  String link;
  List<Event> events;

  Welcome({
    required this.title,
    required this.description,
    required this.link,
    required this.events,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    title: json["title"],
    description: json["description"],
    link: json["link"],
    events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "link": link,
    "events": List<dynamic>.from(events.map((x) => x.toJson())),
  };
}

class Event {
  String id;
  String title;
  String description;
  String link;
  List<Category> categories;
  List<Source> sources;
  List<Geometry> geometries;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.link,
    required this.categories,
    required this.sources,
    required this.geometries,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    link: json["link"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    sources: List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
    geometries: List<Geometry>.from(json["geometries"].map((x) => Geometry.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "link": link,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "sources": List<dynamic>.from(sources.map((x) => x.toJson())),
    "geometries": List<dynamic>.from(geometries.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  Title title;

  Category({
    required this.id,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: titleValues.map[json["title"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": titleValues.reverse[title],
  };
}

enum Title {
  SEA_AND_LAKE_ICE,
  SEVERE_STORMS,
  VOLCANOES,
  WILDFIRES
}

final titleValues = EnumValues({
  "Sea and Lake Ice": Title.SEA_AND_LAKE_ICE,
  "Severe Storms": Title.SEVERE_STORMS,
  "Volcanoes": Title.VOLCANOES,
  "Wildfires": Title.WILDFIRES
});

class Geometry {
  DateTime date;
  Type type;
  List<double> coordinates;

  Geometry({
    required this.date,
    required this.type,
    required this.coordinates,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    date: DateTime.parse(json["date"]),
    type: typeValues.map[json["type"]]!,
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "type": typeValues.reverse[type],
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

enum Type {
  POINT
}

final typeValues = EnumValues({
  "Point": Type.POINT
});

class Source {
  Id id;
  String url;

  Source({
    required this.id,
    required this.url,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: idValues.map[json["id"]]!,
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": idValues.reverse[id],
    "url": url,
  };
}

enum Id {
  BYU_ICE,
  CEMS,
  EARTHDATA,
  EO,
  GDACS,
  IDC,
  IRWIN,
  JTWC,
  NASA_DISP,
  NATICE,
  NOAA_NHC,
  RELIEF_WEB,
  SI_VOLCANO
}

final idValues = EnumValues({
  "BYU_ICE": Id.BYU_ICE,
  "CEMS": Id.CEMS,
  "Earthdata": Id.EARTHDATA,
  "EO": Id.EO,
  "GDACS": Id.GDACS,
  "IDC": Id.IDC,
  "IRWIN": Id.IRWIN,
  "JTWC": Id.JTWC,
  "NASA_DISP": Id.NASA_DISP,
  "NATICE": Id.NATICE,
  "NOAA_NHC": Id.NOAA_NHC,
  "ReliefWeb": Id.RELIEF_WEB,
  "SIVolcano": Id.SI_VOLCANO
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
