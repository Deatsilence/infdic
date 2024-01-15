import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

/// [DictionaryViewState] is the view state of dictionary page
final class DictionaryViewState extends Equatable {
  /// Constructor
  const DictionaryViewState({
    required this.isLoading,
    this.infDicUser,
    this.words,
    this.wordDetails,
  });

  /// [isLoading] is the loading state of dictionary page
  final bool isLoading;

  /// [infDicUser] is the user of dictionary page
  final InfDicUser? infDicUser;

  /// [words] is the words of dictionary page
  final List<Word?>? words;

  /// [wordDetails] is the wordDetails of dictionary page
  final List<WordDetail?>? wordDetails;

  @override
  List<Object?> get props => [isLoading, infDicUser, words, wordDetails];

  /// [copyWith] is the copy of [DictionaryViewState]
  DictionaryViewState copyWith({
    bool? isLoading,
    InfDicUser? infDicUser,
    List<Word?>? words,
    List<WordDetail?>? wordDetails,
  }) {
    return DictionaryViewState(
      isLoading: isLoading ?? this.isLoading,
      infDicUser: infDicUser ?? this.infDicUser,
      words: words ?? this.words,
      wordDetails: wordDetails ?? this.wordDetails,
    );
  }
}
