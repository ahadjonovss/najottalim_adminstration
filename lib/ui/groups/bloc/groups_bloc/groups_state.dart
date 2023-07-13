part of 'groups_bloc.dart';

@immutable
class GroupsState extends Equatable {
  ResponseStatus status;
  List<GroupModel> groups;
  String message;

  GroupsState(
      {this.message = '',
      required this.groups,
      this.status = ResponseStatus.pure});

  copyWith({
    ResponseStatus? status,
    List<GroupModel>? groups,
    String? message,
  }) =>
      GroupsState(
          message: message ?? this.message,
          status: status ?? this.status,
          groups: groups ?? this.groups);
  @override
  List<Object?> get props => [status, groups, message];
}
