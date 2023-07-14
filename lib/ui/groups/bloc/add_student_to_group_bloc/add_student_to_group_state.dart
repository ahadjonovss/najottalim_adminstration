part of 'add_student_to_group_bloc.dart';

@immutable
class AddStudentToGroupState extends Equatable {
  List<StudentModel> selectedStudents;
  ResponseStatus status;
  String message;

  AddStudentToGroupState(
      {required this.selectedStudents,
      this.status = ResponseStatus.pure,
      this.message = ''});

  copyWith({
    List<StudentModel>? selectedStudents,
    ResponseStatus? status,
    String? message,
  }) =>
      AddStudentToGroupState(
          selectedStudents: selectedStudents ?? this.selectedStudents,
          status: status ?? this.status,
          message: message ?? this.message);

  @override
  List<Object?> get props => [selectedStudents, message, status];
}
