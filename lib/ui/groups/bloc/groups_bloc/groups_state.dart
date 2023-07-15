part of 'groups_bloc.dart';

@immutable
class GroupsState extends Equatable {
  ResponseStatus status;
  List<GroupModel> groups;
  String message;
  List<StudentModel> groupsStudents;
  ResponseStatus groupsStudentsStatus;

  GroupsState(
      {this.message = '',
      required this.groups,
      required this.groupsStudents,
      this.groupsStudentsStatus = ResponseStatus.pure,
      this.status = ResponseStatus.pure});

  copyWith(
          {ResponseStatus? status,
          List<GroupModel>? groups,
          String? message,
          List<StudentModel>? groupsStudents,
          ResponseStatus? groupsStudentsStatus}) =>
      GroupsState(
          message: message ?? this.message,
          groupsStudents: groupsStudents ?? this.groupsStudents,
          groupsStudentsStatus:
              groupsStudentsStatus ?? this.groupsStudentsStatus,
          status: status ?? this.status,
          groups: groups ?? this.groups);
  @override
  List<Object?> get props =>
      [status, groups, message, groupsStudentsStatus, groupsStudents];
}
