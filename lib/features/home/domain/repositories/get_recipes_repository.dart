import 'package:recipe_app/features/home/data/models/recipes_response_model.dart';

abstract class GetRecipesRepository {
  Future<RecipesResponseModel> searchRecipe();
}