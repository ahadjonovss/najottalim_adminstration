import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class StudentModel {
  final String userId;
  final String docId;
  final String groupId;
  final String name;
  final String surname;
  final List balls;
  GroupModel? group;
  final String email;
  final String password;

  StudentModel(
      {required this.balls,
      required this.email,
      this.password = "12345678",
      required this.docId,
      this.group,
      required this.groupId,
      required this.name,
      required this.surname,
      required this.userId});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        email: json["email"] ?? '',
        balls: (json['balls'] ?? []).map((e) => BallModel.fromJson(e)).toList(),
        docId: json["docId"] ?? '',
        groupId: json["groupId"] ?? '',
        name: json["name"] ?? '',
        surname: json["surname"] ?? '',
        password: json["password"] ?? '',
        userId: json["userId"] ?? '');
  }

  toJson() {
    return {
      "balls": [],
      "docId": docId,
      "groupId": groupId,
      "name": name,
      "surname": surname,
      "email": email,
      "password": password
    };
  }

  toGroupJson(String newGroupId) {
    return {
      "balls": [],
      "docId": docId,
      "groupId": newGroupId,
      "name": name,
      "surname": surname,
      "email": email,
      "password": password
    };
  }
}
