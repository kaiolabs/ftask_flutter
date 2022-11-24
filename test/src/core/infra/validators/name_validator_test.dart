import 'package:flutter_test/flutter_test.dart';
import 'package:task/src/core/infra/validators/name_validator.dart';
import 'package:task/src/core/presenter/theme/lexicon.dart';

void main() {
  test('Test if NameValidator returns null if name is valid', () {
    final NameValidator validator = NameValidator('Valid Name');
    expect(validator.validate(), null);
  });

  test('Test if NameValidator returns error if name is null', () {
    final NameValidator validator = NameValidator(null);
    expect(validator.validate(), equals(Lexicon.fillTheFieldToSubmit));
  });

  test('Test if NameValidator returns error if name is empty', () {
    final NameValidator validator = NameValidator('');
    expect(validator.validate(), equals(Lexicon.fillTheFieldToSubmit));
  });

  test('Test if NameValidator returns error if name is too long', () {
    final NameValidator validator = NameValidator(invalidName);
    expect(validator.validate(), equals(Lexicon.nameTooLong));
  });

  test('Test if name has a length of 69', () {
    final NameValidator validator = NameValidator(validName);
    expect(validator.validate(), null);
  });
}

const String validName = "My name is too long so I can still be valid and here we go im still g";
const String invalidName = "My name is too long so I can't be valid My name is too long so I can't be valid";
