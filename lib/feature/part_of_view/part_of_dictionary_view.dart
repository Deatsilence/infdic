part of '../view/dictionary_view.dart';

final class _TitleOfTheWord extends StatelessWidget {
  const _TitleOfTheWord({required this.words});

  final List<Word?> words;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.volume_up_outlined,
          size: 24.sp,
          color: Theme.of(context).colorScheme.primary,
        ),
        Text(
          words.first?.word_en ?? '',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.add_outlined,
          size: 24.sp,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
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
