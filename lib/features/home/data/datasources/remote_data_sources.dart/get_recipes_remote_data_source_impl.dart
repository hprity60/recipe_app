import 'package:dio/dio.dart';
import 'package:recipe_app/features/home/data/models/recipes_response_model.dart';

import '../../../../../core/network/dio_client.dart';
import '../../../../../core/values/app_strings.dart';
import 'get_recipes_remote_data_source.dart';

class GetRecipesRemoteDataSourceImpl implements GetRecipesRemoteDataSource {
  DioProvider dio;
  GetRecipesRemoteDataSourceImpl({
    required this.dio,
  });
  @override
  Future<RecipesResponseModel> searchRecipe() async {
    try {
      Response response = await dio.client.get(AppStrings.searchUrl);
      final responseBody = response.data;
      final RecipesResponseModel recipesResponseModel =
          RecipesResponseModel.fromJson(responseBody);
      return recipesResponseModel;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
