import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "bloodtype" field.
  String? _bloodtype;
  String get bloodtype => _bloodtype ?? '';
  bool hasBloodtype() => _bloodtype != null;

  // "birthdate" field.
  String? _birthdate;
  String get birthdate => _birthdate ?? '';
  bool hasBirthdate() => _birthdate != null;

  // "diabete" field.
  bool? _diabete;
  bool get diabete => _diabete ?? false;
  bool hasDiabete() => _diabete != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _password = snapshotData['password'] as String?;
    _role = snapshotData['role'] as String?;
    _gender = snapshotData['gender'] as String?;
    _bloodtype = snapshotData['bloodtype'] as String?;
    _birthdate = snapshotData['birthdate'] as String?;
    _diabete = snapshotData['diabete'] as bool?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? firstName,
  String? lastName,
  String? password,
  String? role,
  String? gender,
  String? bloodtype,
  String? birthdate,
  bool? diabete,
  String? displayName,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
      'role': role,
      'gender': gender,
      'bloodtype': bloodtype,
      'birthdate': birthdate,
      'diabete': diabete,
      'display_name': displayName,
      'photo_url': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.password == e2?.password &&
        e1?.role == e2?.role &&
        e1?.gender == e2?.gender &&
        e1?.bloodtype == e2?.bloodtype &&
        e1?.birthdate == e2?.birthdate &&
        e1?.diabete == e2?.diabete &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.firstName,
        e?.lastName,
        e?.password,
        e?.role,
        e?.gender,
        e?.bloodtype,
        e?.birthdate,
        e?.diabete,
        e?.displayName,
        e?.photoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
