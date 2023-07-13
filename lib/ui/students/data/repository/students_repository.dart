import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class StudentsRepository {
  static FirebaseFirestore? firebaseFirestore;

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
      myResponse.message = e.toString();
    }

    return myResponse;
  }
}
