import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

/// [OwnDictionaryViewState] is the view state of dictionary page
final class OwnDictionaryViewState extends Equatable {
  /// Constructor
  const OwnDictionaryViewState({
    required this.isLoading,
    this.words,
    this.infDicUser,
    this.wordDetails,
  });

  /// [isLoading] is the loading state of dictionary page
  final bool isLoading;

  /// [infDicUser] is the user of dictionary page
  final InfDicUser? infDicUser;

  /// [words] is the words of dictionary page
  final List<List<Word?>?>? words;

  /// [wordDetails] is the word details of dictionary page
  final List<WordDetail?>? wordDetails;

  @override
  List<Object?> get props => [isLoading, words, wordDetails, infDicUser];

  /// [copyWith] is the copy of [OwnDictionaryViewState]
  OwnDictionaryViewState copyWith({
    bool? isLoading,
    InfDicUser? infDicUser,
    List<List<Word?>?>? words,
    List<WordDetail?>? wordDetails,
  }) {
    return OwnDictionaryViewState(
      isLoading: isLoading ?? this.isLoading,
      words: words ?? this.words,
      infDicUser: infDicUser ?? this.infDicUser,
      wordDetails: wordDetails ?? this.wordDetails,
    );
  }
}
