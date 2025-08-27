import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationRecord extends FirestoreRecord {
  MedicationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "grammage" field.
  double? _grammage;
  double get grammage => _grammage ?? 0.0;
  bool hasGrammage() => _grammage != null;

  // "frequency" field.
  String? _frequency;
  String get frequency => _frequency ?? '';
  bool hasFrequency() => _frequency != null;

  // "duree" field.
  String? _duree;
  String get duree => _duree ?? '';
  bool hasDuree() => _duree != null;

  // "datedebut" field.
  String? _datedebut;
  String get datedebut => _datedebut ?? '';
  bool hasDatedebut() => _datedebut != null;

  // "datefin" field.
  String? _datefin;
  String get datefin => _datefin ?? '';
  bool hasDatefin() => _datefin != null;

  // "medstate" field.
  String? _medstate;
  String get medstate => _medstate ?? '';
  bool hasMedstate() => _medstate != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _grammage = castToType<double>(snapshotData['grammage']);
    _frequency = snapshotData['frequency'] as String?;
    _duree = snapshotData['duree'] as String?;
    _datedebut = snapshotData['datedebut'] as String?;
    _datefin = snapshotData['datefin'] as String?;
    _medstate = snapshotData['medstate'] as String?;
    _note = snapshotData['note'] as String?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medication');

  static Stream<MedicationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicationRecord.fromSnapshot(s));

  static Future<MedicationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicationRecord.fromSnapshot(s));

  static MedicationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicationRecordData({
  String? nom,
  double? grammage,
  String? frequency,
  String? duree,
  String? datedebut,
  String? datefin,
  String? medstate,
  String? note,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'grammage': grammage,
      'frequency': frequency,
      'duree': duree,
      'datedebut': datedebut,
      'datefin': datefin,
      'medstate': medstate,
      'note': note,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicationRecordDocumentEquality implements Equality<MedicationRecord> {
  const MedicationRecordDocumentEquality();

  @override
  bool equals(MedicationRecord? e1, MedicationRecord? e2) {
    return e1?.nom == e2?.nom &&
        e1?.grammage == e2?.grammage &&
        e1?.frequency == e2?.frequency &&
        e1?.duree == e2?.duree &&
        e1?.datedebut == e2?.datedebut &&
        e1?.datefin == e2?.datefin &&
        e1?.medstate == e2?.medstate &&
        e1?.note == e2?.note &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(MedicationRecord? e) => const ListEquality().hash([
        e?.nom,
        e?.grammage,
        e?.frequency,
        e?.duree,
        e?.datedebut,
        e?.datefin,
        e?.medstate,
        e?.note,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is MedicationRecord;
}
