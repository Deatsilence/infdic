part of '../view/auth/phone_number_verification_view.dart';

/// [PrefixPhoneNumberPicker] is the remember me checkbox
class PrefixPhoneNumberPicker extends StatefulWidget {
  /// Constructor
  const PrefixPhoneNumberPicker({
    super.key,
  });

  @override
  State<PrefixPhoneNumberPicker> createState() =>
      _PrefixPhoneNumberPickerState();
}

class _PrefixPhoneNumberPickerState extends State<PrefixPhoneNumberPicker>
    with PhoneNumberVerificationViewMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: PaddingManager.paddingManagerLessPaddingAll,
        child: InkWell(
          onTap: () => CustomCountryPicker(context: context).picker(
            hintText: LocaleKeys.general_text_form_field_search.tr(),
            onSelect: (country) {
              setState(() {
                selectedCountry = country;
              });
            },
          ),
          child: Text(
            '${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
