import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  GroupsBloc() : super(GroupsState(groups: [])) {
    on<GetAllGroupsEvent>(getAllUsers);
  }

  getAllUsers(GetAllGroupsEvent event, emit) async {
    emit(state.copyWith(status: ResponseStatus.inProgress));
    MyResponse myResponse = await getIt<GroupsRepository>().getAllGroups();
    if (myResponse.message.isNull) {
      emit(state.copyWith(
          status: ResponseStatus.inSuccess, groups: myResponse.data));
    } else {
      emit(state.copyWith(status: ResponseStatus.inFail));
      print(myResponse.message);
    }
  }
}
