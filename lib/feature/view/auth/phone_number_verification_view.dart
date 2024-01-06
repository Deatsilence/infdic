import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/phone_number_verification_view_mixin.dart';
import 'package:infdic/feature/view/auth/base_view.dart';
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
  const PhoneNumberVerificationView({this.email, super.key});

  /// [email] is the phone number of user
  final String? email;

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
      child: Form(
        key: phoneNumberFormKey,
        child: BaseView(
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
                  validator: phoneNumberValidator,
                ),
                BlocBuilder<PhoneNumberVerificationViewModel,
                    PhoneNumberVerificationViewState>(
                  builder: (context, state) {
                    return AuthCustomElevatedButton(
                      onPressed: () {
                        onPhoneNumberPressed(
                          state: state.selectedCountry,
                          verificationFailed: (ex) {
                            debugPrint('onfail');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: ${ex.message}')),
                            );
                          },
                          codeAutoRetrievalTimeout: (value) {},
                        );
                      },
                      height: 8.h,
                      child: state.isLoading
                          ? CircularProgressIndicator.adaptive(
                              backgroundColor: Theme.of(context)
                                  .progressIndicatorTheme
                                  .color,
                            )
                          : const Text(LocaleKeys.general_button_send).tr(),
                    );
                  },
                ),
              ].seperate(space: 1.h),
            ),
          ),
        ),
      ),
    );
  }
}
