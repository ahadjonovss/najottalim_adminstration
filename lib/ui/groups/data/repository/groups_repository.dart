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

  Future<MyResponse> addGroup(StudentModel student, String email) async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();
    FirebaseAuth authInstance = getAuthInstance();

    try {
      UserCredential result = await authInstance.createUserWithEmailAndPassword(
          email: email, password: "12345678");
      var data = await instance.collection("students").add(student.toJson());
      instance
          .collection("students")
          .doc(data.id)
          .update({"userId": result.user!.uid, "docId": data.id});
    } catch (e) {
      myResponse.message = e.toString();
    }

    return myResponse;
  }
}
