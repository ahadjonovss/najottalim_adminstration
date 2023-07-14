part of 'teachers_bloc.dart';

@immutable
class TeachersState extends Equatable {
  ResponseStatus status;
  List<TeacherModel> teachers;
  String message;

  TeachersState(
      {this.message = '',
      required this.teachers,
      this.status = ResponseStatus.pure});

  copyWith({
    ResponseStatus? status,
    List<TeacherModel>? teachers,
    String? message,
  }) =>
      TeachersState(
          message: message ?? this.message,
          status: status ?? this.status,
          teachers: teachers ?? this.teachers);
  @override
  List<Object?> get props => [status, teachers, message];
}
