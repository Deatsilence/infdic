part of '../view/login_view.dart';

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
            LocaleKeys.login_remember_me,
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
          labelText: LocaleKeys.login_email.tr(),
        ),
        CustomTextFormField(
          prefixIcon: const Icon(Icons.password_outlined),
          labelText: LocaleKeys.login_password.tr(),
        ),
      ],
    );
  }
}

final class _SignInTitle extends StatelessWidget {
  const _SignInTitle();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        LocaleKeys.login_title,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ).tr(),
    );
  }
}

final class _LoginSvg extends StatelessWidget {
  const _LoginSvg();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusManager.moreBorderRadius,
      ),
      color: Theme.of(context).colorScheme.outlineVariant,
      child: Assets.icons.icLogin.svg(package: 'gen'),
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
            LocaleKeys.login_or,
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
            child: const Text(LocaleKeys.login_google).tr(),
          ),
        ),
        SizedBox(
          height: 8.h,
          width: 45.w,
          child: AuthCustomElevatedButton(
            onPressed: () {},
            child: const Text(LocaleKeys.login_title).tr(),
          ),
        ),
      ],
    );
  }
}
