import '../../presenter/theme/lexicon.dart';
import 'validation_base.dart';

class StringValidator implements ValidationBase {
  final String? _value;

  StringValidator(this._value);

  @override
  String? validate() {
    if (_value?.isEmpty ?? true) return Lexicon.fillTheFieldToSubmit;
    if (_value != null && _value!.length > 70) return Lexicon.nameTooLong;
    return null;
  }
}
