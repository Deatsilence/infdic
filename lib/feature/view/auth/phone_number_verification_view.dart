import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/phone_number_verification_view_mixin.dart';
import 'package:infdic/feature/view/auth/base_auth_view.dart';
import 'package:infdic/feature/view/widget/index.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:infdic/product/utility/extension/list_gutter_extension.dart';
import 'package:infdic/product/utility/extension/padding_extension.dart';
import 'package:infdic/product/widget/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';

part '../../part_of_view/part_of_phone_number_verification_view.dart';

/// [PhoneNumberVerificationView] is the view of phone number verification page
@RoutePage<bool?>()
class PhoneNumberVerificationView extends StatefulWidget {
  /// Constructor
  const PhoneNumberVerificationView({super.key});

  @override
  State<PhoneNumberVerificationView> createState() =>
      _PhoneNumberVerificationViewState();
}

class _PhoneNumberVerificationViewState
    extends State<PhoneNumberVerificationView> {
  @override
  Widget build(BuildContext context) {
    return BaseAuthView(
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
              hintText: LocaleKeys
                  .general_text_form_field_please_enter_a_phone_number
                  .tr(),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(20),
              ],
              prefixIcon: const PrefixPhoneNumberPicker(),
            ),
            AuthCustomElevatedButton(
              onPressed: () {},
              child: const Text('Send'),
            ),
          ].seperate(space: 1.h),
        ),
      ),
    );
  }
}
