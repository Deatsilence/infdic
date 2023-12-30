import 'package:infdic/product/state/base/base_cubit.dart';
import 'package:infdic/product/state/login_view_state.dart';

/// [LoginViewModel] is the view model of home page
final class LoginViewModel extends BaseCubit<LoginViewState> {
  /// Constructor
  LoginViewModel() : super(const LoginViewState());

  void changeLoading() {}
  void checkSignIn() {}
}
