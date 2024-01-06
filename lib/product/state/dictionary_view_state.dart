import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

/// [DictionaryViewState] is the view state of dictionary page
final class DictionaryViewState extends Equatable {
  /// Constructor
  const DictionaryViewState({
    required this.isLoading,
    this.infDicUser,
    this.word,
  });

  /// [isLoading] is the loading state of dictionary page
  final bool isLoading;

  /// [infDicUser] is the user of dictionary page
  final InfDicUser? infDicUser;

  /// [word] is the word of dictionary page
  final Word? word;

  @override
  List<Object?> get props => [isLoading, infDicUser, word];

  /// [copyWith] is the copy of [DictionaryViewState]
  DictionaryViewState copyWith({
    bool? isLoading,
    InfDicUser? infDicUser,
    Word? word,
  }) {
    return DictionaryViewState(
      isLoading: isLoading ?? this.isLoading,
      infDicUser: infDicUser ?? this.infDicUser,
      word: word ?? this.word,
    );
  }
}
