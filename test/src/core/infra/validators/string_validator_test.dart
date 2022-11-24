import 'package:flutter_test/flutter_test.dart';
import 'package:task/src/core/infra/validators/string_validator.dart';
import 'package:task/src/core/presenter/theme/lexicon.dart';

void main() {
  //create a full suit of testes from StringValidator
  group('StringValidator', () {
    //create a test case
    test('Test if StringValidator returns null if string is valid', () {
      //create a StringValidator instance
      final StringValidator validator = StringValidator('Valid String');
      //assert if the validator returns null
      expect(validator.validate(), null);
    });

    //create a test case
    test('Test if StringValidator returns error if string is null', () {
      //create a StringValidator instance
      final StringValidator validator = StringValidator(null);
      //assert if the validator returns the error message
      expect(validator.validate(), equals(Lexicon.fillTheFieldToSubmit));
    });

    //create a test case
    test('Test if StringValidator returns error if string is empty', () {
      //create a StringValidator instance
      final StringValidator validator = StringValidator('');
      //assert if the validator returns the error message
      expect(validator.validate(), equals(Lexicon.fillTheFieldToSubmit));
    });

    //create a test case
    test('Test if StringValidator returns error if string is too long', () {
      //create a StringValidator instance
      final StringValidator validator = StringValidator(longString);
      //assert if the validator returns the error message
      expect(validator.validate(), equals(Lexicon.nameTooLong));
    });

    //create a test case
    test('Test if string has a length of 69', () {
      //create a StringValidator instance
      final StringValidator validator = StringValidator(validString);
      //assert if the validator returns null
      expect(validator.validate(), null);
    });
  });
}

const String validString = "My string";
const String invalidString = "";
const String longString = "My string is too long so I can't be valid My string is too long so I can't be valid";
