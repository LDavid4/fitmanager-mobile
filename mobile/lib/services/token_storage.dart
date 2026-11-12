import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Cuvanje JWT tokena u bezbjednom skladistu uredjaja
/// (Android Keystore / iOS Keychain).
class TokenStorage {
  static const _key = 'jwt_token';
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<String?> read() => _storage.read(key: _key);

  static Future<void> save(String token) =>
      _storage.write(key: _key, value: token);

  static Future<void> clear() => _storage.delete(key: _key);
}
