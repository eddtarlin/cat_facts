part of 'fact_bloc.dart';

@immutable
abstract class FactState {}

class FactInitial extends FactState {}

class FactLoading extends FactState {}

class RandomCatFact extends FactState {
  final CatFact catFact;
  final String image;
  RandomCatFact({
    required this.catFact,
    required this.image,
  });
}

class CatsFacts extends FactState {
  final List<CatFact> catFacts;
  CatsFacts({required this.catFacts});
}
