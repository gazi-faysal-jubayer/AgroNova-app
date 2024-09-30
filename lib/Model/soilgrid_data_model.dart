import 'dart:convert';

Soilgrid soilgridFromJson(String str) => Soilgrid.fromJson(json.decode(str));

String soilgridToJson(Soilgrid data) => json.encode(data.toJson());

class Soilgrid {
  String type;
  Geometry geometry;
  Properties properties;

  Soilgrid({
    required this.type,
    required this.geometry,
    required this.properties,
  });

  factory Soilgrid.fromJson(Map<String, dynamic> json) => Soilgrid(
    type: json["type"],
    geometry: Geometry.fromJson(json["geometry"]),
    properties: Properties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "geometry": geometry.toJson(),
    "properties": properties.toJson(),
  };
}

class Geometry {
  List<double> coordinates;
  String type;

  Geometry({
    required this.coordinates,
    required this.type,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    "type": type,
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
  String code;
  String name;
  UnitMeasure unitMeasure;
  List<Depth> depths;

  Layer({
    required this.code,
    required this.name,
    required this.unitMeasure,
    required this.depths,
  });

  factory Layer.fromJson(Map<String, dynamic> json) => Layer(
    code: json["code"],
    name: json["name"],
    unitMeasure: UnitMeasure.fromJson(json["unit_measure"]),
    depths: List<Depth>.from(json["depths"].map((x) => Depth.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "unit_measure": unitMeasure.toJson(),
    "depths": List<dynamic>.from(depths.map((x) => x.toJson())),
  };
}

class Depth {
  Range range;
  String label;
  Map<String, num> values;

  Depth({
    required this.range,
    required this.label,
    required this.values,
  });

  factory Depth.fromJson(Map<String, dynamic> json) => Depth(
    range: Range.fromJson(json["range"]),
    label: json["label"],
    values: Map.from(json["values"]).map((k, v) => MapEntry<String, num>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "range": range.toJson(),
    "label": label,
    "values": Map.from(values).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class Range {
  int topDepth;
  int bottomDepth;
  String unitDepth;

  Range({
    required this.topDepth,
    required this.bottomDepth,
    required this.unitDepth,
  });

  factory Range.fromJson(Map<String, dynamic> json) => Range(
    topDepth: json["top_depth"],
    bottomDepth: json["bottom_depth"],
    unitDepth: json["unit_depth"],
  );

  Map<String, dynamic> toJson() => {
    "top_depth": topDepth,
    "bottom_depth": bottomDepth,
    "unit_depth": unitDepth,
  };
}

class UnitMeasure {
  num conversionFactor;
  String mappedUnits;
  String targetUnits;
  String uncertaintyUnit;

  UnitMeasure({
    required this.conversionFactor,
    required this.mappedUnits,
    required this.targetUnits,
    required this.uncertaintyUnit,
  });

  factory UnitMeasure.fromJson(Map<String, dynamic> json) => UnitMeasure(
    conversionFactor: json["conversion_factor"],
    mappedUnits: json["mapped_units"],
    targetUnits: json["target_units"],
    uncertaintyUnit: json["uncertainty_unit"],
  );

  Map<String, dynamic> toJson() => {
    "conversion_factor": conversionFactor,
    "mapped_units": mappedUnits,
    "target_units": targetUnits,
    "uncertainty_unit": uncertaintyUnit,
  };
}