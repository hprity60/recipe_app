import 'package:recipe_app/features/home/data/models/recipes_response_model.dart';

abstract class GetRecipesRemoteDataSource {
  Future<RecipesResponseModel> searchRecipe();
}