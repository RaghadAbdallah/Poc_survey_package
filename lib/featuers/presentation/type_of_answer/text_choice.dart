
class TextChoice {
  final String text;
  final String value;

  const TextChoice({
    required this.text,
    required this.value,
  }) : super();

  factory TextChoice.fromJson(Map<String, dynamic> json) =>
      _$TextChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$TextChoiceToJson(this);

  bool operator ==(o) => o is TextChoice && text == o.text && value == o.value;
  int get hashCode => text.hashCode ^ value.hashCode;
}
TextChoice _$TextChoiceFromJson(Map<String, dynamic> json) => TextChoice(
  text: json['EvalToolDetailDesc'] as String,
  value: json['EvalToolDetailID'] as String,
);

Map<String, dynamic> _$TextChoiceToJson(TextChoice instance) =>
    <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };
