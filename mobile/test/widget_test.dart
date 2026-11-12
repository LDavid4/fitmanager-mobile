import 'package:flutter_test/flutter_test.dart';
import 'package:fitmanager/utils/validators.dart';

void main() {
  group('Validators.password', () {
    test('odbija kratku lozinku', () {
      expect(Validators.password('Ab1!'), isNotNull);
    });

    test('odbija lozinku bez specijalnog znaka', () {
      expect(Validators.password('Lozinka123'), isNotNull);
    });

    test('prihvata ispravnu lozinku', () {
      expect(Validators.password('Lozinka123!'), isNull);
    });
  });

  group('Validators.email', () {
    test('odbija neispravan email', () {
      expect(Validators.email('david@'), isNotNull);
    });

    test('prihvata ispravan email', () {
      expect(Validators.email('david@example.com'), isNull);
    });
  });
}
