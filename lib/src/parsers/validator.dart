import 'package:phone_numbers_parser/src/constants.dart';

import '../models/country_phone_description.dart';
import '../regexp_fix.dart';

/// responsible of validating phone numbers
class Validator {
  /// Returns whether or not a national number is viable
  ///
  /// [nsn] national number without country code,
  /// international prefix, or national prefix
  static bool isValidNationalNumber(
    String nationalNumber,
    CountryPhoneDescription desc,
  ) {
    if (nationalNumber.length < Constants.MIN_LENGTH_FOR_NSN) {
      return false;
    }
    final pattern = desc.validation.general.pattern;
    return RegExp(pattern).matchEntirely(nationalNumber) != null;
  }
}
