import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'definitions.g.dart';

@JsonSerializable()
@immutable

/// [Definitions] is the model of definitions
final class Definitions with EquatableMixin {
  /// Constructor
  const Definitions({
    this.definition,
    this.synonyms,
    this.antonyms,
    this.example,
  });

  /// [definition] is the definition of searched word
  factory Definitions.fromJson(Map<String, dynamic> json) =>
      _$DefinitionsFromJson(json);

  /// [definition] is the definition of searched word
  final String? definition;

  /// [synonyms] is the synonyms of searched word
  final List<String>? synonyms;

  /// [antonyms] is the antonyms of searched word
  final List<String>? antonyms;

  /// [example] is the example of searched word
  final String? example;

  /// [definition] is the definition of searched word
  Map<String, dynamic> toJson() => _$DefinitionsToJson(this);

  @override
  List<Object?> get props => [definition, synonyms, antonyms, example];
}
