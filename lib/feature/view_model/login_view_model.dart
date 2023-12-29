import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infdic/product/state/login_view_state.dart';

/// [LoginViewModel] is the view model of home page
final class LoginViewModel extends Cubit<LoginViewState> {
  /// Constructor
  LoginViewModel() : super(const LoginViewState(isLoading: false));

  void changeLoading() {}
}
