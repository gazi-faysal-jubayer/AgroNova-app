// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String type;
  Geometry geometry;
  Properties properties;
  double queryTimeS;

  Welcome({
    required this.type,
    required this.geometry,
    required this.properties,
    required this.queryTimeS,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        type: json["type"],
        geometry: Geometry.fromJson(json["geometry"]),
        properties: Properties.fromJson(json["properties"]),
        queryTimeS: json["query_time_s"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "geometry": geometry.toJson(),
        "properties": properties.toJson(),
        "query_time_s": queryTimeS,
      };
}

class Geometry {
  String type;
  List<double> coordinates;

  Geometry({
    required this.type,
    required this.coordinates,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class Properties {
  List<Layer> layers;

  Properties({
    required this.layers,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        layers: List<Layer>.from(json["layers"].map((x) => Layer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "layers": List<dynamic>.from(layers.map((x) => x.toJson())),
      };
}

class Layer {
  String name;
  UnitMeasure unitMeasure;
  List<Depth> depths;

  Layer({
    required this.name,
    required this.unitMeasure,
    required this.depths,
  });

  factory Layer.fromJson(Map<String, dynamic> json) => Layer(
        name: json["name"],
        unitMeasure: UnitMeasure.fromJson(json["unit_measure"]),
        depths: List<Depth>.from(json["depths"].map((x) => Depth.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "unit_measure": unitMeasure.toJson(),
        "depths": List<dynamic>.from(depths.map((x) => x.toJson())),
      };
}

class Depth {
  Range range;
  Label label;
  Values values;

  Depth({
    required this.range,
    required this.label,
    required this.values,
  });

  factory Depth.fromJson(Map<String, dynamic> json) => Depth(
        range: Range.fromJson(json["range"]),
        label: labelValues.map[json["label"]]!,
        values: Values.fromJson(json["values"]),
      );

  Map<String, dynamic> toJson() => {
        "range": range.toJson(),
        "label": labelValues.reverse[label],
        "values": values.toJson(),
      };
}

enum Label {
  THE_030_CM,
  THE_05_CM,
  THE_100200_CM,
  THE_1530_CM,
  THE_3060_CM,
  THE_515_CM,
  THE_60100_CM
}

final labelValues = EnumValues({
  "0-30cm": Label.THE_030_CM,
  "0-5cm": Label.THE_05_CM,
  "100-200cm": Label.THE_100200_CM,
  "15-30cm": Label.THE_1530_CM,
  "30-60cm": Label.THE_3060_CM,
  "5-15cm": Label.THE_515_CM,
  "60-100cm": Label.THE_60100_CM
});

class Range {
  int topDepth;
  int bottomDepth;
  UnitDepth unitDepth;

  Range({
    required this.topDepth,
    required this.bottomDepth,
    required this.unitDepth,
  });

  factory Range.fromJson(Map<String, dynamic> json) => Range(
        topDepth: json["top_depth"],
        bottomDepth: json["bottom_depth"],
        unitDepth: unitDepthValues.map[json["unit_depth"]]!,
      );

  Map<String, dynamic> toJson() => {
        "top_depth": topDepth,
        "bottom_depth": bottomDepth,
        "unit_depth": unitDepthValues.reverse[unitDepth],
      };
}

enum UnitDepth { CM }

final unitDepthValues = EnumValues({"cm": UnitDepth.CM});

class Values {
  dynamic q005;
  dynamic q05;
  dynamic q095;
  dynamic mean;
  dynamic uncertainty;

  Values({
    required this.q005,
    required this.q05,
    required this.q095,
    required this.mean,
    required this.uncertainty,
  });

  factory Values.fromJson(Map<String, dynamic> json) => Values(
        q005: json["Q0.05"],
        q05: json["Q0.5"],
        q095: json["Q0.95"],
        mean: json["mean"],
        uncertainty: json["uncertainty"],
      );

  Map<String, dynamic> toJson() => {
        "Q0.05": q005,
        "Q0.5": q05,
        "Q0.95": q095,
        "mean": mean,
        "uncertainty": uncertainty,
      };
}

class UnitMeasure {
  int dFactor;
  String mappedUnits;
  String targetUnits;
  String uncertaintyUnit;

  UnitMeasure({
    required this.dFactor,
    required this.mappedUnits,
    required this.targetUnits,
    required this.uncertaintyUnit,
  });

  factory UnitMeasure.fromJson(Map<String, dynamic> json) => UnitMeasure(
        dFactor: json["d_factor"],
        mappedUnits: json["mapped_units"],
        targetUnits: json["target_units"],
        uncertaintyUnit: json["uncertainty_unit"],
      );

  Map<String, dynamic> toJson() => {
        "d_factor": dFactor,
        "mapped_units": mappedUnits,
        "target_units": targetUnits,
        "uncertainty_unit": uncertaintyUnit,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
