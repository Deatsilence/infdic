import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/dictionary_view_mixin.dart';
import 'package:infdic/feature/view/auth/base_view.dart';
import 'package:infdic/feature/view_model/dictionary_view_model.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:infdic/product/state/dictionary_view_state.dart';
import 'package:infdic/product/utility/extension/has_value_extension.dart';
import 'package:infdic/product/widget/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';

/// [DictionaryView] is the view of dictionary page
@RoutePage()
final class DictionaryView extends StatefulWidget {
  /// Constructor
  const DictionaryView({super.key});

  @override
  State<DictionaryView> createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<DictionaryView>
    with DictionaryViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => dictionaryViewModel,
      child: BaseView(
        onPageBuilder: (context, value) => SliverList(
          delegate: SliverChildListDelegate(
            [
              _DictionaryBody(
                dictionaryViewModel: dictionaryViewModel,
                searchController: searchController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _DictionaryBody extends StatelessWidget {
  const _DictionaryBody({
    required this.dictionaryViewModel,
    required this.searchController,
  });

  final DictionaryViewModel dictionaryViewModel;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    dictionaryViewModel.getUser();
    return BlocBuilder<DictionaryViewModel, DictionaryViewState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              controller: searchController,
              prefixIcon: const Icon(Icons.search_rounded),
              hintText: LocaleKeys.general_text_form_field_search.tr(),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onFieldSubmitted: dictionaryViewModel.searchAWord,
            ),
            if (state.isLoading)
              const CircularProgressIndicator.adaptive()
            else
              state.words.hasValue
                  ? _DetailOfWorldCard(dictionaryViewModel: dictionaryViewModel)
                  : const Text(LocaleKeys.general_can_not_find_the_word).tr(),
          ],
        );
      },
    );
  }
}

final class _DetailOfWorldCard extends StatelessWidget {
  const _DetailOfWorldCard({required this.dictionaryViewModel});

  final DictionaryViewModel dictionaryViewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: Card(
        color: Theme.of(context).cardTheme.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusManager.moreBorderRadius,
        ),
        elevation: 5,
        child:
            BlocSelector<DictionaryViewModel, DictionaryViewState, List<Word?>>(
          selector: (state) {
            return state.words ?? [];
          },
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) => SizedBox(
                child: ColoredBox(
                  color: index.isEven
                      ? Theme.of(context).colorScheme.background
                      : Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(state[index]?.wordTr ?? ''),
                      Text(state[index]?.type ?? ''),
                      Text(state[index]?.category ?? ''),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
