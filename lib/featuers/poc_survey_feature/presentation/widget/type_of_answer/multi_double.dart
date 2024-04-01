import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class MultiDouble {
  final String text;
  final double value;

  MultiDouble({
    required this.text,
    required this.value,
  }) : super();

  factory MultiDouble.fromJson(Map<String, dynamic> json) =>
      _$MultiDoubleFromJson(json);
  Map<String, dynamic> toJson() => _$MultiDoubleToJson(this);

  bool operator ==(o) => o is MultiDouble && text == o.text && value == o.value;
  int get hashCode => text.hashCode ^ value.hashCode;
}
MultiDouble _$MultiDoubleFromJson(Map<String, dynamic> json) => MultiDouble(
  text: json['text'] as String,
  value: (json['value'] as num).toDouble(),
);

Map<String, dynamic> _$MultiDoubleToJson(MultiDouble instance) =>
    <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };
