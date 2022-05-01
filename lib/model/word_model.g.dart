part of 'word_model.dart';

class DengeWordAdapter extends TypeAdapter<DengeWord> {
  @override
  final int typeId = 1;

  @override
  DengeWord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DengeWord(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DengeWord obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.turkish)
      ..writeByte(1)
      ..write(obj.english);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DengeWordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
