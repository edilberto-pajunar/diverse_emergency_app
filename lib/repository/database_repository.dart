import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseRepository {
  Future<T?> getData<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
  }) async {
    final DocumentReference reference = FirebaseFirestore.instance.doc(path);
    final DocumentSnapshot snapshot = await reference.get();
    if (!snapshot.exists) return null;

    return builder(snapshot.data() as Map<String, dynamic>, snapshot.id);
  }

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = true,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(data, SetOptions(merge: true));
  }

  Future<bool> docExists({
    required String path,
  }) async {
    final DocumentReference reference = FirebaseFirestore.instance.doc(path);

    return (await reference.get()).exists;
  }

  StreamSubscription? _docStreamSub;

  Stream<T?> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
  }) {
    final streamController = StreamController<T?>();
    final DocumentReference reference = FirebaseFirestore.instance.doc(path);
    final Stream<DocumentSnapshot> snapshots = reference.snapshots();
    _docStreamSub = snapshots.listen(
      (snapshot) {
        final data = snapshot.data();
        if (streamController.isClosed) return;
        if (data != null) {
          streamController.add(
              builder(snapshot.data() as Map<String, dynamic>, snapshot.id));
        } else {
          streamController.add(null);
        }
      },
      onError: (error) {
        if (error is FirebaseException && error.code == "permission-denied") {
          return;
        }
      },
      cancelOnError: true,
    );

    streamController.onCancel = streamController.close;

    return streamController.stream;
  }
}
