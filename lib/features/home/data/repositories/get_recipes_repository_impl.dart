// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:recipe_app/features/home/data/models/recipes_response_model.dart';
import 'package:recipe_app/features/home/domain/repositories/get_recipes_repository.dart';

import '../datasources/remote_data_sources.dart/get_recipes_remote_data_source.dart';

class GetRecipesRepositoryImpl implements GetRecipesRepository {
  final GetRecipesRemoteDataSource getRecipesRemoteDataSource;
  GetRecipesRepositoryImpl({
    required this.getRecipesRemoteDataSource,
  });

  @override
  Future<RecipesResponseModel> searchRecipe() async {
    try {
      final RecipesResponseModel recipesResponseModel =
          await getRecipesRemoteDataSource.searchRecipe();

      return recipesResponseModel;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
