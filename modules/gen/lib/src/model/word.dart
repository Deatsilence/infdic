import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart';

@JsonSerializable()
@immutable

/// [Word] is the model of searched word
final class Word extends BaseModel<Word> with EquatableMixin {
  /// Constructor
  Word({
    this.id,
    this.wordEn,
    this.wordTr,
    this.type,
    this.category,
  });

  /// [id] is the id of searched word
  final int? id;

  /// [wordEn] is the english word of searched word
  final String? wordEn;

  /// [wordTr] is the turkish word of searched word
  final String? wordTr;

  /// [type] is the type of searched word
  final String? type;

  /// [category] is the category of searched word
  final String? category;

  /// [fromJson] is the json of [Word]
  @override
  Word fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  /// [toJson] is the json of [Word]
  @override
  Map<String, dynamic> toJson() => _$WordToJson(this);

  @override
  List<Object?> get props => [id, wordEn, wordTr, type, category];

  /// [copyWith] is the copy of [Word]
  Word copyWith({
    int? id,
    String? wordEn,
    String? wordTr,
    String? type,
    String? category,
  }) {
    return Word(
      id: id ?? this.id,
      wordEn: wordEn ?? this.wordEn,
      wordTr: wordTr ?? this.wordTr,
      type: type ?? this.type,
      category: category ?? this.category,
    );
  }
}
