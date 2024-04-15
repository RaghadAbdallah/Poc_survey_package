
class TextChoice {
  final String text;
  final String value;
  final int optionValue;

  const TextChoice({
    required this.text,
    required this.value,
    required this.optionValue,
  }) : super();

  factory TextChoice.fromJson(Map<String, dynamic> json) =>
      _$TextChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$TextChoiceToJson(this);

  bool operator ==(o) => o is TextChoice && text == o.text && value == o.value && optionValue == o.optionValue;
  int get hashCode => text.hashCode ^ value.hashCode ^ optionValue.hashCode;
}
TextChoice _$TextChoiceFromJson(Map<String, dynamic> json) => TextChoice(
  text: json['AnswerDesc'] as String,
  value: json['AnswerID'] as String,
  optionValue: json['optionStatus'] as int,
);

Map<String, dynamic> _$TextChoiceToJson(TextChoice instance) =>
    <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
      'optionStatus': instance.optionValue,
    };
