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

final class _AuthRowButtons extends StatelessWidget {
  const _AuthRowButtons({required this.buttons});

  final List<Widget> buttons;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buttons,
    );
  }
}
