import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class TeachersRepository {
  static FirebaseFirestore? firebaseFirestore;
  static FirebaseAuth? auth;

  static FirebaseAuth getAuthInstance() => auth ?? FirebaseAuth.instance;

  static FirebaseFirestore getFirebaseInstance() =>
      firebaseFirestore ?? FirebaseFirestore.instance;

  Future<MyResponse> getAllTeachers() async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();

    try {
      var some = await instance.collection("teachers").get();
      myResponse.data =
          some.docs.map((e) => TeacherModel.fromJson(e.data())).toList();
    } catch (e) {
      myResponse.message = e.toString();
    }
    return myResponse;
  }

  Future<MyResponse> addTeacher(TeacherModel teacher, String email) async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();
    FirebaseAuth authInstance = getAuthInstance();

    try {
      UserCredential result = await authInstance.createUserWithEmailAndPassword(
          email: email, password: "12345678");
      var data = await instance.collection("teachers").add(teacher.toJson());
      instance
          .collection("teachers")
          .doc(data.id)
          .update({"userId": result.user!.uid, "teacherId": data.id});
    } catch (e) {
      myResponse.message = e.toString();
    }

    return myResponse;
  }

  Future<MyResponse> getTeachersGroup(List docIds) async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();
    List documents = [];
    try {
      for (String documentId in docIds) {
        var snapshot = await instance
            .collection("groups")
            .where("groupId", isEqualTo: documentId)
            .get();
        documents.add(snapshot.docs.first);
      }
      myResponse.data =
          documents.map((e) => GroupModel.fromJson(e.data())).toList();
    } catch (e) {
      print(e.toString());
      myResponse.message = e.toString();
    }

    return myResponse;
  }

  Future<MyResponse> addGroupsToTeachers(String teacherId, List groups) async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();

    try {
      await instance
          .collection("teachers")
          .doc(teacherId)
          .update({"groupIds": groups});
    } catch (e) {
      myResponse.message = e.toString();
    }

    return myResponse;
  }
}
