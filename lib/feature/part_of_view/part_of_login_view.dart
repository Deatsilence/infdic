part of '../view/auth/login_view.dart';

final class _RememberMeCheckBox extends StatelessWidget {
  const _RememberMeCheckBox();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Checkbox.adaptive(
            value: true,
            onChanged: (value) {},
          ),
          Text(
            LocaleKeys.auth_remember_me,
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
        ],
      ),
    );
  }
}

final class _EmailAndPasswordTextFields extends StatelessWidget {
  const _EmailAndPasswordTextFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          prefixIcon: const Icon(Icons.email_outlined),
          labelText: LocaleKeys.auth_email.tr(),
          keyboardType: TextInputType.emailAddress,
        ),
        CustomTextFormField(
          prefixIcon: const Icon(Icons.password_outlined),
          labelText: LocaleKeys.auth_password.tr(),
          keyboardType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}

final class _AuthDivider extends StatelessWidget {
  const _AuthDivider();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Divider(
          endIndent: 60.w,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            LocaleKeys.auth_or,
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
        ),
        Divider(
          indent: 60.w,
        ),
      ],
    );
  }
}

final class _AuthLoginButtons extends StatelessWidget {
  const _AuthLoginButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 8.h,
          width: 45.w,
          child: AuthCustomElevatedButton(
            onPressed: () {},
            child: const Text(LocaleKeys.auth_google).tr(),
          ),
        ),
        SizedBox(
          height: 8.h,
          width: 45.w,
          child: AuthCustomElevatedButton(
            onPressed: () {},
            child: const Text(LocaleKeys.auth_login).tr(),
          ),
        ),
      ],
    );
  }
}
