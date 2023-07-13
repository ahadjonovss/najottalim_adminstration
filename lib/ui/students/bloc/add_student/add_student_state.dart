part of 'add_student_bloc.dart';

@immutable
class AddStudentState extends Equatable {
  ResponseStatus status;
  String message;
  String name;
  String surname;
  String email;

  AddStudentState({
    this.status = ResponseStatus.pure,
    this.message = '',
    this.surname = '',
    this.name = '',
    this.email = '',
  });

  copyWith({
    ResponseStatus? status,
    String? message,
    String? name,
    String? surname,
    String? email,
  }) =>
      AddStudentState(
          status: status ?? this.status,
          message: message ?? this.message,
          email:
              "${(name ?? this.name).toLowerCase().replaceAll("'", '')}${(surname ?? this.surname).toLowerCase().replaceAll("'", '')}${DateTime.now().microsecond}@gmail.com",
          name: name ?? this.name,
          surname: surname ?? this.surname);
  @override
  List<Object?> get props => [status, message, name, surname, email];
}
