class ServerException implements Exception {
  const ServerException();
}

class CacheException implements Exception {
  const CacheException();
}

class NetworkException implements Exception {
  const NetworkException();
}

class AuthException implements Exception {
  final String message;
  
  const AuthException(this.message);
}

class ValidationException implements Exception {
  final String message;
  
  const ValidationException(this.message);
}