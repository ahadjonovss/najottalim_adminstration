import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class GroupsRepository {
  static FirebaseFirestore? firebaseFirestore;
  static FirebaseAuth? auth;

  static FirebaseAuth getAuthInstance() => auth ?? FirebaseAuth.instance;

  static FirebaseFirestore getFirebaseInstance() =>
      firebaseFirestore ?? FirebaseFirestore.instance;

  Future<MyResponse> getAllGroups() async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();

    try {
      var some = await instance.collection("groups").get();
      List<GroupModel> groups =
          some.docs.map((e) => GroupModel.fromJson(e.data())).toList();
      myResponse.data = groups;
    } catch (e) {
      myResponse.message = e.toString();
    }

    return myResponse;
  }

  Future<MyResponse> addGroup(GroupModel group) async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();

    try {
      var data = await instance.collection("groups").add(group.toJson());
      instance.collection("groups").doc(data.id).update({"groupId": data.id});
    } catch (e) {
      myResponse.message = e.toString();
    }

    return myResponse;
  }

  Future<MyResponse> addStudentsToTheGroup(
      String groupId, List students) async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();
    try {
      for (var i in students) {
        await instance
            .collection("students")
            .doc(i)
            .update({"groupId": groupId});
      }
      await instance
          .collection("groups")
          .doc(groupId)
          .update({"students": students});
    } catch (e) {
      myResponse.message = e.toString();
    }

    return myResponse;
  }

  Future<MyResponse> removeStudentsToTheGroup(
      {required String removed,
      required List allStudents,
      required String groupId}) async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();

    allStudents.remove(removed);
    print(allStudents.runtimeType);
    print("MANAA");
    print("MANA $groupId");
    try {
      // await instance
      //     .collection("students")
      //     .doc(removed)
      //     .update({"groupId": ''});

      await instance
          .collection("groups")
          .doc(groupId)
          .update({"students": allStudents});
    } catch (e) {
      myResponse.message = e.toString();
    }

    return myResponse;
  }

  Future<MyResponse> getGroupsStudents(List docIds) async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();
    List documents = [];
    try {
      for (String documentId in docIds) {
        var snapshot = await instance
            .collection("students")
            .where("docId", isEqualTo: documentId)
            .get();
        documents.add(snapshot.docs.first);
      }
      myResponse.data =
          documents.map((e) => StudentModel.fromJson(e.data())).toList();
    } catch (e) {
      myResponse.message = e.toString();
    }

    return myResponse;
  }
}
