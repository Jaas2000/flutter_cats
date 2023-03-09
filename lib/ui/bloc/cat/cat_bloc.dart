import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cat_breeds/domain/entities/cat_entity.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  CatBloc() : super(const InitialState()) {
    on<InitialCatEvent>((event, emit)=> emit(state.copyWith(cats: event.cats)));

    on<FilterText>((event, emit) {
      List<Cat> filterCats = state.cats!.where((value){
        return value.name!
            .toLowerCase()
            .contains(event.text.toLowerCase());
      }).toList();

      if( event.text == "" ){
        emit(SearchState(cats: state.cats!));
      } else {
        emit(SearchState(cats: filterCats));
      }

    });

  }
}
