import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentRecord extends FirestoreRecord {
  AppointmentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "rappel" field.
  bool? _rappel;
  bool get rappel => _rappel ?? false;
  bool hasRappel() => _rappel != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _name = snapshotData['name'] as String?;
    _date = snapshotData['date'] as String?;
    _time = snapshotData['time'] as String?;
    _note = snapshotData['note'] as String?;
    _rappel = snapshotData['rappel'] as bool?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointment');

  static Stream<AppointmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentRecord.fromSnapshot(s));

  static Future<AppointmentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentRecord.fromSnapshot(s));

  static AppointmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentRecordData({
  String? uid,
  String? name,
  String? date,
  String? time,
  String? note,
  bool? rappel,
  String? email,
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'name': name,
      'date': date,
      'time': time,
      'note': note,
      'rappel': rappel,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentRecordDocumentEquality implements Equality<AppointmentRecord> {
  const AppointmentRecordDocumentEquality();

  @override
  bool equals(AppointmentRecord? e1, AppointmentRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.name == e2?.name &&
        e1?.date == e2?.date &&
        e1?.time == e2?.time &&
        e1?.note == e2?.note &&
        e1?.rappel == e2?.rappel &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(AppointmentRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.name,
        e?.date,
        e?.time,
        e?.note,
        e?.rappel,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentRecord;
}
