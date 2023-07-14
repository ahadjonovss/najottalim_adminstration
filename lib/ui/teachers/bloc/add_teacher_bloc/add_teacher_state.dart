part of 'add_teacher_bloc.dart';

@immutable
class AddTeacherState extends Equatable {
  ResponseStatus status;
  String message;
  String name;
  String surname;
  String email;

  AddTeacherState({
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
      AddTeacherState(
          status: status ?? this.status,
          message: message ?? this.message,
          email: email ?? this.email,
          name: name ?? this.name,
          surname: surname ?? this.surname);
  @override
  List<Object?> get props => [status, message, name, surname, email];
}
