part of 'teachers_bloc.dart';

@immutable
class TeachersState extends Equatable {
  ResponseStatus status;
  ResponseStatus groupsStatus;
  List<TeacherModel> teachers;
  String message;
  List<GroupModel> groups;

  TeachersState(
      {this.message = '',
      required this.teachers,
      required this.groups,
      this.groupsStatus = ResponseStatus.pure,
      this.status = ResponseStatus.pure});

  copyWith({
    ResponseStatus? status,
    List<TeacherModel>? teachers,
    String? message,
    ResponseStatus? groupsStatus,
    List<GroupModel>? groups,
  }) =>
      TeachersState(
          groups: groups ?? this.groups,
          groupsStatus: groupsStatus ?? this.groupsStatus,
          message: message ?? this.message,
          status: status ?? this.status,
          teachers: teachers ?? this.teachers);
  @override
  List<Object?> get props => [status, teachers, message, groupsStatus, groups];
}
