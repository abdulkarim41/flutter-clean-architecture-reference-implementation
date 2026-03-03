import 'package:json_annotation/json_annotation.dart';

class ApiResponseAnnotation {
  const ApiResponseAnnotation._();
}
const apiResponse = JsonSerializable(createFactory: true, createToJson: false);

class SerializableInt implements JsonConverter<int?, Object?> {
  const SerializableInt();
  @override
  int? fromJson(Object? json) {
    if (json == null) return null;
    if (json is int) return json;
    if (json is double) return json.toInt();
    
    return int.tryParse(json.toString());
  }
  @override
  Object? toJson(int? object) => object;
}

class SerializableString implements JsonConverter<String?, Object?> {
  const SerializableString();
  @override
  String? fromJson(Object? json) {
    if (json == null) return null;
    if (json is num) return json.toString();

    return json as String?;
  }
  @override
  Object? toJson(String? object) => object;
}

class SerializableDouble implements JsonConverter<double?, Object?> {
  const SerializableDouble();
  @override
  double? fromJson(Object? json) {
    if (json == null) return null;
    if (json is num) return json.toDouble();

    return double.tryParse(json.toString());
  }
  @override
  Object? toJson(double? object) => object;
}
