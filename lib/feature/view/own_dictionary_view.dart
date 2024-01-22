import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/own_dictionary_view_mixin.dart';
import 'package:infdic/feature/view/auth/base_view.dart';
import 'package:infdic/feature/view_model/own_dictionary_view_model.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:infdic/product/state/own_dictionary_view_state.dart';
import 'package:infdic/product/utility/extension/has_value_extension.dart';
import 'package:infdic/product/utility/extension/padding_extension.dart';
import 'package:infdic/product/widget/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';

/// [OwnDictionaryView] is the view of own dictionary page
@RoutePage()
class OwnDictionaryView extends StatefulWidget {
  /// Constructor
  const OwnDictionaryView({super.key});

  @override
  State<OwnDictionaryView> createState() => _OwnDictionaryViewState();
}

class _OwnDictionaryViewState extends State<OwnDictionaryView>
    with OwnDictionaryViewMixin {
  @override
  Widget build(BuildContext context) {
    debugPrint('OwnDictionaryView build');
    return BlocProvider(
      create: (context) => ownDictionaryViewModel,
      child: BaseView(
        onPageBuilder: (context, value) => SliverList(
          delegate: SliverChildListDelegate(
            [
              _OwnDictionaryBody(
                ownDictionaryViewModel: ownDictionaryViewModel,
                searchController: searchController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _OwnDictionaryBody extends StatelessWidget {
  const _OwnDictionaryBody({
    required this.ownDictionaryViewModel,
    required this.searchController,
  });

  final OwnDictionaryViewModel ownDictionaryViewModel;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextFormField(
          controller: searchController,
          prefixIcon: const Icon(Icons.search_rounded),
          hintText: LocaleKeys.general_text_form_field_search.tr(),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          // onFieldSubmitted: ownDictionaryViewModel.searchAWord,
        ),
        BlocBuilder<OwnDictionaryViewModel, OwnDictionaryViewState>(
          builder: (context, state) {
            debugPrint('debug print state: ${state.isLoading}');
            return state.isLoading
                ? const CircularProgressIndicator.adaptive()
                : state.infDicUser!.ownWords.hasValue
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.infDicUser?.ownWords.length,
                        itemBuilder: (BuildContext context, int index) {
                          debugPrint('debug print l');
                          return _OwnDetailOfWordCard(
                            words: state.words?[index] ?? [],
                            wordDetails: state.wordDetails ?? [],
                            index: index,
                            ownDictionaryViewModel: ownDictionaryViewModel,
                            infDicUser: state.infDicUser!,
                          );
                        },
                      )
                    : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

final class _OwnDetailOfWordCard extends StatefulWidget {
  const _OwnDetailOfWordCard({
    required this.words,
    required this.wordDetails,
    required this.index,
    required this.ownDictionaryViewModel,
    required this.infDicUser,
  });

  final OwnDictionaryViewModel ownDictionaryViewModel;
  final List<Word?> words;
  final List<WordDetail?> wordDetails;
  final int index;
  final InfDicUser infDicUser;

  @override
  State<_OwnDetailOfWordCard> createState() => _OwnDetailOfWordCardState();
}

class _OwnDetailOfWordCardState extends State<_OwnDetailOfWordCard> {
  @override
  void initState() {
    super.initState();
    debugPrint('index: ${widget.index}');
    debugPrint('ownWords: ${widget.infDicUser.ownWords[widget.index]}');
    debugPrint('words: ${widget.words}');
    debugPrint('word details: ${widget.wordDetails}');
    // widget.ownDictionaryViewModel.searchAWord(
    //   widget.infDicUser.ownWords[widget.index],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: double.infinity,
      child: Card(
        color: Theme.of(context).cardTheme.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusManager.moreBorderRadius,
        ),
        elevation: 5,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _TitleOfTheWord(
                words: widget.words,
                audioOfTheWord: widget.wordDetails.hasValue
                    ? widget.wordDetails.first?.phonetics?.first.audio ?? ''
                    : '',
              ).onlyPadding(top: 2.h, bottom: 2.h),
            ),
            SliverList.builder(
              itemCount: widget.words.length,
              itemBuilder: (context, index) => SizedBox(
                child: ColoredBox(
                  color: index.isEven
                      ? Theme.of(context).colorScheme.background
                      : Colors.transparent,
                  child: _RowOfAmean(words: widget.words, index: index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _TitleOfTheWord extends StatefulWidget {
  const _TitleOfTheWord({
    required this.words,
    required this.audioOfTheWord,
  });

  final List<Word?> words;
  final String audioOfTheWord;

  @override
  State<_TitleOfTheWord> createState() => _TitleOfTheWordState();
}

class _TitleOfTheWordState extends State<_TitleOfTheWord> {
  final player = AudioPlayer();
  bool _isPlaying = false;

  void initializeSourceUrlOfAudio(String url) {
    player
      ..setReleaseMode(ReleaseMode.release)
      ..setSourceUrl(url);
  }

  @override
  void initState() {
    super.initState();

    if (widget.audioOfTheWord.hasValue) {
      initializeSourceUrlOfAudio(widget.audioOfTheWord);

      player.onPlayerStateChanged.listen((event) {
        setState(() {
          _isPlaying = (event == PlayerState.completed);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: widget.audioOfTheWord.hasValue ? _onPlayAudio : null,
          child: Icon(
            Icons.volume_up_outlined,
            size: 24.sp,
            color: widget.audioOfTheWord.hasValue
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
          ),
        ),
        Text(
          widget.words.hasValue ? widget.words.first?.word_en ?? '' : '',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () async {
            await OwnDictionaryViewModel().addAWord(word: widget.words.first);
          },
          child: Icon(
            Icons.add_outlined,
            size: 24.sp,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Future<void> _onPlayAudio() async {
    _isPlaying ? await player.pause() : await player.resume();
  }
}

final class _RowOfAmean extends StatelessWidget {
  const _RowOfAmean({
    required this.words,
    required this.index,
  });

  final List<Word?> words;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        words[index]?.word_tr ?? '',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      subtitle: Text(
        words[index]?.type ?? '',
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: Theme.of(context).hintColor),
      ),
      trailing: Text(
        words[index]?.category ?? '',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
