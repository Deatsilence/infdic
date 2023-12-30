import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/phone_number_verification_view_mixin.dart';
import 'package:infdic/feature/view/auth/base_auth_view.dart';
import 'package:infdic/feature/view/widget/index.dart';
import 'package:infdic/feature/view_model/phone_number_view_model.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:infdic/product/state/phone_number_view_state.dart';
import 'package:infdic/product/utility/extension/list_gutter_extension.dart';
import 'package:infdic/product/utility/extension/padding_extension.dart';
import 'package:infdic/product/widget/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';

part '../../part_of_view/part_of_phone_number_verification_view.dart';

/// [PhoneNumberVerificationView] is the view of phone number verification page
@RoutePage<bool?>()
final class PhoneNumberVerificationView extends StatefulWidget {
  /// Constructor
  const PhoneNumberVerificationView({super.key});

  @override
  State<PhoneNumberVerificationView> createState() =>
      _PhoneNumberVerificationViewState();
}

class _PhoneNumberVerificationViewState
    extends State<PhoneNumberVerificationView>
    with PhoneNumberVerificationViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => phoneNumberVerificationViewModel,
      child: BaseAuthView(
        onPageBuilder: (context, value) => SliverList(
          delegate: SliverChildListDelegate(
            [
              Assets.icons.icVerification.svg(package: 'gen', height: 30.h),
              const AuthTitle(
                title: LocaleKeys.auth_verification,
              ).onlyPadding(
                top: 1.h,
                bottom: 1.h,
              ),
              const Text(
                LocaleKeys.auth_verification_body,
              ).tr(),
              CustomTextFormField(
                controller: phoneNumberController,
                hintText: LocaleKeys
                    .general_text_form_field_please_enter_a_phone_number
                    .tr(),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(20),
                ],
                prefixIcon: PrefixPhoneNumberPicker(
                  viewModel: phoneNumberVerificationViewModel,
                ),
              ),
              BlocSelector<PhoneNumberVerificationViewModel,
                  PhoneNumberVerificationViewState, Country>(
                selector: (state) {
                  return state.selectedCountry;
                },
                builder: (context, state) {
                  return AuthCustomElevatedButton(
                    onPressed: () {
                      final phoneNumber = phoneNumberController.text.trim();

                      debugPrint(phoneNumberController.text);
                      debugPrint("+${state.phoneCode}$phoneNumber");
                      phoneNumberVerificationViewModel.sendVerfiyCodeToPhone(
                        context: context,
                        phoneNumber: "+${state.phoneCode}$phoneNumber",
                      );
                    },
                    child: const Text('Send'),
                  );
                },
              ),
            ].seperate(space: 1.h),
          ),
        ),
      ),
    );
  }
}
