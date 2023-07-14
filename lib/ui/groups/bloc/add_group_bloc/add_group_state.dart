part of 'add_group_bloc.dart';

@immutable
class AddGroupState extends Equatable {
  ResponseStatus status;
  String message;
  String groupName;
  String room;
  String lessonTime;

  AddGroupState({
    this.status = ResponseStatus.pure,
    this.message = '',
    this.groupName = '',
    this.room = '',
    this.lessonTime = '',
  });

  copyWith({
    ResponseStatus? status,
    String? message,
    String? groupName,
    String? room,
    String? lessonTime,
  }) =>
      AddGroupState(
          status: status ?? this.status,
          message: message ?? this.message,
          groupName: groupName ?? this.groupName,
          room: room ?? this.room,
          lessonTime: lessonTime ?? this.lessonTime);
  @override
  List<Object?> get props => [status, message, groupName, room, lessonTime];
}
