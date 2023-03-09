import 'package:bloc/bloc.dart';
import 'package:cat_breeds/data/services/cat_service.dart';
import 'package:cat_breeds/domain/entities/cat_entity.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(const PageState(cats: [])) {
    on<InitialPageEvent>((event, emit) async {
      try {
        emit(const InitialState());
        final response = await CatService().list();
        emit(HomeState(cat: response));
      } catch (e) {
        emit(const ErrorState());
      }
    });

    on<FilteredCats>((event, emit) { 
      emit(const InitialState());
      emit(HomeState(cat: event.cats));
    });
  }
}
