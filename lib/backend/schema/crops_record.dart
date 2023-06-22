import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CropsRecord extends FirestoreRecord {
  CropsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;


  int? _count;
  int get count => _count ?? 0;
  bool hasCount()  => _count != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _count = snapshotData['count'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Crops');

  static Stream<CropsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CropsRecord.fromSnapshot(s));

  static Future<CropsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CropsRecord.fromSnapshot(s));

  static CropsRecord fromSnapshot(DocumentSnapshot snapshot) => CropsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CropsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CropsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CropsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createCropsRecordData({
  String? name,
  DateTime? dateCreated,
  String? description,
  int? count
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'dateCreated': dateCreated,
      'description': description,
      'count': count,
    }.withoutNulls,
  );

  return firestoreData;
}
