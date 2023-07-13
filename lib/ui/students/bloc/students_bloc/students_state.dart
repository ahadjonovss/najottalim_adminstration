part of 'students_bloc.dart';

@immutable
class StudentsState extends Equatable {
  ResponseStatus status;
  List<StudentModel> students;
  String message;

  StudentsState(
      {this.message = '',
      required this.students,
      this.status = ResponseStatus.pure});

  copyWith({
    ResponseStatus? status,
    List<StudentModel>? students,
    String? message,
  }) =>
      StudentsState(
          message: message ?? this.message,
          status: status ?? this.status,
          students: students ?? this.students);
  @override
  List<Object?> get props => [status, students, message];
}
