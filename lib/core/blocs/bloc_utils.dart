
abstract class BaseState<S> {
  final S data;
  final BaseEventState eventState;

  BaseState(this.data, this.eventState);
}

abstract class BaseEvent {}

abstract class BaseEventState {}