part of 'cat_bloc.dart';

abstract class CatEvent extends Equatable {
  const CatEvent();
  @override
  List<Object> get props => [];
}

class InitialCatEvent extends CatEvent {
  final List<Cat> cats;
  const InitialCatEvent({required this.cats});
}

class FilterText extends CatEvent{
  final String text;
  const FilterText({required this.text});
}