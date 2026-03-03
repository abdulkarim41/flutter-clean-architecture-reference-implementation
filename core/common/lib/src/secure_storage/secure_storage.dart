import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  factory SecureStorage() => _instance;

  SecureStorage._internal();

  static final SecureStorage _instance = SecureStorage._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future<String> get({required String key}) async {
    final value = await _storage.read(key: key);

    return value ?? '';
  }

  Future<void> set({required String key, required String? value}) {
    return _storage.write(key: key, value: value);
  }
}
