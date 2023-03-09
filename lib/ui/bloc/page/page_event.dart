part of 'page_bloc.dart';

abstract class PageEvent {}

class InitialPageEvent extends PageEvent {
  InitialPageEvent();
}

class FilteredCats extends PageEvent {
  final List<Cat> cats;
  FilteredCats({required this.cats});
}
