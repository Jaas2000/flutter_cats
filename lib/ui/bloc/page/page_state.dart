part of 'page_bloc.dart';

class PageState extends Equatable {
  final List<Cat>? cats;

  const PageState({
    this.cats,
  });

  PageState copyWith({
    List<Cat>? cats
  }) {
    return PageState(
      cats: cats ?? this.cats
    );
  }
  @override
  List<Object?> get props => [cats];
}

class InitialState extends PageState {
  const InitialState();
}

class ErrorState extends PageState {
  const ErrorState();
}

class HomeState extends PageState {
  final List<Cat> cat;
  const HomeState({required this.cat});
}


