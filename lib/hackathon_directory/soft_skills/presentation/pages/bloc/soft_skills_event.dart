abstract class SoftSkillsEvent {
  const SoftSkillsEvent();

  const factory SoftSkillsEvent.changeTab(int index) = ChangeTabEvent;

  const factory SoftSkillsEvent.getData() = GetDataEvent;

  const factory SoftSkillsEvent.getUser() = GetUserEvent;
}

class ChangeTabEvent extends SoftSkillsEvent {
  final int index;

  const ChangeTabEvent(this.index);
}

class GetDataEvent extends SoftSkillsEvent {
  const GetDataEvent();
}

class GetUserEvent extends SoftSkillsEvent {
  const GetUserEvent();
}
