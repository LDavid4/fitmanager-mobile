import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Konfiguracija ucitana iz .env fajla.
class Env {
  Env._();

  static String get apiUrl =>
      dotenv.env['API_URL'] ?? 'http://10.0.2.2:5000/api';
}
