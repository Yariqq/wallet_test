import 'package:bloc/bloc.dart';
import 'package:wallet_app/calendar/domain/model/category.dart';
import 'package:wallet_app/calendar/domain/usecase/get_available_categories_usecase.dart';
import 'package:wallet_app/core/blocs/bloc_utils.dart';
import 'package:wallet_app/settings/domain/usecase/add_category_usecase.dart';

class SettingsBloc extends Bloc<BaseEvent, SettingsState> {
  final GetAvailableCategoriesUseCase _getAvailableCategoriesUseCase;
  final AddCategoryUseCase _addCategoryUseCase;

  SettingsBloc(this._getAvailableCategoriesUseCase, this._addCategoryUseCase)
      : super(SettingsState(
            availableCategories: [], eventState: UnknownEventState()));

  @override
  Stream<SettingsState> mapEventToState(BaseEvent event) async* {
    if (event is FetchCategoriesEvent) {
      try {
        yield SettingsState(
          availableCategories: state.data,
          eventState: LoadingEventState(),
        );

        final categories = await _getAvailableCategoriesUseCase.execute(null);

        yield SettingsState(
          availableCategories: categories,
          eventState: SuccessEventState(),
        );
      } catch (e) {
        yield SettingsState(
            availableCategories: state.data, eventState: ErrorEventState(e));
      }
    } else if (event is AddCategoryEvent) {
      try {
        yield SettingsState(
          availableCategories: state.data,
          eventState: LoadingEventState(),
        );

        await _addCategoryUseCase.execute(
          AddCategoryUseCaseParams(name: event.name),
        );

        yield SettingsState(
          availableCategories: state.data,
          eventState: SuccessEventState(),
        );
      } catch (e) {
        yield SettingsState(
            availableCategories: state.data, eventState: ErrorEventState(e));
      }
    }
  }
}

class FetchCategoriesEvent extends BaseEvent {}

class AddCategoryEvent extends BaseEvent {
  final String name;

  AddCategoryEvent({required this.name});
}

class UnknownEventState extends BaseEventState {}

class LoadingEventState extends BaseEventState {}

class SuccessEventState extends BaseEventState {}

class ErrorEventState extends BaseEventState {
  final Object error;

  ErrorEventState(this.error);
}

class SettingsState extends BaseState<List<Category>> {
  SettingsState(
      {required List<Category> availableCategories,
      required BaseEventState eventState})
      : super(availableCategories, eventState);
}
