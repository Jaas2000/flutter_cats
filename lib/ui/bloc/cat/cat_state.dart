part of 'cat_bloc.dart';

  class CatState extends Equatable {
  final List<Cat>? cats;

  const CatState({
    this.cats,
  });

  CatState copyWith({
    List<Cat>? cats
  }) {
    return CatState(
      cats: cats ?? this.cats
    );
  }
  @override
  List<Object?> get props => [cats];
}

class InitialState extends CatState {
  const InitialState();
}

class SearchState extends CatState {
  final List<Cat> cats;
  const SearchState({required this.cats});
}

