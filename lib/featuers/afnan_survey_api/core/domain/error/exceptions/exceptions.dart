class ServerException implements Exception {
  const ServerException({this.message});
  final String? message;
}
class CacheException implements Exception {}
