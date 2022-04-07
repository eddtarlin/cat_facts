import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cat_fact.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class CatFact extends HiveObject {
  @JsonKey(name: "text")
  @HiveField(0)
  final String fact;

  @JsonKey(name: "createdAt")
  @HiveField(1)
  final String date;
  CatFact({
    required this.date,
    required this.fact,
  });

  factory CatFact.fromJson(Map<String, dynamic> json) =>
      _$CatFactFromJson(json);

  Map<String, dynamic> toJson() => _$CatFactToJson(this);
}
