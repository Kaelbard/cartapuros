import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'buscar_charutos_record.g.dart';

abstract class BuscarCharutosRecord
    implements Built<BuscarCharutosRecord, BuscarCharutosRecordBuilder> {
  static Serializer<BuscarCharutosRecord> get serializer =>
      _$buscarCharutosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Keyword')
  BuiltList<String> get keyword;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BuscarCharutosRecordBuilder builder) =>
      builder..keyword = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Buscar_Charutos');

  static Stream<BuscarCharutosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BuscarCharutosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  BuscarCharutosRecord._();
  factory BuscarCharutosRecord(
          [void Function(BuscarCharutosRecordBuilder) updates]) =
      _$BuscarCharutosRecord;

  static BuscarCharutosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBuscarCharutosRecordData() =>
    serializers.toFirestore(BuscarCharutosRecord.serializer,
        BuscarCharutosRecord((b) => b..keyword = null));
