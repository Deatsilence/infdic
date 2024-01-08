part of '../view/auth/phone_number_verification_view.dart';

/// [PrefixPhoneNumberPicker] is the remember me checkbox
final class PrefixPhoneNumberPicker extends StatefulWidget {
  /// Constructor
  const PrefixPhoneNumberPicker({
    required this.viewModel,
    super.key,
  });

  /// [viewModel] is the view model of phone number page
  final PhoneNumberVerificationViewModel viewModel;

  @override
  State<PrefixPhoneNumberPicker> createState() =>
      _PrefixPhoneNumberPickerState();
}

class _PrefixPhoneNumberPickerState extends State<PrefixPhoneNumberPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: PaddingManager.paddingManagerLessPaddingAll,
        child: InkWell(
          onTap: () => CustomCountryPicker(context: context).picker(
            hintText: LocaleKeys.general_text_form_field_search.tr(),
            onSelect: (country) {
              widget.viewModel.selectACountry(country);
            },
          ),
          child: BlocSelector<PhoneNumberVerificationViewModel,
              PhoneNumberVerificationViewState, Country>(
            selector: (state) {
              return state.selectedCountry;
            },
            builder: (context, state) {
              return Text(
                '${state.flagEmoji} + ${state.phoneCode}',
                style: Theme.of(context).textTheme.titleLarge,
              );
            },
          ),
        ),
      ),
    );
  }
}
