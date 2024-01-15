import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:json_annotation/json_annotation.dart';

part 'word_detail.g.dart';

@JsonSerializable()
@immutable

/// [WordDetail] is the model of searched word
final class WordDetail extends BaseModel<WordDetail> with EquatableMixin {
  /// Constructor
  WordDetail({
    this.word,
    this.phonetic,
    this.phonetics,
    this.meanings,
    this.license,
    this.sourceUrls,
  });

  /// [word] is the word of searched word
  final String? word;

  /// [phonetic] is the phonetic of searched word
  final String? phonetic;

  /// [phonetics] is the phonetics of searched word
  final List<Phonetics>? phonetics;

  /// [meanings] is the meanings of searched word
  final List<Meanings>? meanings;

  /// [license] is the license of searched word
  final License? license;

  /// [sourceUrls] is the sourceUrls of searched word
  final List<String>? sourceUrls;

  @override
  WordDetail fromJson(Map<String, dynamic> json) => _$WordDetailFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WordDetailToJson(this);

  @override
  List<Object?> get props =>
      [word, phonetic, phonetics, meanings, license, sourceUrls];
}
