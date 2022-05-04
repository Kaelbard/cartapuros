import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'procura_puros_record.g.dart';

abstract class ProcuraPurosRecord
    implements Built<ProcuraPurosRecord, ProcuraPurosRecordBuilder> {
  static Serializer<ProcuraPurosRecord> get serializer =>
      _$procuraPurosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Text')
  String get text;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProcuraPurosRecordBuilder builder) =>
      builder..text = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('procura_puros');

  static Stream<ProcuraPurosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProcuraPurosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProcuraPurosRecord._();
  factory ProcuraPurosRecord(
          [void Function(ProcuraPurosRecordBuilder) updates]) =
      _$ProcuraPurosRecord;

  static ProcuraPurosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProcuraPurosRecordData({
  String text,
}) =>
    serializers.toFirestore(ProcuraPurosRecord.serializer,
        ProcuraPurosRecord((p) => p..text = text));
