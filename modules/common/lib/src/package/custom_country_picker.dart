import 'package:common/common.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// [CustomCountryPicker] class for custom country picker
final class CustomCountryPicker {
  /// Constructor
  const CustomCountryPicker({
    required this.context,
  });

  /// [context] for build [CountryListThemeData]
  final BuildContext context;

  /// [picker] method for show country picker
  void picker({
    required void Function(Country) onSelect,
    void Function()? onClosed,
    String? hintText,
    List<String>? favorite,
    List<String>? exclude,
    List<String>? countryFilter,
    bool showPhoneCode = false,
    Widget Function(Country)? customFlagBuilder,
    CountryListThemeData? countryListTheme,
    bool searchAutofocus = false,
    bool showWorldWide = false,
    bool showSearch = true,
    bool useSafeArea = false,
    bool useRootNavigator = false,
  }) {
    final customCountryListThemeData = CountryListThemeData(
      bottomSheetHeight: 65.h,
      inputDecoration: CustomInputDecoration(
        hintText: hintText,
        borderColor: Theme.of(context).colorScheme.primary,
        enableBorderColor: Theme.of(context).colorScheme.secondary,
        deActiveBorderColor: Theme.of(context).colorScheme.secondary,
        errorBorderColor: Theme.of(context).colorScheme.error,
      ),
    );

    showCountryPicker(
      context: context,
      onSelect: onSelect,
      countryListTheme: countryListTheme ?? customCountryListThemeData,
      countryFilter: countryFilter,
      customFlagBuilder: customFlagBuilder,
      exclude: exclude,
      favorite: favorite,
      onClosed: onClosed,
      searchAutofocus: searchAutofocus,
      showPhoneCode: showPhoneCode,
      showSearch: showSearch,
      showWorldWide: showWorldWide,
      useRootNavigator: useRootNavigator,
      useSafeArea: useSafeArea,
    );
  }
}
