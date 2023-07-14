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
      String groupId, List<StudentModel> students) async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();

    try {
      for (var i in students) {
        await instance
            .collection("students")
            .doc(i.docId)
            .update({"groupId": groupId});
      }
      await instance
          .collection("groups")
          .doc(groupId)
          .update({"students": students.map((e) => e.toGroupJson(groupId))});
    } catch (e) {
      myResponse.message = e.toString();
    }

    return myResponse;
  }
}
