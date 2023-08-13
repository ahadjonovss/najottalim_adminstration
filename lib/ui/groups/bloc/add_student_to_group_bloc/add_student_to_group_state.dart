part of 'add_student_to_group_bloc.dart';

@immutable
class AddStudentToGroupState extends Equatable {
  List<StudentModel> selectedStudents;
  ResponseStatus status;
  ResponseStatus removeStatus;
  String message;

  AddStudentToGroupState(
      {required this.selectedStudents,
      this.status = ResponseStatus.pure,
      this.removeStatus = ResponseStatus.pure,
      this.message = ''});

  copyWith({
    List<StudentModel>? selectedStudents,
    ResponseStatus? status,
    ResponseStatus? removeStatus,
    String? message,
  }) =>
      AddStudentToGroupState(
          removeStatus: removeStatus ?? this.removeStatus,
          selectedStudents: selectedStudents ?? this.selectedStudents,
          status: status ?? this.status,
          message: message ?? this.message);

  @override
  List<Object?> get props => [removeStatus, selectedStudents, message, status];
}
