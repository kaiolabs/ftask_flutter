import '../../presenter/theme/lexicon.dart';
import 'validation_base.dart';

class SecretValidator implements ValidationBase {
  final String? _value;

  SecretValidator(this._value);

  @override
  String? validate() {
    if (_value?.isEmpty ?? true) return Lexicon.fillTheFieldToSubmit;
    return null;
  }

  String? secretMatches(String? passwordToMatch) {
    if (_value?.isEmpty ?? true) return Lexicon.fillTheFieldToSubmit;
    if (_value != passwordToMatch) return Lexicon.passwordsDoNotMatch;
    return null;
  }
}
