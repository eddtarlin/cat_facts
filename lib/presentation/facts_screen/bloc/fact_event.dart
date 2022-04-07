part of 'fact_bloc.dart';

@immutable
abstract class FactEvent {}

class GetRandomCatFact extends FactEvent {}

class SaveCatFact extends FactEvent {
  final CatFact catFact;
  SaveCatFact({required this.catFact});
}

class GetSavedCatFacts extends FactEvent {}
