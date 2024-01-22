import 'package:infdic/product/state/base/base_cubit.dart';

/// [BaseViewModel] is the view model of home page
abstract class BaseViewModel<T extends BaseCubit> extends BaseCubit<T> {
  /// Constructor
  BaseViewModel(super.instance);

  /// [changeLoading] is the loading state of home page
  void changeLoading();
}
