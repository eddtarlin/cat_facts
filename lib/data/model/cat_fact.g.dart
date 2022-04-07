// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatFactAdapter extends TypeAdapter<CatFact> {
  @override
  final int typeId = 0;

  @override
  CatFact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatFact(
      date: fields[1] as String,
      fact: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatFact obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fact)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatFactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatFact _$CatFactFromJson(Map<String, dynamic> json) => CatFact(
      date: json['createdAt'] as String,
      fact: json['text'] as String,
    );

Map<String, dynamic> _$CatFactToJson(CatFact instance) => <String, dynamic>{
      'text': instance.fact,
      'createdAt': instance.date,
    };
