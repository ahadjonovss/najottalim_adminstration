part of 'add_group_to_teacher_bloc.dart';

@immutable
class AddGroupToTeacherState extends Equatable {
  List<GroupModel> selectedGroups;
  ResponseStatus status;
  String message;

  AddGroupToTeacherState(
      {required this.selectedGroups,
      this.status = ResponseStatus.pure,
      this.message = ''});

  copyWith({
    List<GroupModel>? selectedGroups,
    ResponseStatus? status,
    String? message,
  }) =>
      AddGroupToTeacherState(
          selectedGroups: selectedGroups ?? this.selectedGroups,
          status: status ?? this.status,
          message: message ?? this.message);

  @override
  List<Object?> get props => [selectedGroups, message, status];
}
