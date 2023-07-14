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
      List<TeacherModel> users =
          some.docs.map((e) => TeacherModel.fromJson(e.data())).toList();
      myResponse.data = users;
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
}
