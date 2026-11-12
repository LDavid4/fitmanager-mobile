/// Validatori unosa za forme. Vracaju poruku greske ili null.
class Validators {
  Validators._();

  static final RegExp _email = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');

  static String? required(String? value, [String field = 'Polje']) {
    if (value == null || value.trim().isEmpty) {
      return '$field je obavezno';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email je obavezan';
    }
    if (!_email.hasMatch(value.trim())) {
      return 'Unesite ispravnu email adresu';
    }
    return null;
  }

  /// Najmanje 8 karaktera, veliko i malo slovo, broj i specijalni znak.
  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Lozinka je obavezna';
    if (value.length < 8) return 'Lozinka mora imati najmanje 8 karaktera';
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Lozinka mora sadrzati bar jedno veliko slovo';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Lozinka mora sadrzati bar jedno malo slovo';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Lozinka mora sadrzati bar jedan broj';
    }
    if (!RegExp(r'[^A-Za-z0-9]').hasMatch(value)) {
      return 'Lozinka mora sadrzati bar jedan specijalni znak';
    }
    return null;
  }
}
