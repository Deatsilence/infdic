part of '../view/dictionary_view.dart';

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
          widget.words.first?.word_en ?? '',
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
