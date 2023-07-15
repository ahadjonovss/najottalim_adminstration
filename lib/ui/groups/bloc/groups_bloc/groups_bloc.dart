import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  GroupsBloc() : super(GroupsState(groups: [], groupsStudents: [])) {
    on<GetAllGroupsEvent>(getAllUsers);
    on<GetGroupsStudentsEvent>(getGroupsStudents);
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

  getGroupsStudents(GetGroupsStudentsEvent event, emit) async {
    emit(state.copyWith(groupsStudentsStatus: ResponseStatus.inProgress));
    MyResponse myResponse =
        await getIt<GroupsRepository>().getGroupsStudents(event.studentIds);
    if (myResponse.message.isNull) {
      emit(state.copyWith(
          groupsStudentsStatus: ResponseStatus.inSuccess,
          groupsStudents: myResponse.data));
    } else {
      emit(state.copyWith(groupsStudentsStatus: ResponseStatus.inFail));
    }
  }
}
