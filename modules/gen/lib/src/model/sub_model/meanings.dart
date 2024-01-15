import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/sub_model/definitions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meanings.g.dart';

@JsonSerializable()
@immutable

/// [Meanings] is the model of meanings
final class Meanings with EquatableMixin {
  /// Constructor
  const Meanings({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });

  factory Meanings.fromJson(Map<String, dynamic> json) =>
      _$MeaningsFromJson(json);

  /// [partOfSpeech] is the partOfSpeech of searched word
  final String? partOfSpeech;

  /// [definitions] is the definitions of searched word
  final List<Definitions>? definitions;

  /// [synonyms] is the synonyms of searched word
  final List<String>? synonyms;

  /// [antonyms] is the antonyms of searched word
  final List<String>? antonyms;

  Map<String, dynamic> toJson() => _$MeaningsToJson(this);

  @override
  List<Object?> get props => [partOfSpeech, definitions, synonyms, antonyms];
}
