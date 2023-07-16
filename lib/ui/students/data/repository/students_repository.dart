import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class StudentsRepository {
  static FirebaseFirestore? firebaseFirestore;
  static FirebaseAuth? auth;

  static FirebaseAuth getAuthInstance() => auth ?? FirebaseAuth.instance;

  static FirebaseFirestore getFirebaseInstance() =>
      firebaseFirestore ?? FirebaseFirestore.instance;

  Future<MyResponse> getAllUsers() async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();

    try {
      var some = await instance.collection("students").get();
      List<StudentModel> users =
          some.docs.map((e) => StudentModel.fromJson(e.data())).toList();
      myResponse.data = users;
    } catch (e) {
      print(e.toString());
      myResponse.message = e.toString();
    }

    return myResponse;
  }

  Future<MyResponse> addStudent(StudentModel student, String email) async {
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
