// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TourAdapter extends TypeAdapter<Tour> {
  @override
  final int typeId = 0;

  @override
  Tour read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tour(
      id: fields[7] as int,
      name: fields[0] as String,
      description: fields[1] as String,
      category: fields[2] as String,
      location: fields[3] as String,
      price: fields[5] as double,
      availableSeats: fields[6] as int,
      startDate: fields[8] as DateTime,
      endDate: fields[9] as DateTime,
      imageUrl: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Tour obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.availableSeats)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.startDate)
      ..writeByte(9)
      ..write(obj.endDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TourAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
