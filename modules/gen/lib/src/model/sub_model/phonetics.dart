import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/sub_model/license.dart';
import 'package:json_annotation/json_annotation.dart';

part 'phonetics.g.dart';

@JsonSerializable()
@immutable

/// [Phonetics] is the model of phonetics
final class Phonetics with EquatableMixin {
  /// Constructor
  const Phonetics({this.text, this.audio, this.sourceUrl, this.license});

  factory Phonetics.fromJson(Map<String, dynamic> json) =>
      _$PhoneticsFromJson(json);

  /// [text] is the text of searched word
  final String? text;

  /// [audio] is the audio of searched word
  final String? audio;

  /// [sourceUrl] is the sourceUrl of searched word
  final String? sourceUrl;

  /// [license] is the license of searched word
  final License? license;

  Map<String, dynamic> toJson() => _$PhoneticsToJson(this);

  @override
  List<Object?> get props => [text, audio, sourceUrl, license];
}
