import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:infdic/product/utility/extension/custom_string_extension.dart';

/// [Validation] is a class that contains all validators
final class Validation {
  /// [emailValidator] is validator for email field
  String? emailValidator(String? value) =>
      value!.hasValue && InfDicRegExp().emailRegexp.hasMatch(value)
          ? null
          : LocaleKeys.auth_please_enter_a_valid_email.tr();

  /// [passwordValidator] is validator for password field
  String? passwordValidator(String? value) =>
      value.hasValue && InfDicRegExp().passwordRegexp.hasMatch(value!)
          ? null
          : LocaleKeys.auth_please_enter_a_valid_password.tr();
}
