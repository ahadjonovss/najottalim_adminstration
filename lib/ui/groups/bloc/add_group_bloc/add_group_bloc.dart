import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

part 'add_group_event.dart';
part 'add_group_state.dart';

class AddGroupBloc extends Bloc<AddGroupEvent, AddGroupState> {
  AddGroupBloc() : super(AddGroupState()) {
    on<UpdateGroupInfoEvent>(updateInfo);
    on<SaveGroupEvent>(addGroup);
  }

  updateInfo(UpdateGroupInfoEvent event, emit) {
    emit(state.copyWith(
        groupName: event.groupName,
        room: event.room,
        lessonTime: event.lessonTime));
  }

  addGroup(SaveGroupEvent event, emit) async {
    emit(state.copyWith(status: ResponseStatus.inProgress));
    MyResponse myResponse = await getIt<GroupsRepository>().addGroup(GroupModel(
        groupName: state.groupName,
        lessonTime: state.lessonTime,
        groupId: '',
        students: [],
        room: state.room));

    if (myResponse.message.isNull) {
      emit(state.copyWith(status: ResponseStatus.inSuccess));
    } else {
      emit(state.copyWith(status: ResponseStatus.inFail));
    }
    emit(state.copyWith(status: ResponseStatus.pure));
  }
}
