import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';


abstract class Result extends Equatable {
  final Identifier? id;

  Result({
    required this.id,
  });
}


@JsonSerializable()
class Identifier {
  final String id;

  Identifier({String? id}) : id = id ?? Uuid().v4();

  factory Identifier.fromJson(Map<String, dynamic> json) =>
      _$IdentifierFromJson(json);
  Map<String, dynamic> toJson() => _$IdentifierToJson(this);

  bool operator ==(o) => o is Identifier && o.id == id;
  int get hashCode => id.hashCode;
}
Identifier _$IdentifierFromJson(Map<String, dynamic> json) => Identifier(
  id: json['id'] as String?,
);

Map<String, dynamic> _$IdentifierToJson(Identifier instance) =>
    <String, dynamic>{
      'id': instance.id,
    };