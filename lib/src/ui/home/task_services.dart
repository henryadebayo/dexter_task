import 'package:cloud_firestore/cloud_firestore.dart';

import '../add_task/models/taskModel.dart';

class TaskServices {
  Stream<List<GeneralTaskModel>> getGeneralTask() => FirebaseFirestore.instance
      .collection('general_task')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((e) => GeneralTaskModel.fromJson(e.data()))
          .toList());
  Stream<List<GeneralTaskModel>> getDoneTask() => FirebaseFirestore.instance
      .collection('Done_tasks')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((e) => GeneralTaskModel.fromJson(e.data()))
          .toList());

  Future addTask(
      {required GeneralTaskModel generalTaskModel,
      required String collectionId}) async {
    final task = FirebaseFirestore.instance.collection(collectionId).doc();
    generalTaskModel.id = task.id;
    final json = generalTaskModel.toJson();
    await task.set(json);
  }

  Stream<dynamic>? done({required String id}) {
    final doneAction =
        FirebaseFirestore.instance.collection("general_task").doc(id);
    doneAction.delete();
  }
}
