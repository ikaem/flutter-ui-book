class HackerNewsApiException implements Exception {
  const HackerNewsApiException({this.statusCode, this.message});

  final int? statusCode;
  final String? message;
}
