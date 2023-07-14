import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

part 'add_group_to_teacher_event.dart';
part 'add_group_to_teacher_state.dart';

class AddGroupToTeacherBloc
    extends Bloc<AddGroupToTeacherEvent, AddGroupToTeacherState> {
  AddGroupToTeacherBloc() : super(AddGroupToTeacherState(selectedGroups: [])) {
    on<SelectGroupEvent>(selectGroup);
    on<AddGroupsToTheTeacherEvent>(addStudentsToTheGroup);
  }

  selectGroup(SelectGroupEvent event, emit) {
    List<GroupModel> groups = state.selectedGroups;
    if (groups.contains(event.group)) {
      groups.remove(event.group);
    } else {
      groups.add(event.group);
    }
    emit(state.copyWith(selectedGroups: groups));
  }

  addStudentsToTheGroup(AddGroupsToTheTeacherEvent event, emit) async {
    emit(state.copyWith(status: ResponseStatus.inProgress));
    List groups = [];
    groups.addAll(event.groups.cast());
    groups.addAll(state.selectedGroups.map((e) => e.groupId));
    print(groups);
    MyResponse myResponse = await getIt<TeachersRepository>()
        .addGroupsToTeachers(event.teacherId, groups);
    if (myResponse.message.isNull) {
      emit(state.copyWith(status: ResponseStatus.inSuccess));
    } else {
      emit(state.copyWith(
          status: ResponseStatus.inFail, message: myResponse.message));
    }
  }
}
