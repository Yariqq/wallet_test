import 'package:bloc/bloc.dart';
import 'package:wallet_app/core/blocs/bloc_utils.dart';

import '../../../calendar/domain/model/category.dart';
import '../../../calendar/domain/usecase/get_available_categories_usecase.dart';
import '../../domain/usecase/add_category_usecase.dart';
import '../../domain/usecase/delete_category_usecase.dart';
import '../../domain/usecase/edit_category_usecase.dart';

class SettingsBloc extends Bloc<BaseEvent, SettingsState> {
  final GetAvailableCategoriesUseCase _getAvailableCategoriesUseCase;
  final AddCategoryUseCase _addCategoryUseCase;
  final DeleteCategoryUseCase _deleteCategoryUseCase;
  final EditCategoryUseCase _editCategoryUseCase;

  SettingsBloc(this._getAvailableCategoriesUseCase, this._addCategoryUseCase,
      this._deleteCategoryUseCase, this._editCategoryUseCase)
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
          eventState: AddingCategorySuccessEventState(),
        );
      } catch (e) {
        yield SettingsState(
            availableCategories: state.data, eventState: ErrorEventState(e));
      }
    } else if (event is DeleteCategoryEvent) {
      try {
        yield SettingsState(
          availableCategories: state.data,
          eventState: LoadingEventState(),
        );

        await _deleteCategoryUseCase.execute(event.categoryId);

        yield SettingsState(
          availableCategories: state.data,
          eventState: DeletingCategorySuccessEventState(),
        );
      } catch (e) {
        yield SettingsState(
            availableCategories: state.data, eventState: ErrorEventState(e));
      }
    } else if (event is EditCategoryEvent) {
      try {
        yield SettingsState(
          availableCategories: state.data,
          eventState: LoadingEventState(),
        );

        await _editCategoryUseCase.execute(
          EditCategoryUseCaseParams(
            categoryId: event.categoryId,
            newName: event.newName,
          ),
        );

        yield SettingsState(
          availableCategories: state.data,
          eventState: EditingCategorySuccessEventState(),
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

class DeleteCategoryEvent extends BaseEvent {
  final int categoryId;

  DeleteCategoryEvent({required this.categoryId});
}

class EditCategoryEvent extends BaseEvent {
  final int categoryId;
  final String newName;

  EditCategoryEvent({required this.categoryId, required this.newName});
}

class UnknownEventState extends BaseEventState {}

class LoadingEventState extends BaseEventState {}

class SuccessEventState extends BaseEventState {}

class AddingCategorySuccessEventState extends BaseEventState {}

class DeletingCategorySuccessEventState extends BaseEventState {}

class EditingCategorySuccessEventState extends BaseEventState {}

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
