// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetRecipesEvent extends HomeEvent {
  String query;

  GetRecipesEvent({
    required this.query,
  });
  @override
  List<Object> get props => [query];
}

class SearchRecipesLoadedEvent extends HomeEvent {
  final String searchKey;
  final List<Hit> recipeData;
  final List<Hit> searchData;

  const SearchRecipesLoadedEvent({
    required this.searchKey,
    required this.recipeData,
    required this.searchData,
  });

  @override
  List<Object> get props => [searchKey, recipeData, searchData];
}
