
abstract class JsonConverter<T, S> {
  const JsonConverter();

  T fromJson(S json);
  S toJson(T object);
}
