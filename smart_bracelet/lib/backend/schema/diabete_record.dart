import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiabeteRecord extends FirestoreRecord {
  DiabeteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dose" field.
  double? _dose;
  double get dose => _dose ?? 0.0;
  bool hasDose() => _dose != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  void _initializeFields() {
    _dose = castToType<double>(snapshotData['dose']);
    _note = snapshotData['note'] as String?;
    _uid = snapshotData['uid'] as String?;
    _date = snapshotData['date'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('diabete');

  static Stream<DiabeteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiabeteRecord.fromSnapshot(s));

  static Future<DiabeteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DiabeteRecord.fromSnapshot(s));

  static DiabeteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiabeteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiabeteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiabeteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiabeteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiabeteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiabeteRecordData({
  double? dose,
  String? note,
  String? uid,
  String? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dose': dose,
      'note': note,
      'uid': uid,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiabeteRecordDocumentEquality implements Equality<DiabeteRecord> {
  const DiabeteRecordDocumentEquality();

  @override
  bool equals(DiabeteRecord? e1, DiabeteRecord? e2) {
    return e1?.dose == e2?.dose &&
        e1?.note == e2?.note &&
        e1?.uid == e2?.uid &&
        e1?.date == e2?.date;
  }

  @override
  int hash(DiabeteRecord? e) =>
      const ListEquality().hash([e?.dose, e?.note, e?.uid, e?.date]);

  @override
  bool isValidKey(Object? o) => o is DiabeteRecord;
}
