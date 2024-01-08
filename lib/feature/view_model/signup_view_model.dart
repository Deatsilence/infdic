import 'package:infdic/product/state/base/base_cubit.dart';
import 'package:infdic/product/state/login_view_state.dart';

/// [SignUpViewModel] is the view model of home page
final class SignUpViewModel extends BaseCubit<SignUpViewState> {
  /// Constructor
  SignUpViewModel() : super(const SignUpViewState());

  /// [changeLoading] is the loading state of home page
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}
