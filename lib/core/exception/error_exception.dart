class Exceptions implements Exception {
  const Exceptions({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}
